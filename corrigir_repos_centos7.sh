#!/bin/bash

# Verifica se o usuário é root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root."
  exit 1
fi

echo "🔧 Corrigindo repositórios do CentOS 7 para usar vault.centos.org (HTTPS)..."

# Faz backup dos repositórios antigos
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/CentOS-*.repo /etc/yum.repos.d/backup/ 2>/dev/null

# Cria novo CentOS-Base.repo com base no vault
cat <<EOF > /etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-7 - Base
baseurl=https://vault.centos.org/7.9.2009/os/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7 - Updates
baseurl=https://vault.centos.org/7.9.2009/updates/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-7 - Extras
baseurl=https://vault.centos.org/7.9.2009/extras/\$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

# Limpa cache e recria
yum clean all
yum makecache

echo "✅ Repositórios atualizados com sucesso. Agora você pode executar: yum update -y"
