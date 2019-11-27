#!/bin/sh
# Script de transferencia de arquivos do SE para a Focus102

dia=`date +%Y-%m-%d`
hora=`date +%H:%M`
server=SE
#mailto=gridlafex@cbpf.br,melimcruzt@gmail.com
#sender="gridlafex@cbpf.br"
#mailbody=/root/scripts/body.txt
#recebendo parametros -a ARQ -d ANO-MES-DIA
while getopts a:d: option
do
case "${option}"
in
a) ARQ=${OPTARG};;
d) DATA=${OPTARG};;
esac
done

logfile=/root/scripts/log/$DATA-$ARQ.log

echo "*************************************">>$logfile
echo " Iniciando copia das ntuplas $DATA-$ARQ no /data as $hora do dia $dia">>$logfile
echo "*************************************">>$logfile
/usr/bin/script -q -c "/usr/bin/scp /data/lhcb/$DATA/$ARQ* root@focus102:/data5/lhcb/JobsGrid/" >>$logfile

echo "*************************************">>$logfile
echo " Iniciando copia das ntuplas $DATA-$ARQ no /data-ext as $hora do dia $dia">>$logfile
echo "*************************************">>$logfile
/usr/bin/script -q -c "/usr/bin/scp /data-ext/lhcb/$DATA/$ARQ* root@focus102:/data5/lhcb/JobsGrid/" >>$logfile

echo "*************************************">>$logfile
echo " Iniciando copia das ntuplas $DATA-$ARQ no /data-ext2 as $hora do dia $dia">>$logfile
echo "*************************************">>$logfile
/usr/bin/script -q -c "/usr/bin/scp /data-ext2/lhcb/$DATA/$ARQ* root@focus102:/data5/lhcb/JobsGrid/" >>$logfile

echo "*************************************">>$logfile
echo "Copias finalizadas ntuples: $DATA-$ARQ as `date +%H:%M` do dia $dia ">>$logfile
echo '*************************************'>>$logfile
