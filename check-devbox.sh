#!/bin/bash

echo "🔍 Verificando ambiente Devbox..."

# Verifica se Devbox está ativo
if [[ "$PS1" != *"(devbox)"* ]]; then
  echo "⚠️ Devbox não está ativo. Rodando 'devbox install'..."
  devbox install
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
