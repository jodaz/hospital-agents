#!/bin/bash
# Ejecutar esto dentro del contenedor o al inicio

# Configurar Gemini
# Configuración Inicial non-interactive
# Usamos 'openclaw' CLI para configurar el proveedor y el modelo

if [ ! -z "$GOOGLE_API_KEY" ]; then
  echo "$GOOGLE_API_KEY" | openclaw models auth paste-token --provider google --profile-id google:manual
  echo "✅ Google Gemini API Key configurada."
fi

# Configuración avanzada via paths internos (v2026.2+)
openclaw config set env.shellEnv.enabled true
if [ ! -z "$GOOGLE_API_KEY" ]; then
  # Crear auth-profiles.json manualmente para mayor fiabilidad
  for dir in "/root/.openclaw/agents/main/agent" "/root/clawd/agents/receptionist" "/root/clawd/agents/ceo" "/root/clawd/agents/coo"; do
    mkdir -p "$dir"
    cat > "$dir/auth-profiles.json" <<EOF
{
  "profiles": {
    "default": {
      "type": "api_key",
      "key": "$GOOGLE_API_KEY",
      "provider": "google"
    }
  },
  "defaultProfileId": "default"
}
EOF
  done
  echo "✅ Auth configurada manualmente para todos los agentes."
fi

# Registrar agentes del proyecto
for agent in receptionist ceo coo; do
  openclaw agents add $agent --agent-dir /root/clawd/agents/$agent --model google/gemini-1.5-flash --non-interactive --workspace /root/.openclaw/workspace
done

# Establecer el modelo por defecto globalmente
openclaw models set google/gemini-1.5-flash

echo "✅ Configuración de OpenClaw completada."
