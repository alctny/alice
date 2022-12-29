#! /bin/bash

cd ~
for f in `ls`
do
  if [ -d ${f} ];then
    new_name=`echo ${f} | tr [:upper:] [:lower:]`
    mv ${f} ${new_name}
  fi
done

cd ~/.config
while read line; do
  if [[ ${line} == \#* ]]; then
    echo ${line} >> temp
    continue
  fi
  dir_name=${line##*/}
  dir_name=`echo ${dir_name} | tr [:upper:] [:lower:]`
  echo ${line::`expr ${#line} - ${#dir_name} - 1`}${dir_name} >> user_dirs_temp
done < user-dirs.dirs

cat user_dirs_temp > user-dirs.dirs
rm user_dirs_temp