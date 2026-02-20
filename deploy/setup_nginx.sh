#!/bin/bash

DOMAIN="hospital.jodaz.xyz"
PORT="40923"
EMAIL="admin@jodaz.xyz" # Adjust if needed

echo "🚀 Setting up Nginx for $DOMAIN -> Port $PORT"

# 1. Install Nginx & Certbot
apt-get update
apt-get install -y nginx certbot python3-certbot-nginx

# 2. Create Nginx Config
cat > /etc/nginx/sites-available/$DOMAIN <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://localhost:$PORT;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
        
        # Forward real IP
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# 3. Enable Site
ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default 2>/dev/null # Remove default if exists
nginx -t && systemctl reload nginx

# 4. Get SSL Certificate
echo "🔒 Requesting SSL Certificate..."
certbot --nginx -d $DOMAIN --non-interactive --agree-tos -m $EMAIL

echo "✅ Done! https://$DOMAIN is live and pointing to port $PORT."
