import { render, screen, act } from '@testing-library/react';
import Listing from '../components/Body/Listing';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

test('Correcto renderizado de Listing', () => {
    const component = render(
        <BrowserRouter>
            <Listing />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});

// test('Item con clase listing-card', async () => {
//     const item = component.container.getElementsByClassName('listing-card');
//     expect(item).toBeInTheDocument();
// });