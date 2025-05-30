#!/bin/bash

echo "


██╗    ██╗███████╗██╗         ███████╗███████╗████████╗██╗   ██╗██████╗ 
██║    ██║██╔════╝██║         ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
██║ █╗ ██║███████╗██║         ███████╗█████╗     ██║   ██║   ██║██████╔╝
██║███╗██║╚════██║██║         ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
╚███╔███╔╝███████║███████╗    ███████║███████╗   ██║   ╚██████╔╝██║     
 ╚══╝╚══╝ ╚══════╝╚══════╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
                                                                          

# 🛠️ WSL Setup Script: Debian + Python + Java + Spark
"

echo "Iniciando a configuração do ambiente WSL..."

# Etapa 1 - Atualizando pacotes e instalando essenciais
echo "📦 Atualizando pacotes e instalando essenciais..."
sudo apt update && sudo apt install -y wget curl tar unzip git coreutils python-is-python3 python3-pip python3.11-venv

# Etapa 2 - Configurando DNS fixo para WSL
echo "🌐 Corrigindo DNS..."
sudo rm /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "[network]" | sudo tee /etc/wsl.conf
echo "generateResolvConf = false" | sudo tee -a /etc/wsl.conf
sudo chattr +i /etc/resolv.conf

# Etapa 3 - Instalando Java JDK 21
echo "☕ Instalando Java JDK 21..."
mkdir -p ~/java && cd ~/java
wget https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz
tar -xvf openjdk-21.0.2_linux-x64_bin.tar.gz
rm openjdk-21.0.2_linux-x64_bin.tar.gz

# Adicionando variáveis do Java ao bashrc
echo "📄 Adicionando variáveis do Java ao bashrc..."
cat <<EOF >> ~/.bashrc

# JAVA
export JAVA_HOME=\$HOME/java/jdk-21.0.2
export PATH=\$PATH:\$JAVA_HOME/bin
EOF

# Etapa 4 - Instalando Apache Spark 3.5.5
echo "⚡ Instalando Apache Spark 3.5.5..."
mkdir ~/apache/ && cd ~/apache/
wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz
cd ~/apache/
tar -xvf spark-3.5.5-bin-hadoop3.tgz && rm spark-3.5.5-bin-hadoop3.tgz
mv spark-3.5.5-bin-hadoop3 spark-3.5.5

# Adicionando variáveis do Spark ao bashrc
echo "📄 Adicionando variáveis do Spark ao bashrc..."
cat <<EOF >> ~/.bashrc

# SPARK
export SPARK_HOME=\$HOME/apache/spark-3.5.5
export SPARK_LOCAL_IP=127.0.0.1
export HADOOP_HOME=\$SPARK_HOME
export PYTHONPATH=\$SPARK_HOME/python
export PATH=\$PATH:\$SPARK_HOME/bin
EOF

# Etapa final - Recarregando o bashrc para esta sessão
echo "🔄 Recarregando variáveis de ambiente para esta sessão..."
export JAVA_HOME=$HOME/java/jdk-21.0.2
export PATH=$PATH:$JAVA_HOME/bin
export SPARK_HOME=$HOME/apache/spark-3.5.5
export PATH=$PATH:$SPARK_HOME/bin
export PYTHONPATH=$SPARK_HOME/python

# Verificação final
echo "✅ Ambiente WSL configurado com sucesso!"

