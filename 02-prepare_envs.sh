#!/bin/bash

function try_change_branch {
  all=("$@")
  for branch in "${all[@]}";
  do
    git checkout $branch
    not_master=$?
    if [[ "$not_master" == "0" ]]; then
      echo "ATTENTION The branch is $branch"
      git reset --hard origin/$branch
      git pull origin $branch
      break
    fi
  done
}

cat hw.txt |while read i;
do
  name=$(echo $i|awk 'BEGIN{FS="/"} {print $4}');
  pushd $name;
  git fetch -a

  branches=("my-stuff" "stuff" "myChanges" "primo_homework" "first_homework" "homework/print-nodes" "uniform_cost" "master")

  try_change_branch "${branches[@]}"

  pipenv install -r requirements.txt;
  pipenv install -e .;
  popd;
done
