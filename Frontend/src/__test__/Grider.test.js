import { render } from '@testing-library/react';
import Grider from '../components/Body/Grider';

test('Correcto renderizado de Grider', () => {
    const grider = render(<Grider />)
    expect(grider.container).toBeInTheDocument();
});