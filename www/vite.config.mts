/// <reference types="vitest" />
/// <reference types="vite/client" />

import { defineConfig } from 'vite';
import createReactPlugin from '@vitejs/plugin-react';
import createReScriptPlugin from '@jihchi/vite-plugin-rescript';

// https://vitejs.dev/config/
export default defineConfig({
  base: '/website/', // for GitHub Pages
  plugins: [createReactPlugin(), createReScriptPlugin()],
  test: {
    include: ['tests/**/*_test*.js'],
    globals: true,
    environment: 'jsdom',
    setupFiles: './tests/setup.ts',
  },
});
