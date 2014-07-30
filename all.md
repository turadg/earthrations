---
title: All choices
---

{% assign groups = site.data.all | group_by:'function' | sort:'name' %}
{% for group in groups %}
<h2>{{group.name}}</h2>

<table>
{% for choice in group.items %}
  <tr>
  	<td class="choice-name">
  		{{choice.choice}}
  	</td>
  	<td class="co2">
		{% if choice.co2-lb %}
  		{{choice.co2-lb}} lbs CO2 / {{choice.denominator}}
  		{% endif %}
  	</td>
  	<td class="water">
		{% if choice.water-gal %}
  		{{choice.water-gal}} gallons water / {{choice.denominator}}
  		{% endif %}
  	</td>
  	<td class="source">
  		{{choice.source-markdown | markdownify}}
  	</td>
  </tr>
{% endfor %}
</table>

{% endfor %}
