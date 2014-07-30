#!/bin/sh
curl --output _data/all.csv "https://docs.google.com/spreadsheets/d/1Gv_K5MF01rU4tbURiE3icreFYZCN7_7lw79080lIUQc/export?format=csv&id=1Gv_K5MF01rU4tbURiE3icreFYZCN7_7lw79080lIUQc&gid=0"
s3_website push
