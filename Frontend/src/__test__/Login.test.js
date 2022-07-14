import { render, act, fireEvent } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import React from 'react';
import Login from '../pages/Login/Login';
import { create } from 'react-test-renderer';

let component = null;

beforeEach(() => {
    component = render(
        <BrowserRouter>
            <Login />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});


test('Renderizado de título de iniciar sesión', () => {
    expect(component.getByText('Iniciar sesión')).toBeInTheDocument();
});

describe('Renderizado del formulario', () => {

    test('Labels de correo electrónico y contraseña en pantalla', () => {
        expect(component.getByText('Correo electrónico')).toBeInTheDocument();
        expect(component.getByText('Contraseña')).toBeInTheDocument();
    });

    test('Input de correo electrónico debe aceptar texto', () => {
        const emailInput = component.container.querySelector('input[name="email"]')
        expect(emailInput.value).toBe('');
        fireEvent.change(emailInput, { target: { value: 'testing' } })
        expect(emailInput.value).toMatch('testing');
    });

    test('Input de contraseña debe aceptar texto', () => {
        const passwordInput = component.container.querySelector('input[name="password"]')
        expect(passwordInput.value).toBe('');
        fireEvent.change(passwordInput, { target: { value: 'testing' } })
        expect(passwordInput.value).toMatch('testing');
    });

    test('Botón de registro', () => {
        const button = component.container.querySelector('button[name="ingresar"]')
        expect(button.textContent).toBe('Ingresar');
    });
});


describe('Funcionamiento del formulario', () => {

    test('Inputs con clase noError y hasError', () => {
        expect(component.container.getElementsByClassName('noError').length).toBe(2);

        const button = component.container.querySelector('button[name="ingresar"]')
        fireEvent.click(button)

        expect(component.container.getElementsByClassName('hasError').length).toBe(2);
    });


    test('Error al ingresar sin escribir en datos', async () => {
        const button = component.container.querySelector('button[name="ingresar"]')

        act(() => {
            fireEvent.click(button);
        });

        expect(component.container.getElementsByClassName('error').length).toBe(1);
    });


    test('Simulación ingreso datos y redireccionamiento a /userhome', async () => {
        const emailInput = component.container.querySelector('input[name="email"]');
        const passwordInput = component.container.querySelector('input[name="password"]');
        const button = component.container.querySelector('button[name="ingresar"]');

        act(() => {
            fireEvent.change(emailInput, { target: { value: 'alex@mail.com' } })
            fireEvent.change(passwordInput, { target: { value: '123123' } })
            fireEvent.click(button);
        });
        
        expect(component.container.getElementsByClassName('error').length).not.toBe(1);
    });

});


// test('Snapshot de Login', () => {
//     const tree = create(
//         <BrowserRouter>
//             <Login />
//         </BrowserRouter>
//     ).toJSON();
//     expect(tree).toMatchSnapshot();
// });