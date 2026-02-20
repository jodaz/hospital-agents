#!/bin/bash

# Script de configuración para VPS - Hospital Agents
# Reemplazando Docker por Node.js + OpenClaw + PM2

set -e

echo "🚀 Iniciando configuración de Hospital Agents..."

# 1. Actualizar sistema e instalar Node.js 24+
if ! command -v node &> /dev/null; then
    echo "📦 Instalando Node.js 24..."
    curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "✅ Node.js ya está instalado ($(node -v))"
fi

# 2. Instalar pnpm
if ! command -v pnpm &> /dev/null; then
    echo "📦 Instalando pnpm..."
    sudo npm install -g pnpm
else
    echo "✅ pnpm ya está instalado ($(pnpm -v))"
fi

# 3. Instalar dependencias del proyecto
echo "📦 Instalando dependencias del proyecto..."
pnpm install

# 4. Configurar variables de entorno
if [ ! -f .env ]; then
    echo "📝 Creando archivo .env desde .env.example..."
    cp .env.example .env
    echo "⚠️  RECUERDA: Edita el archivo .env con tu GOOGLE_GENERATIVE_AI_API_KEY"
else
    echo "✅ Archivo .env ya existe"
fi

# 5. Asegurar permisos de logs
mkdir -p logs
touch logs/out.log logs/err.log

# 6. Iniciar con PM2
echo "⚡ Iniciando aplicación con PM2..."
pnpm exec pm2 start ecosystem.config.js

# 7. Configurar PM2 para que inicie al bootear el VPS
echo "🔄 Configurando inicio automático de PM2..."
sudo pm2 startup systemd || true
pnpm exec pm2 save

echo "--------------------------------------------------"
echo "✅ Configuración completada con éxito."
echo "👉 Para ver los logs: pnpm run logs"
echo "👉 Para ver el estado: pnpm run status"
echo "--------------------------------------------------"
