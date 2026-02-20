FROM node:20-slim

# 1. Instalar git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 2. Instalar Clawdbot y PM2 globalmente
RUN npm install -g clawdbot pm2

# 3. Directorio de trabajo
WORKDIR /root/clawd

# 4. Usar PM2 para gestionar el proceso (evita el error de systemd)
# Ejecutamos el comando 'clawdbot gateway start' a través de PM2
CMD ["pm2-runtime", "start", "clawdbot", "--name", "gateway", "--", "gateway", "start"]
