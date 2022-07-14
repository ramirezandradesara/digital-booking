import Footer from "../components/Footer/Footer";
import '../components/Footer/Footer.scss'
import { render, screen, unmountComponentAtNode, act, fireEvent, getTestById } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import React from 'react';
import '@testing-library/jest-dom'
import { create } from 'react-test-renderer';

let component = null;

beforeEach(() => {
    component = render(
        <BrowserRouter>
            <Footer />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
})

test('Footer renderiza correctamente', () => {
    const component = render(<Footer />);
    expect(component.container).toBeInTheDocument();
});

test('Renderizado de derechos de autor', () => {
    expect(component.getByText('©2021 Digital Booking')).toBeInTheDocument();
});

// test('Snasphot de Footer', () => {
//     const tree = create(
//         <BrowserRouter>
//             <Footer />
//         </BrowserRouter>
//     ).toJSON();
//     expect(tree).toMatchSnapshot();
// });


