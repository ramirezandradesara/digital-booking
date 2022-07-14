import Product from "../pages/Product/Product";
import { render, screen, act, fireEvent } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';

let component = null;

beforeEach(() => {
    component = render(
        <BrowserRouter>
            <Product />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});


test('Product renderiza correctamente', () => {
    expect(component.container).toBeInTheDocument();
});


test('Renderizado de imagen al hacer click', () => {
    const img = screen.getByRole('img');
    act(() => {
        fireEvent.click(img);
    });
    expect(img).toBeInTheDocument();
});