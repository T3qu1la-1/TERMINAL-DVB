# CloudBR - Sistema de Processamento de Credenciais

Sistema multiplataforma para processamento de arquivos TXT/ZIP/RAR até 4GB com filtro automático para URLs brasileiras.

## 🚀 Instalação Rápida

### Linux / WSL / Termux
```bash
git clone <seu-repositorio>
cd cloudbr
./iniciar.sh
```

### Windows (CMD)
```cmd
git clone <seu-repositorio>
cd cloudbr
iniciar.bat
```

### Windows (PowerShell)
```powershell
git clone <seu-repositorio>
cd cloudbr
.\iniciar.ps1
```

## 📋 Funcionalidades

- ✅ Processa arquivos TXT, ZIP e RAR até 4GB
- ✅ Filtro automático para URLs brasileiras 
- ✅ Interface de terminal interativa
- ✅ Instalação automática de dependências
- ✅ Multiplataforma (Linux, Windows, macOS, Termux)
- ✅ Remoção automática de spam e linhas inválidas

## 📁 Como Usar

1. **Clone o repositório e execute o script de inicialização**
2. **Coloque seus arquivos** TXT/ZIP/RAR na pasta `cloudsaqui/`
3. **Execute o menu** e escolha o arquivo ou processe todos
4. **Resultados** serão salvos na pasta principal com nomes organizados

## 🔧 Dependências

O sistema instala automaticamente:
- `flask` >= 3.0.0
- `rarfile` >= 4.0  
- `requests` >= 2.25.0

## 📤 Arquivos de Saída

- `cloudbr-[nome]-GERAL-[data].txt` - Todas as credenciais válidas
- `cloudbr-[nome]-BR-[data].txt` - Apenas URLs brasileiras
- `cloudbr-LOTE-[tipo]-[data-hora].txt` - Processamento em lote

## 🇧🇷 Filtro Brasileiro

Detecta automaticamente:
- Domínios `.br` e variações (.com.br, .gov.br, etc.)
- Sites brasileiros conhecidos (.com/.net)
- Principais bancos e serviços brasileiros