import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  base: '/tetrisface/NuttyB-Raptors',
  plugins: [vue()],
  build: {
    outDir: '../docs',
    emptyOutDir: true, // also necessary
  },
})
