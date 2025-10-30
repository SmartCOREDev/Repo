#!/bin/bash
# Script para instalar a última versão estável do Node.js no Rocky Linux 8.8
# Autor: ChatGPT
# Última atualização: 30/10/2025

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Este script precisa ser executado como root. Use: sudo $0"
    exit 1
fi

echo "🚀 Atualizando pacotes do sistema..."
dnf clean all -y >/dev/null 2>&1
dnf update -y

echo "📦 Instalando dependências necessárias..."
dnf install -y curl gcc-c++ make

echo "🌐 Adicionando repositório NodeSource (última versão LTS)..."
curl -fsSL https://rpm.nodesource.com/setup_current.x | bash -

echo "🧰 Instalando Node.js..."
dnf install -y nodejs

echo "🔍 Verificando instalação..."
node -v && npm -v

echo "✅ Node.js instalado com sucesso!"
echo "Versão do Node: $(node -v)"
echo "Versão do npm: $(npm -v)"
