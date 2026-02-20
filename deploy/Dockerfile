# Use Node 22 (Required by latest Clawdbot)
FROM node:22-alpine

# 1. Install system dependencies
# git: for cloning
# python3, make, g++: for building native node modules (gyp)
RUN apk add --no-cache git python3 make g++

# 2. Install Clawdbot & PM2
# We pin to latest explicitly. If this fails, we might need to pin a version number e.g. clawdbot@0.4.5
RUN npm install -g clawdbot@latest pm2 && npm cache clean --force

# 3. Setup Directory
WORKDIR /root/clawd/agents

# 4. Copy agents
COPY . .

# 5. Debug Mode (To find non-systemd start command)
CMD ["tail", "-f", "/dev/null"]
