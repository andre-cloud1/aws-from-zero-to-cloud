🔧 Iniciando setup do ambiente Devbox

# Instala devbox se não estiver presente 📦 
curl -fsSL https://get.jetify.com/devbox | bash -s -- -f

# Instala dependências via devbox 📚 Instalando dependências com Devbox...
devbox install

# Prepara /nix 🔐 Configurando permissões de /nix...
sudo mkdir -p /nix
sudo chown -R "$(id -un)":"$(id -gn)" /nix || true

# Ativar o ambiente Devbox
devbox shell

# Verifica ambiente ✅ Executando verificação de ambiente...
bash .devcontainer/setup.sh
bash ./check-devbox.sh


✅ Setup completo!
