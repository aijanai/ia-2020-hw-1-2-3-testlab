#!/bin/bash
cat hw.txt |while read i;
do
  echo $i;
  name=$(echo $i|awk 'BEGIN{FS="/"} {print $4}');
  rm -fr $name;
  mkdir -p $name;
  git clone $i $name;
done
