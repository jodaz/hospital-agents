FROM node:20-slim

# 1. Instalar git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 2. Instalar Clawdbot y PM2 globalmente
RUN npm install -g clawdbot pm2

# 3. Directorio de trabajo
WORKDIR /root/clawd/agents

# 4. Copiar los agentes al contenedor (Hacerlo self-contained)
COPY . .

# 5. Usar PM2 para gestionar el proceso
CMD ["pm2-runtime", "start", "clawdbot", "--name", "gateway", "--", "gateway", "start"]
