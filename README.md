# ntuplas-sender

Script to send ntuplas files to any server

### Installing
```
mkdir /root/scritps
cd /root/scritps
git clone this repo
```
## Scripts
```
ntuplas-envio.sh
ntuplas-batch.sh
ntuplas-mail.sh
```
## How to use this:

### Manipulação e envio de ntuplas
Os usuários do ambiente Focus enviam ntuplas via lxplus para o storage element da GRID (se).
Esses arquivos ficam espalhados dentro dos diretorios de dados, separados por suas datas:
```
/data/lhcb/<ANO-MES-DIA>/<ntuplasXXXX>
/data-ext/lhcb/<ANO-MES-DIA>/<ntuplasXXXX>
/data-ext2/lhcb/<ANO-MES-DIA>/<ntuplasXXXX>
```
Esses arquivos, depois que estão no SE, precisam ser enviados para o servidor, para que possam ser manipulados pelo grupo Focus.

Para isso foram criados 3 scripts:
```
ntuplas-envio.sh -a <ntuplasXXXX> -d <ANO-MES-DIA>
```
Script apenas de apoio, autoexplicativo, sendo responsavel por realizar a transmissão propriamente dita dos arquivos.

```
ntuplas-batch.sh
```
Script interativo. Solicita que o usuário entre com a relação de datas e arquivos e automanticamente instancia (via comando screen) utilizando o ntuplas-envio.sh

```
ntuplas-mail.sh
```
Após verificar que os arquivos já foram transmitidos (screen -ls e tail -f /root/scripts/log/XXXX) esse script reunie as saidas do scp, conta a quantidade de arquivos transmitidos e envia por email para os usuários (relacionados no script ntuplas-mail)

## Authors

* **Eraldo Jr** - *Initial work* -
