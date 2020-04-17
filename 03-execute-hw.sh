#!/bin/bash
cat hw.txt |while read i;
do
  name=$(echo $i|awk 'BEGIN{FS="/"} {print $4}');
  pushd $name;
  cp ../hw*py .;
  pipenv run python hw1.py > out.txt 2>/dev/null
  nodi=$(wc -l out.txt|awk '{print $1}')
  if (($nodi == 20)); then
    echo "ok: $nodi"
  else
    echo "ko: $nodi"
  fi
  popd;
done
