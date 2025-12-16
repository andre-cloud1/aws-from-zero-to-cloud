# ☁️ Guia de Comandos AWS CLI

Resumo dos comandos essenciais para gerenciar a nuvem pelo terminal.

---

## 🔐 1. Configuração e Identidade
Antes de começar, saiba quem você é.

| Ação | Comando |
| :--- | :--- |
| **Logar / Configurar** | `aws configure` |
| **Logar / Configurar** | `aws configure --profile=USUARIO-DA-CONTA-AQUI` |
| **Quem sou eu?** (Ver conta/ARN) | `aws sts get-caller-identity` |
| **Testar credenciais** | `aws sts get-caller-identity --query "Arn" --output text` |

---

## 🪣 2. Amazon S3 (Armazenamento)
*Atenção: Sempre use o prefixo `s3://` antes do nome do bucket.*

### Gerenciar Buckets
| Ação | Comando |
| :--- | :--- |
| **Listar todos os buckets** | `aws s3 ls` |
| **Criar um bucket** (Make Bucket) | `aws s3 mb s3://NOME-DO-BUCKET` |
| **Apagar um bucket** (Remove Bucket) | `aws s3 rb s3://NOME-DO-BUCKET` |
| **Apagar bucket CHEIO** (Forçar) | `aws s3 rb s3://NOME-DO-BUCKET --force` |

### Gerenciar Arquivos (Objetos)
| Ação | Comando |
| :--- | :--- |
| **Listar arquivos** dentro do bucket | `aws s3 ls s3://NOME-DO-BUCKET` |
| **Upload** (Subir arquivo) | `aws s3 cp arquivo.txt s3://NOME-DO-BUCKET/` |
| **Download** (Baixar arquivo) | `aws s3 cp s3://NOME-DO-BUCKET/arquivo.txt .` |
| **Deletar arquivo** | `aws s3 rm s3://NOME-DO-BUCKET/arquivo.txt` |
| **Sincronizar pasta** (O mais útil!) | `aws s3 sync ./minha-pasta s3://NOME-DO-BUCKET` |

---

## 🖥️ 3. Amazon EC2 (Máquinas Virtuais)
*Aqui os filtros são essenciais para limpar a saída.*

### Ações Básicas
| Ação | Comando |
| :--- | :--- |
| **Listar TUDO** (Cuidado: muito texto) | `aws ec2 describe-instances` |
| **Ligar instância** | `aws ec2 start-instances --instance-ids i-12345678` |
| **Desligar instância** | `aws ec2 stop-instances --instance-ids i-12345678` |

### 🔍 Filtros Inteligentes (Query)
Use isso para ver apenas o que importa (ID, IP e Status).

**Listar apenas ID e Status das máquinas:**
aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,Status:State.Name,IP:PublicIpAddress}" --output table

**Listar apenas máquinas que estão RODANDO:**
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId"

## 🏗️ 4. CloudFormation (IaC)
| Ação | Comando |
| :--- | :--- |
Listar Stacks (Pilhas)| `aws cloudformation list-stacks`
Criar Stack| `aws cloudformation create-stack --stack-name MEU-LAB --template-body file://template.yaml`
Deletar Stack| `aws cloudformation delete-stack --stack-name MEU-LAB`
Verificar progresso| `aws cloudformation describe-stacks --stack-name MEU-LAB --query ""Stacks[0].StackStatus"`