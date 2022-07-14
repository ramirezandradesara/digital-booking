import { render, screen, act } from '@testing-library/react';
import Picker from '../components/Body/Picker';

test('Correcto renderizado de Picker', () => {
    const picker = render(<Picker />)
    expect(picker.container).toBeInTheDocument();
});