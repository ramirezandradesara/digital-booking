import { render } from '@testing-library/react';
import App from '../App';

test('Correcto renderizado de App', () => {
    const app = render(<App />)
    expect(app.container).toBeInTheDocument();
});
