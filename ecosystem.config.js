module.exports = {
  apps: [
    {
      name: "hospital-brain",
      script: "./node_modules/clawdbot/dist/entry.js",
      args: "gateway start",
      cwd: "./", // Correr desde la raíz del proyecto
      env: {
        // Variables de entorno generales
        CLAWD_LOG_LEVEL: "info",
        PORT: 3000, 
        NODE_OPTIONS: "--no-warnings", 
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
