import Booking from '../pages/Booking/Booking'
import { render, screen, act, fireEvent } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';

let component = null;

beforeEach(() => {
    component = render(
        <BrowserRouter>
            <Booking />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});


test('Booking renderiza correctamente', () => {
    expect(component.container).toBeInTheDocument();
});