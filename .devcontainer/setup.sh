#!/bin/bash
set -e

echo "🔧 Iniciando setup do ambiente Devbox..."

# Instala devbox se não estiver presente
if ! command -v devbox &>/dev/null; then
  echo "📦 Instalando Devbox..."
  curl -fsSL https://get.jetify.com/devbox | bash
  export PATH="$HOME/.devbox/bin:$PATH"
fi

# Persiste PATH em .bashrc
if ! grep -q 'export PATH=.*\.devbox/bin' /home/vscode/.bashrc 2>/dev/null; then
  echo 'export PATH=$HOME/.devbox/bin:$PATH' >> /home/vscode/.bashrc
fi

# Prepara /nix
echo "🔐 Configurando permissões de /nix..."
sudo mkdir -p /nix
sudo chown -R "$(id -un)":"$(id -gn)" /nix || true

# Instala dependências via devbox
echo "📚 Instalando dependências com Devbox..."
devbox install

# Verifica ambiente
echo "✅ Executando verificação de ambiente..."
bash ./check-devbox.sh

echo "✅ Setup completo!"
