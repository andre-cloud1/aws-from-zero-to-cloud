#!/bin/bash

echo "🔍 Verificando ambiente Devbox..."

# Verifica se Devbox está instalado
if ! command -v devbox &> /dev/null; then
  echo "❌ Devbox não está instalado ou não está no PATH."
  echo "ℹ️ Verifique se o Devbox foi ativado corretamente no Codespace."
  exit 1
fi

# Verifica se o terraform (instalado pelo devbox) está acessível
if ! command -v terraform &> /dev/null; then
  echo "🔺 Devbox não está ativo (Terraform não encontrado). Rodando 'devbox install'..."
  devbox install
else
  echo "✅ Ambiente Devbox detectado (Ferramentas OK)."
fi

# Lista de comandos a verificar
commands=("aws" "terraform" "jq" "docker" "git")

for cmd in "${commands[@]}"; do
  echo -n "🔧 Verificando $cmd... "
  if command -v $cmd &> /dev/null; then
    echo "✅ OK"
    $cmd --version | head -n 1
  else
    echo "❌ NÃO ENCONTRADO"
  fi
done

echo "✅ Verificação concluída."
