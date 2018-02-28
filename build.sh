#!/bin/bash

pushd ~
if [ ! -d "manual-reports" ]; then
  git clone https://github.com/how-is/manual-reports.git
fi
pushd manual-reports

rm ./*/_posts/*.html
rm ./json/*.json

function lpad2() { if [ "$(echo -n $1 | wc -c)" -eq 1 ]; then echo "0$1"; else echo $1; fi }

for y in {2016,2017}; do
  for ((m=1; m < 13; m++)); do
    ./_generate_reports.sh $y-$(lpad2 $m)-01
    echo
  done
done

