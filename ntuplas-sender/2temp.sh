#!/bin/bash

temps=`sensors | grep Core | cut -f2 -d '+' | cut -f1 -d '.'`

echo $temps

for i in $temps
do
   if test $i -gt 50 
  then
     echo "temperatura alta" 
     echo \t $temps            
     exec sendmail gridlafex@cbpf.br < /tmp/email.txt 
  fi
done
