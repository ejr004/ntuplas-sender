#!/bin/sh
# Script para envio de e-mail das ntuplas

dia=`date +%Y-%m-%d`
hora=`date +%H:%M`
#server=SE
mailto=gridlafex@cbpf.br,melimcruzt@gmail.com,jussara@cbpf.br
#mailto=ejunior@cbpf.br
sender="gridlafex@cbpf.br"
dirraiz=/root/scripts
mailbody=$dirraiz/body.txt
logfile=$dirraiz/log/$DATA-$ARQ.log
arqanexo=$dirraiz/anexo.txt

#Informando total de arquivos transmitidos
totarq=`cat $dirraiz/log/*.log |grep 100%|wc -l`
/bin/echo $totarq > $arqanexo

#Anexando arquivos transmitidos
/bin/cat $dirraiz/log/*.log |grep 100% >> $arqanexo

#Enviando e-mail
/bin/echo -e "Prezados, segue em anexo relacao de ntuplas enviadas para focus102.\n \nTotal de: $totarq arquivos\n\n"| /bin/mail -s "Envio de ntuplas para focus102 em $dia " -r "$sender" -a $arqanexo $mailto

#Removendo arquivo anexo
/bin/rm -f $arqanexo

#Movendo logs antigos para diretorio old
/bin/mv $dirraiz/log/*.log $dirraiz/log/old/
