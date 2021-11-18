#!/bin/bash
#This file should be sourced

#put ur Personal text file to save ur list
filename='/mnt/d/ashwi/College/tools/DL.txt';

function append() {
  if [ "$1" != "" ]; then
      echo $1 >> $filename;
  fi
}

function delete() {
  echo -e "    \e[1;4mBOOKMARKS\e[0m\n";

  local count=1;
  for i in $(cat $filename); do
    echo "$count. $i";
    count=$(($count+1));
  done
  wait

  echo -e -n "\nEnter choice: ";
  read count;
  
  sed -i ''$count''d'' $filename
}

function BookmarksLists(){
  echo -e "    \e[1;4mBOOKMARKS\e[0m\n";

  local count=1;
  for i in $(cat $filename); do
    echo "$count. $i";
    count=$(($count+1));
  done
  wait

  echo -e -n "\nEnter choice: ";
  read count;

  var=$(sed -n ${count}p $filename);
  cd $var;
}



if [[ "$1" == "add" ]]; then
  append $2;
elif [[ "$1" == "delete" ]]; then
  delete ;
else
  BookmarksLists;
fi


