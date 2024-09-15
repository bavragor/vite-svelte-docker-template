import { svelte } from '@sveltejs/vite-plugin-svelte';
import { defineConfig } from 'vitest/config';
import { svelteTesting } from '@testing-library/svelte/vite';

export default defineConfig({
  plugins: [svelte({ hot: !process.env.VITEST }), svelteTesting()],
  test: {
    dir: '.',
    reporters: 'dot',
    // Jest like globals
    globals: true,
    environment: 'jsdom',
    include: ['test/**/*.{test,spec}.ts'],
    // Extend jest-dom matchers
    setupFiles: ['./test/setupTest.js'],
    coverage: {
      provider: 'istanbul',
      reporter: ['lcov', 'html'],
      include: ['src/**'],
      reportsDirectory: 'build/coverage',
      reportOnFailure: true,
    },
  },
});
