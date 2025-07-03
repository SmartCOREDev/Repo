✅ Passo 1: Crie o arquivo rocky.repo com os repositórios ativos
Execute:

 
sudo nano /etc/yum.repos.d/rocky.repo
E cole este conteúdo no editor:
 
[baseos]
name=Rocky Linux 9 - BaseOS
baseurl=https://dl.rockylinux.org/pub/rocky/9/BaseOS/x86_64/os/
enabled=1
gpgcheck=1
gpgkey=https://dl.rockylinux.org/pub/rocky/RPM-GPG-KEY-Rocky-9

[appstream]
name=Rocky Linux 9 - AppStream
baseurl=https://dl.rockylinux.org/pub/rocky/9/AppStream/x86_64/os/
enabled=1
gpgcheck=1
gpgkey=https://dl.rockylinux.org/pub/rocky/RPM-GPG-KEY-Rocky-9

[extras]
name=Rocky Linux 9 - Extras
baseurl=https://dl.rockylinux.org/pub/rocky/9/extras/x86_64/os/
enabled=1
gpgcheck=1
gpgkey=https://dl.rockylinux.org/pub/rocky/RPM-GPG-KEY-Rocky-9
Depois, salve com CTRL+O, ENTER, e saia com CTRL+X.

✅ Passo 2: Limpe o cache e atualize
 
sudo dnf clean all
sudo dnf makecache
Você deverá ver os repositórios sendo carregados novamente.

✅ Passo 3: Instale o Perl
 
sudo dnf install perl
Se quiser, também posso incluir o repositório do EPEL ou outros complementares.

Assim que isso funcionar, você poderá rodar novamente o mysqltuner. Me avise o que aparecer na saída, ou se preferir, posso te ajudar a interpretar!
