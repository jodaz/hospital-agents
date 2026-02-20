#!/bin/bash
# Ejecutar esto dentro del contenedor o al inicio

# Configurar Gemini
clawdbot configure --section llm --set provider=google --set model=gemini-1.5-flash

# Configurar Telegram si las variables existen
if [ ! -z "$TELEGRAM_BOT_TOKEN" ] && [ ! -z "$PUBLIC_URL" ]; then
  clawdbot configure --section telegram --set token=$TELEGRAM_BOT_TOKEN --set webhookUrl=$PUBLIC_URL/telegram
  echo "✅ Telegram configurado."
fi

echo "✅ Configuración de Gemini aplicada."
