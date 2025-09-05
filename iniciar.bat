@echo off
chcp 65001 >nul
title CloudBR - Sistema de Processamento de Credenciais

echo ==================================================================
echo 🚀 CloudBR - Sistema de Processamento de Credenciais
echo ==================================================================
echo 📁 Processa arquivos TXT/ZIP/RAR até 4GB
echo 🇧🇷 Filtro automático para URLs brasileiras
echo ⚡ Sistema multiplataforma
echo ==================================================================
echo.

echo 🔍 Sistema detectado: Windows

REM Verifica se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    python3 --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ Python não encontrado!
        echo 💡 Baixe e instale o Python em: https://python.org/downloads/
        echo.
        pause
        exit /b 1
    ) else (
        set PYTHON_CMD=python3
    )
) else (
    set PYTHON_CMD=python
)

echo ✅ Python encontrado: %PYTHON_CMD%

REM Instala dependências
echo 🔍 Verificando dependências Python...

if exist requirements.txt (
    echo 📦 Instalando dependências do requirements.txt...
    %PYTHON_CMD% -m pip install -r requirements.txt --user
) else (
    echo 📦 Instalando dependências básicas...
    %PYTHON_CMD% -m pip install flask rarfile requests --user
)

echo ✅ Dependências instaladas!

REM Cria pasta de arquivos se não existir
if not exist cloudsaqui (
    echo 📁 Criando pasta 'cloudsaqui' para seus arquivos...
    mkdir cloudsaqui
)

REM Verifica se o arquivo principal existe
if not exist terminal.py (
    echo ❌ Arquivo terminal.py não encontrado!
    echo 💡 Certifique-se de estar na pasta correta do projeto
    echo.
    pause
    exit /b 1
)

echo ✅ Sistema verificado!
echo.

REM Inicia diretamente o sistema
echo 🚀 Iniciando CloudBR Terminal...
echo 💡 Use Ctrl+C para sair a qualquer momento
echo.

%PYTHON_CMD% terminal.py

echo.
echo 👋 CloudBR finalizado. Obrigado!
pause