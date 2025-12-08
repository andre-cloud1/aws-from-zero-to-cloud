# ☁️ Lab: Automação de S3 com CloudFormation e CLI

Este laboratório faz parte da minha jornada no treinamento **Descomplicando AWS 2025** da LinuxTips. O objetivo foi provisionar infraestrutura de armazenamento sem utilizar o console gráfico da AWS, focando em automação e IaC.

## 🎯 Objetivos
- Configurar ambiente de desenvolvimento remoto com **Devbox** e **GitHub Codespaces**.
- Criar um Bucket S3 utilizando **AWS CloudFormation** (IaC).
- Gerenciar objetos (upload/delete) utilizando **AWS CLI**.

## 🛠️ Ferramentas Utilizadas
- **AWS CLI**: Para interação via terminal.
- **CloudFormation**: Para provisionamento de infraestrutura (YAML).
- **Devbox**: Para isolamento do ambiente e instalação de ferramentas (awscli, terraform, jq).
- **Git/GitHub**: Versionamento de código.

## 🚧 Desafios e Soluções
Durante a execução, enfrentei cenários reais de troubleshooting:

1.  **Erro de Permissão no Nix/Devbox:**
    - *Problema:* O ambiente não iniciava por falta de permissão na pasta `/nix`.
    - *Solução:* Ajuste de ownership com `sudo chown -R $USER /nix`.

2.  **Sintaxe do CloudFormation:**
    - *Problema:* Erro `Resource name... is non alphanumeric` ao tentar criar a stack.
    - *Solução:* Identifiquei que nomes lógicos no YAML não aceitam hífens (`-`). Ajustei de `s3-websiteBucket` para `S3WebsiteBucket`.

3.  **Deploy e Upload:**
    - Stack criada com sucesso (`CREATE_COMPLETE`).
    - Upload da badge de certificação realizado via CLI: `aws s3 cp imagem.png s3://meu-bucket/`.

## 📚 Aprendizados
- A importância de "Resources" bem definidos no template YAML.
- Como utilizar o `aws s3 presign` para gerar URLs temporárias seguras.
- A diferença entre fazer login (Autenticação) e ter permissão de criar recursos (Autorização - IAM).

---
*Este repositório documenta minha evolução técnica de Zero to Cloud.* 🚀
