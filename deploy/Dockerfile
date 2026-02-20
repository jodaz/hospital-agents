# Use Node 22 (Required by latest OpenClaw)
FROM node:22-alpine

# 1. Install system dependencies
# git: for cloning
# python3, make, g++: for building native node modules (gyp)
RUN apk add --no-cache git python3 make g++

# 2. Install OpenClaw & PM2
# We pin to version 2026.2.19-2 for stability.
# We ignore scripts to avoid native compilation issues with node-llama-cpp/alpine
RUN npm install -g openclaw@2026.2.19-2 --ignore-scripts
RUN npm install -g pm2

# 3. Setup Directory
WORKDIR /root/clawd/agents

# 4. Copy agents
COPY . .

# 5. Debug Mode (To find non-systemd start command)
CMD ["tail", "-f", "/dev/null"]
