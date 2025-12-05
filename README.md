# aws-from-zero-to-cloud
Documenta minha jornada prática na nuvem, desde os fundamentos até a entrega de soluções completas. O objetivo é mostrar minha evolução “do zero à nuvem”, aplicando boas práticas de segurança, escalabilidade e automação.

## 🚀 Como iniciar o ambiente

1. **Crie um Codespace** com:
   - Branch: `main`
   - Região: `Europe West`
   - Máquina: `4-core`

2. **Aguarde a criação do container** com base no `.devcontainer.json`

3. **Ative o ambiente Devbox**:
   ```bash
   devbox shell

   Verifique as ferramentas:

aws --version
terraform --version

🧰 Ferramentas instaladas

AWS CLI

Terraform

jq

Docker

Git

📦 Arquivos importantes

devbox.json: define os pacotes do ambiente

.devcontainer.json: configura o container no Codespace

init-devbox.sh: script para ativar e testar o ambiente

🧪 Teste rápido

Execute:

./init-devbox.sh

Você verá as versões das ferramentas instaladas.


---

Esse setup garante que qualquer pessoa que abrir o Codespace tenha o ambiente pronto para seguir o curso sem erros.

Posso adicionar instruções para contribuir com o projeto ou configurar variáveis AWS se quiser expandir o README.
