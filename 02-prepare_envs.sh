#!/bin/bash

function change_branch {
  git checkout $1
  not_master=$?
  if [[ "$not_master" == "0" ]]; then
    echo "ATTENTION The branch is $1"
   git checkout $1
  fi
}

cat hw.txt |while read i;
do
  name=$(echo $i|awk 'BEGIN{FS="/"} {print $4}');
  pushd $name;
  git fetch -a

  change_branch "my-stuff"
  change_branch "stuff"
  change_branch "myChanges"
  change_branch "primo_homework"
  change_branch "first_homework"
  change_branch "homework/print-nodes"
  change_branch "uniform_cost"

  pipenv install -r requirements.txt;
  pipenv install -e .;
  popd;
done
