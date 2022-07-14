import React, { useContext } from 'react'
import { useNavigate } from 'react-router-dom';
import './NotFound.scss'
import botonera from '../../funcionesJS/botonera'

function NotFound() {

    // const {
    //     auth,
    //     setAuth,
    //     warning,
    //     setWarning,
    //     user,
    //     setUser,
    //     token,
    //     setToken,
    //     admin,
    //     setAdmin
    // }
    //     = useContext(Context)

    const navegador = useNavigate();

    function manejadorBotones(evento) {
        navegador(botonera(evento));
    }

    // if (window.location.pathname === '/admin' && !admin) {

    // }

    return (
        <>
            <div className="not-found">
                <div className="not-found-container">
                    <div className="not-found-image-container">
                        <div className="not-found-image"></div>
                    </div>
                    <div className="not-found-text">
                        <div className="not-found-title">
                            <h1>¡Ups!</h1>
                            <h1>Lo sentimos</h1>
                        </div>
                        <div className="bottom-not-found-text">
                            <p>Esta página no está disponible o no tienes permiso para acceder.</p>
                            <button onClick={() => manejadorBotones()}>Volver al home</button>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default NotFound