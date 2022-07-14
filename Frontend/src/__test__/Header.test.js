import Header from '../components/Header/Header';
import { render, screen, act, fireEvent } from '@testing-library/react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import React from 'react';
import { create } from 'react-test-renderer';
import botonera from "../funcionesJS/botonera";

let component = null;
beforeEach(() => {

    component = render(
        <BrowserRouter>
            <Header />
        </BrowserRouter>
    )
    expect(component.container).toBeInTheDocument();
});

test('Renderizado del logotipo', () => {
    expect(screen.getAllByText('Sentite como en tu hogar'));
});


test('Funcionamiento de menu lateral', async () => {
    const icono = component.container.getElementsByClassName('hamburger-menu')[0];

    act(() => {
        fireEvent.click(icono);
    })

    expect(component.container.getElementsByClassName('nav-menu active')).toBeTruthy();

});


describe('Redirección por función manejadorBotones', () => {

    test('Redireccion a /signup', async () => {
        const button = screen.getByRole("button", { name: /Crear cuenta/ });
        const manejadorBotones = botonera(true);

        act(() => {
            fireEvent.click(button);
        });

        expect(manejadorBotones).toBe('/signup');

    });

    test('Redirección a /login', async () => {
        const button = screen.getByRole("button", { name: /Iniciar sesión/ });
        const manejadorBotones = botonera(false);

        act(() => {
            fireEvent.click(button);
        })

        expect(manejadorBotones).toBe('/login');
    });


    test('Redireccion a /', async () => {
        const logo = screen.getByAltText('logo');
        const manejadorBotones = botonera();

        act(() => {
            fireEvent.click(logo);
        });

        expect(manejadorBotones).toBe('/');
    });

    test('Redireccion a / cuando cierra sesión', async () => {
        const close = screen.getByText('X');
        const manejadorBotones = botonera();

        act(() => {
            fireEvent.click(close);
        });

        expect(manejadorBotones).toBe('/');
    });
})


test('Comprobar manejador de botones', async () => {
    // from home - location === '/'
    const buttonCrear = screen.getByRole("button", { name: /Crear Cuenta/i });

    act(() => {
        fireEvent.click(buttonCrear);
    });

    expect(component.container).not.toHaveTextContent('Crear cuenta');
    expect(component.container).toHaveTextContent('Iniciar sesión');

    // from login - location === '/signup'
    const buttonIniciar = screen.getByRole("button", { name: /Iniciar Sesión/i });
    act(() => {
        fireEvent.click(buttonIniciar);
    });

    expect(component.container).not.toHaveTextContent('Iniciar sesión');
    expect(component.container).toHaveTextContent('Crear cuenta');

    const logo = screen.getByAltText('logo');

    act(() => {
        fireEvent.click(logo);
    });

    expect(component.container).toHaveTextContent('Iniciar sesión');
    expect(component.container).toHaveTextContent('Crear cuenta');

    // from home - location === '/'
    const buttonIniciar2 = screen.getByRole("button", { name: /Iniciar Sesión/i });
    act(() => {
        fireEvent.click(buttonIniciar2);
    });

    // from login - location === '/login'
    expect(component.container).not.toHaveTextContent('Iniciar sesión');
    expect(component.container).toHaveTextContent('Crear cuenta');

    const buttonCrear2 = screen.getByRole("button", { name: /Crear Cuenta/i });

    act(() => {
        fireEvent.click(buttonCrear2);
    });

    expect(component.container).not.toHaveTextContent('Crear cuenta');
    expect(component.container).toHaveTextContent('Iniciar sesión');

    // back to home
    const logo2 = screen.getByAltText('logo');

    act(() => {
        fireEvent.click(logo2);
    });

    expect(component.container).toHaveTextContent('Iniciar sesión');
    expect(component.container).toHaveTextContent('Crear cuenta');

});

test('Snapshot de header', () => {
    const tree = create(
        <BrowserRouter>
            <Header />
        </BrowserRouter>
    ).toJSON();
    expect(tree).toMatchSnapshot();
});