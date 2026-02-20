# Use Alpine for smaller footprint
FROM node:20-alpine

# 1. Install system dependencies (Git is needed for Clawdbot install)
# Clean up cache immediately to save space
RUN apk add --no-cache git

# 2. Install Clawdbot & PM2
RUN npm install -g clawdbot pm2 && npm cache clean --force

# 3. Setup Directory
WORKDIR /root/clawd/agents

# 4. Copy ONLY the agent files (SOULs, KNOWLEDGEs)
# We leverage .dockerignore, but being specific helps.
COPY . .

# 5. Start
CMD ["pm2-runtime", "start", "clawdbot", "--name", "gateway", "--", "gateway", "start"]
