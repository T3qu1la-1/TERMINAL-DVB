#!/bin/bash
# -*- coding: utf-8 -*-
"""
🚀 CloudBR - Script de Inicialização Universal
Funciona em Linux, WSL, Termux e outros sistemas Unix-like
"""

clear

echo "=================================================================="
echo "🚀 CloudBR - Sistema de Processamento de Credenciais"
echo "=================================================================="
echo "📁 Processa arquivos TXT/ZIP/RAR até 4GB"
echo "🇧🇷 Filtro automático para URLs brasileiras" 
echo "⚡ Sistema multiplataforma"
echo "=================================================================="
echo ""

# Detecta o sistema operacional
OS_TYPE="Unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macOS"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS_TYPE="Windows"
elif [[ -n "$TERMUX_VERSION" ]]; then
    OS_TYPE="Termux"
fi

echo "🔍 Sistema detectado: $OS_TYPE"

# Função para verificar e instalar Python
verificar_python() {
    local python_cmd=""
    
    # Tenta diferentes comandos Python
    for cmd in python3 python python3.11 python3.10 python3.9; do
        if command -v "$cmd" &> /dev/null; then
            python_cmd="$cmd"
            break
        fi
    done
    
    if [ -z "$python_cmd" ]; then
        echo "❌ Python não encontrado!"
        echo "💡 Instalando Python..."
        
        if [[ "$OS_TYPE" == "Termux" ]]; then
            pkg update && pkg install python
        elif [[ "$OS_TYPE" == "Linux" ]] && command -v apt &> /dev/null; then
            sudo apt update && sudo apt install -y python3 python3-pip
        elif [[ "$OS_TYPE" == "Linux" ]] && command -v yum &> /dev/null; then
            sudo yum install -y python3 python3-pip
        elif [[ "$OS_TYPE" == "Linux" ]] && command -v pacman &> /dev/null; then
            sudo pacman -S python python-pip
        elif [[ "$OS_TYPE" == "macOS" ]] && command -v brew &> /dev/null; then
            brew install python3
        else
            echo "❌ Não foi possível instalar Python automaticamente"
            echo "💡 Por favor, instale o Python 3 manualmente e execute novamente"
            exit 1
        fi
        
        # Verifica novamente após instalação
        for cmd in python3 python; do
            if command -v "$cmd" &> /dev/null; then
                python_cmd="$cmd"
                break
            fi
        done
    fi
    
    echo "✅ Python encontrado: $python_cmd"
    echo "$python_cmd"
}

# Função para instalar pip se necessário
verificar_pip() {
    local python_cmd="$1"
    
    if ! $python_cmd -m pip --version &> /dev/null; then
        echo "📦 Instalando pip..."
        
        if [[ "$OS_TYPE" == "Termux" ]]; then
            pkg install python-pip
        elif command -v curl &> /dev/null; then
            curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
            $python_cmd get-pip.py
            rm -f get-pip.py
        else
            echo "❌ Não foi possível instalar pip automaticamente"
            exit 1
        fi
    fi
}

# Verifica Python
PYTHON_CMD=$(verificar_python)

# Verifica pip
verificar_pip "$PYTHON_CMD"

# Instala dependências do requirements.txt
echo "🔍 Verificando dependências Python..."

if [ -f "requirements.txt" ]; then
    echo "📦 Instalando dependências do requirements.txt..."
    $PYTHON_CMD -m pip install -r requirements.txt --user
else
    echo "📦 Instalando dependências básicas..."
    $PYTHON_CMD -m pip install flask rarfile requests --user
fi

echo "✅ Dependências instaladas!"

# Cria pasta de arquivos se não existir
if [ ! -d "cloudsaqui" ]; then
    echo "📁 Criando pasta 'cloudsaqui' para seus arquivos..."
    mkdir -p cloudsaqui
fi

# Verifica se o arquivo principal existe
if [ ! -f "terminal.py" ]; then
    echo "❌ Arquivo terminal.py não encontrado!"
    echo "💡 Certifique-se de estar na pasta correta do projeto"
    echo ""
    exit 1
fi

echo "✅ Sistema verificado!"
echo ""

# Inicia diretamente o sistema
echo "🚀 Iniciando CloudBR Terminal..."
echo "💡 Use Ctrl+C para sair a qualquer momento"
echo ""

$PYTHON_CMD terminal.py

echo ""
echo "👋 CloudBR finalizado. Obrigado!"