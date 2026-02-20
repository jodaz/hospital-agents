#!/bin/bash
# Ejecutar esto dentro del contenedor o al inicio

# Configurar el proveedor LLM por defecto a Google Gemini
clawdbot configure --section llm --set provider=google --set model=gemini-1.5-flash

echo "✅ Configuración de Gemini aplicada."
