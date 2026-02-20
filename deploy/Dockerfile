FROM node:22-slim

# 1. Instalar dependencias del sistema (Git es obligatorio)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 2. Instalar Clawdbot globalmente
RUN npm install -g clawdbot

# 3. Directorio de trabajo
WORKDIR /root/clawd

# 4. Comando por defecto
CMD ["clawdbot", "gateway", "start"]
