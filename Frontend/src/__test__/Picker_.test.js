import { render, screen, act } from '@testing-library/react';
import Picker_ from '../components/Body/Picker_';

test('Correcto renderizado de Picker_', () => {
    const picker2 = render(<Picker_ />)
    expect(picker2.container).toBeInTheDocument();
});