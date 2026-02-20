module.exports = {
  apps: [
    {
      name: "hospital-brain",
      script: "pnpm",
      args: "exec clawdbot gateway start",
      cwd: "./", // Correr desde la raíz del proyecto
      env: {
        // Variables de entorno generales
        CLAWD_LOG_LEVEL: "info",
        PORT: 3000, // Puerto donde escucha el gateway
        // Las API KEYS se deben configurar en el servidor o cargar desde .env
      },
      // Reiniciar si consume demasiada memoria (seguridad)
      max_memory_restart: "1G",
      // Cargar variables desde archivo .env
      env_file: "./.env",
      // Logs
      error_file: "./logs/err.log",
      out_file: "./logs/out.log",
      merge_logs: true,
      time: true
    }
  ]
};
