#!/bin/bash
set -e

echo "🔧 Iniciando setup do ambiente Devbox..."

# 1. Instala devbox se não estiver presente (Modo Forçado -f)
if ! command -v devbox &>/dev/null; then
  echo "📦 Instalando Devbox..."
  curl -fsSL https://get.jetify.com/devbox | bash -s -- -f
  
  # Adiciona ao PATH temporariamente para esta sessão
  export PATH=$HOME/.devbox/bin:$PATH
fi

# 2. Garante que o PATH fique salvo no .bashrc para o futuro
if ! grep -q 'export PATH=.*\.devbox/bin' ~/.bashrc 2>/dev/null; then
  echo 'export PATH=$HOME/.devbox/bin:$PATH' >> ~/.bashrc
fi

# 3. Prepara a pasta /nix (Correção de Permissão para evitar erros)
echo "🔒 Configurando permissões de /nix..."
if [ ! -d "/nix" ]; then
    sudo mkdir -p /nix
fi
sudo chown -R $USER /nix || true

# 4. Instala dependências do projeto (AWS CLI, Terraform, etc.)
echo "📦 Instalando pacotes definidos no devbox.json..."
devbox install

# 5. (Opcional) Executa verificação se o script check existir
if [ -f "./check-devbox.sh" ]; then
    echo "✅ Executando verificação de ambiente..."
    bash ./check-devbox.sh
fi

echo "✅ Setup completo! Pode rodar 'devbox shell' agora."