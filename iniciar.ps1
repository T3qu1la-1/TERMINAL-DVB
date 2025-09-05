# CloudBR - Script de Inicialização PowerShell
# Funciona no Windows PowerShell e PowerShell Core

# Define a codificação para UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Clear-Host

Write-Host "==================================================================" -ForegroundColor Yellow
Write-Host "🚀 CloudBR - Sistema de Processamento de Credenciais" -ForegroundColor Green
Write-Host "==================================================================" -ForegroundColor Yellow
Write-Host "📁 Processa arquivos TXT/ZIP/RAR até 4GB" -ForegroundColor Cyan
Write-Host "🇧🇷 Filtro automático para URLs brasileiras" -ForegroundColor Green
Write-Host "⚡ Sistema multiplataforma" -ForegroundColor Magenta
Write-Host "==================================================================" -ForegroundColor Yellow
Write-Host ""

Write-Host "🔍 Sistema detectado: Windows PowerShell" -ForegroundColor Blue

# Função para verificar se um comando existe
function Test-CommandExists {
    param($command)
    try {
        Get-Command $command -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

# Verifica se Python está instalado
$pythonCmd = $null
$pythonCommands = @("python", "python3", "py")

foreach ($cmd in $pythonCommands) {
    if (Test-CommandExists $cmd) {
        try {
            & $cmd --version | Out-Null
            $pythonCmd = $cmd
            break
        }
        catch {
            continue
        }
    }
}

if (-not $pythonCmd) {
    Write-Host "❌ Python não encontrado!" -ForegroundColor Red
    Write-Host "💡 Baixe e instale o Python em: https://python.org/downloads/" -ForegroundColor Yellow
    Write-Host "💡 Ou instale via Microsoft Store" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Pressione ENTER para sair"
    exit 1
}

Write-Host "✅ Python encontrado: $pythonCmd" -ForegroundColor Green

# Instala dependências
Write-Host "🔍 Verificando dependências Python..." -ForegroundColor Blue

if (Test-Path "requirements.txt") {
    Write-Host "📦 Instalando dependências do requirements.txt..." -ForegroundColor Yellow
    & $pythonCmd -m pip install -r requirements.txt --user --disable-pip-version-check
} else {
    Write-Host "📦 Instalando dependências básicas..." -ForegroundColor Yellow
    & $pythonCmd -m pip install flask rarfile requests --user --disable-pip-version-check
}

Write-Host "✅ Dependências instaladas!" -ForegroundColor Green

# Cria pasta de arquivos se não existir
if (-not (Test-Path "cloudsaqui")) {
    Write-Host "📁 Criando pasta 'cloudsaqui' para seus arquivos..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Name "cloudsaqui" | Out-Null
}

# Verifica se o arquivo principal existe
if (-not (Test-Path "terminal.py")) {
    Write-Host "❌ Arquivo terminal.py não encontrado!" -ForegroundColor Red
    Write-Host "💡 Certifique-se de estar na pasta correta do projeto" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Pressione ENTER para sair"
    exit 1
}

Write-Host "✅ Sistema verificado!" -ForegroundColor Green
Write-Host ""

# Inicia diretamente o sistema
Write-Host "🚀 Iniciando CloudBR Terminal..." -ForegroundColor Green
Write-Host "💡 Use Ctrl+C para sair a qualquer momento" -ForegroundColor Yellow
Write-Host ""

try {
    & $pythonCmd terminal.py
}
catch {
    Write-Host "❌ Erro ao executar o sistema: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "👋 CloudBR finalizado. Obrigado!" -ForegroundColor Green
Read-Host "Pressione ENTER para sair"