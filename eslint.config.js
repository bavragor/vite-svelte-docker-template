import globals from 'globals';
import pluginJs from '@eslint/js';
import tseslint from 'typescript-eslint';
import tsparser from '@typescript-eslint/parser';
import eslintPluginSvelte from 'eslint-plugin-svelte';
import svelteparser from 'svelte-eslint-parser';

export default [
  { files: ['**/*.{js,mjs,cjs,ts}'] },
  { ignores: ['dist/', 'build/'] },
  { languageOptions: { globals: globals.browser } },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  ...eslintPluginSvelte.configs['flat/prettier'],
  {
    files: ['**/*.svelte', '*.svelte'],
    languageOptions: {
      parser: svelteparser,
      parserOptions: {
        parser: tsparser,
      },
    },
  },
];
