import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import dotenv from 'dotenv'

dotenv.config()

const env = loadEnv('production', process.cwd(), '')
// https://vite.dev/config/
export default defineConfig({
  base: process.env.VITE_BASE_URL || '/NuttyB-Raptors/',
  plugins: [vue()],
  build: {
    outDir: '../docs',
    emptyOutDir: true, // also necessary
  },
})
