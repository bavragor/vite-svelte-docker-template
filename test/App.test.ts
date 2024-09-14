import { render, screen } from '@testing-library/svelte';
import App from '../src/App.svelte';

describe('Test App.svelte', async () => {
  it('Should render Hello World', async () => {
    render(App);
    expect(screen.getByText('Hello World')).toBeInTheDocument();
  });
});
