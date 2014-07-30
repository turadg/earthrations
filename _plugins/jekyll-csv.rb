# FROM https://gist.github.com/benbalter/1601b57e273cd1a01cbb

require 'csv'

module JekyllCsv
  class Generator < Jekyll::Generator
    def generate(site)
      dir = File.expand_path "_data", site.source
      return if site.safe && File.symlink?(dir)

      entries = Dir.chdir(dir) do
        Dir['*.csv']
      end

      entries.each do |entry|
        path = File.join(dir, entry)
        next if File.symlink?(path) && safe

        CSV::Converters[:blank_to_nil] = lambda do |field|
          field && field.empty? ? nil : field
        end

        # http://technicalpickles.com/posts/parsing-csv-with-ruby/
        body = File.open(path).read
        key = site.send(:sanitize_filename, File.basename(entry, '.*'))
        csv = CSV.new(body, :headers => true, :converters => [:all, :blank_to_nil])
        site.data[key] = csv.to_a.map {|row| row.to_hash }
      end
    end
  end
end
