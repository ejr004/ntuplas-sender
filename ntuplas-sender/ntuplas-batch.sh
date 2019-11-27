#/bin/sh
# Script de copia das ntuplas em modo Batch
dia=`date +%Y-%m-%d`
hora=`date +%H:%M`
script=/root/scripts/ntuplas-envio.sh
entrada=/root/scripts/ntuplas.txt
logfile=/root/scripts/log/ntuplas.log

/usr/bin/clear
echo "			*******************************************************"
echo " 			Esse script realiza a copia das ntuplas em modo batch"
echo " 			 Entre com os arquivos que deseja copiar no formato:"
echo " "
echo "			********************************************************"
echo " 					ANO-MES-DIA ARQUIVO "
echo "			********************************************************"
echo " "
echo " "
echo " "
read -p " Pressione enter para editar o arquivo ou CTRL-C para sair: "

# Edita arquivo com ntuplas e suas datas
/bin/vi $entrada
/usr/bin/clear

echo " "
echo " "
echo " "

# Le arquivo das ntuplas e instancia usando comando screen
while  read -r DATA ARQ; do
# Total de ntuplas a serem trasmitidas
totntuplas=`/bin/find /data*/lhcb/$DATA/ -name $ARQ*|wc -l`
# Testando se existem arquivos para a solicitacao
if [ $totntuplas = 0 ]; then
  echo " Não existem arquivos a serem transmitidos para  $DATA $ARQ => [$totntuplas] arquivos"
else
echo "-----------------------------------------------------------------">> $logfile
echo " Instanciando copia das ntuplas $ARQ $DATA">> $logfile
echo "-----------------------------------------------------------------">> $logfile
echo " Serao trasmitidas $DATA $ARQ => [$totntuplas] arquivos"
echo "-----------------------------------------------------------------">> $logfile

# Instanciando
/usr/bin/screen -S $DATA-$ARQ -D -m  $script -d $DATA -a $ARQ &
fi
done < $entrada

echo " "
echo " "
echo " "
echo "	********************************************************************"
echo "        			Instancias abertas:"
echo " "

#Lista instancias
/usr/bin/screen -ls

echo "  ********************************************************************"
echo "                             Arquivos de log:"
echo " "
#Lista arquivos de log
/bin/ls -ltr /root/scripts/log/

echo "	********************************************************************"
echo " 	    Verifique o andamento das instancias com /usr/bin/screen -ls"
echo "	********************************************************************"
