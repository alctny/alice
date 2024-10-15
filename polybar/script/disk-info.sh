#! /bin/bash

disks=(/dev/nvme0n1p4 /dev/nvme0n1p3)
names=( )

colors=(
  "#F0F8FF" "#F0F8FF" "#F0F8FF" "#99FF00" "#99FF00"
  "#99FF00" "#FF9900" "#FF9900" "#FF0000" "#FF0000"
)

i=0
output=""
for d in ${disks[@]}; do
  pcent=$(df $d --output=pcent | tail -n +2 | tr -d "% ")
  lev=$(($pcent / 10))
  output="$output %{F${colors[$lev]}}${names[$i]} $(printf %02d $pcent)%%{F-}"
  i=$(($i + 1))
done
echo $output
