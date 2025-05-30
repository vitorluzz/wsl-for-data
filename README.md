# ⚙️ wsl-for-data

Um script completo para configurar rapidamente um ambiente de desenvolvimento no **WSL (Windows Subsystem for Linux)** com foco em **Python**, **Java**, **Apache Spark** e ferramentas essenciais para ciência de dados.

---

## 📋 Pré-requisitos

Antes de tudo, certifique-se de:

- Ter o **WSL** instalado no Windows
- Estar utilizando uma **distribuição Debian** (ou compatível)
- Ter o **Git** instalado no WSL

---

## Primeiros passos:

## 1 - 🐧 Instalando uma distribuição Linux Debian

**1.1** Para isso, vamos instalar o Debian:

```shell title='shell'
wsl --install -d Debian
```

**1.2** Acessando a distribuição instalada:

```shell title='shell'
wsl -d Debian
```

---
## 2 - 🔧 Atualizando o sistema e instalando o Git

**2.1** Vamos atualizar o sistema operacional:
```bash
sudo apt update && sudo apt full-upgrade
```

**2.2** Instalando o git:

```bash
sudo apt update && sudo apt install -y git
```

---

## 3 - 🚀 Como usar este projeto

**3.1** Vamos clonar este repositório em um diretório de projetos e executar o script de configuração:

```bash
# Crie uma pasta para seus projetos (caso ainda não exista)
mkdir -p ~/projects && cd ~/projects

# Clone o repositório
git clone https://github.com/vitorluzz/wsl-for-data.git

# Acesse a pasta do projeto
cd wsl-for-data

# Dê permissão de execução ao script
chmod +x setup.sh

# Execute o script
./setup.sh
```

**3.2** Depois disso, o ideal é atualizar o seu bashrc manualmente:
```bash
source ~/.bashrc
```

>🛠️ O script irá instalar Python, pip, venv, Java (JDK 21), Apache Spark, ferramentas úteis (como wget, curl, unzip) e configurar as variáveis de ambiente necessárias.