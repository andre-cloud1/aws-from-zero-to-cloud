

# 📘 Guia de Sobrevivência Git - Meu Cheat Sheet

Este guia resume os comandos essenciais para o fluxo de trabalho diário no projeto AWS from Zero to Cloud.

---

## 1. O Conceito (Analogia da Mudança) 📦

Para não esquecer a ordem das coisas:

1.  **`git pull`**: Garante que tem tudo novo (arquivo atualizado)
2.  **`Ctrl + S`**: Você embrulhou o objeto em jornal (Salvou no disco).
3.  **`git status`**: Terminou uma tarefa? -> Confere
4.  **`git add .`**: Você colocou os objetos embrulhados dentro da **caixa de papelão** (Área de preparação/Stage).
5.  **`git commit -m "MENSAGE-AQUI"`**: Você **lacrou a caixa** com fita e colou uma etiqueta descrevendo o conteúdo (Salvou na história).
6.  **`git push`**: O **caminhão** levou a caixa para a casa nova na nuvem (Enviou para o GitHub).

7.  **``**:  


---

## 2. Configuração Inicial ⚙️
*(Rodar apenas uma vez quando mudar de computador)*

| Comando | Descrição |
| :--- | :--- |
| `git config --global user.name "Seu Nome"` | Define quem está fazendo as alterações. |
| `git config --global user.email "email@exemplo.com"` | Define o e-mail (deve ser igual ao do GitHub). |
| `gh auth login` | Faz login no GitHub CLI para não pedir senha toda hora. |

---

## 3. Comando,                   O que faz,                                                     Cuidado!

git log --oneline               ,Mostra o histórico resumido dos últimos commits.       ,Seguro.
git restore .                   ,Desfaz alterações nos arquivos que ainda não foram commitados. ,Perde o que você digitou hoje.
git reset --hard origin/main    ,Apaga TUDO que você fez localmente e deixa idêntico ao GitHub. ,A Bomba Atômica. Use só se quebrar tudo.
git lazy "Sua mensagem aqui"    ,add + commit + push        git config --global alias.lazy '!f() { git add . && git commit -m "$1" && git push origin main; }; f'