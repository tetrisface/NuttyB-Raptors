/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_BASE_URL: string = ''
  // Declare other variables as needed
  // Add other VITE_ prefixed environment variables here
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
