import { render, screen, act, fireEvent } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import React from 'react';
import SignUp from '../pages/SignUp/SignUp';
import '@testing-library/jest-dom'
import { create } from 'react-test-renderer';

let component = null;

beforeEach(() => {
    component = render(
        <BrowserRouter>
            <SignUp />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});

test('Renderizado de título de Crear cuenta', () => {
    expect(screen.getAllByText('Crear cuenta'));
});


describe('Funcionamiento inputs en formulario', () => {

    test('Input de nombre deben estar vacíos y aceptar texto', () => {
        const nameInput = component.container.querySelector('input[name="nombre"]')
        expect(nameInput.value).toBe('');
        fireEvent.change(nameInput, { target: { value: 'testing' } })
        expect(nameInput.value).toMatch('testing');
    });


    test('Input de apellido deben estar vacíos y aceptar texto', () => {
        const lastNameInput = component.container.querySelector('input[name="apellido"]')
        expect(lastNameInput.value).toBe('');
        fireEvent.change(lastNameInput, { target: { value: 'testing' } })
        expect(lastNameInput.value).toMatch('testing');
    });


    test('Input de correo electrónico deben estar vacíos y aceptar texto', () => {
        const emailInput = component.container.querySelector('input[name="email"]')
        expect(emailInput.value).toBe('');
        fireEvent.change(emailInput, { target: { value: 'testing' } })
        expect(emailInput.value).toMatch('testing');
    });


    test('Input de contraseña deben estar vacíos y aceptar texto', () => {
        const passwordInput = component.container.querySelector('input[name="contraseña"]')
        expect(passwordInput.value).toBe('');
        fireEvent.change(passwordInput, { target: { value: 'testing' } })
        expect(passwordInput.value).toMatch('testing');
    });


    test('Input de contraseña2 deben estar vacíos y aceptar texto', () => {
        const passwordInput2 = component.container.querySelector('input[name="contraseña2"]')
        expect(passwordInput2.value).toBe('');
        fireEvent.change(passwordInput2, { target: { value: 'testing' } })
        expect(passwordInput2.value).toMatch('testing');
    });
});


test('Botón de registro', () => {
    const button = component.container.querySelector('button[type="submit"]')
    expect(button.textContent).toBe('Crear cuenta');
});

describe('Funcionamiento del formulario', () => {

    test('Inputs con clase noError y hasError', () => {
        expect(component.container.getElementsByClassName('noError').length).toBe(5);

        const button = component.container.querySelector('button[type="submit"]')

        act(() => {
            fireEvent.click(button);
        });

        expect(component.container.getElementsByClassName('hasError').length).toBe(5);
    });


    test('Simulación ingreso datos y redireccionamiento a /userhome', async () => {
        const nameInput = component.container.querySelector('input[name="nombre"]')
        const lastNameInput = component.container.querySelector('input[name="apellido"]')
        const emailInput = component.container.querySelector('input[name="email"]')
        const passwordInput = component.container.querySelector('input[name="contraseña"]')
        const passwordInput2 = component.container.querySelector('input[name="contraseña2"]')

        const button = component.container.querySelector('button[type="submit"]')

        act(() => {
            fireEvent.change(nameInput, { target: { value: 'testing' } })
            fireEvent.change(lastNameInput, { target: { value: 'testing' } })
            fireEvent.change(emailInput, { target: { value: 'testing' } })
            fireEvent.change(passwordInput, { target: { value: 'testing' } })
            fireEvent.change(passwordInput2, { target: { value: 'testing' } })

            fireEvent.click(button);
        });

        expect(component.container.getElementsByClassName('error').length).not.toBe(5);
    });

});

// test('Snapshot SignUp', () => {
//     const tree = create(
//         <BrowserRouter>
//             <SignUp />
//         </BrowserRouter>
//     ).toJSON();
//     expect(tree).toMatchSnapshot();
// });