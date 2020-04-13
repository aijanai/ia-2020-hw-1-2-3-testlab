#!/bin/bash
cat hw.txt |while read i;
do
  name=$(echo $i|awk 'BEGIN{FS="/"} {print $4}');
  pushd $name;
  cp ../hw*py .;
  pipenv run python hw2.py;
  popd;
done
