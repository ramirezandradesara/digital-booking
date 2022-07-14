import React, { useContext, useEffect } from 'react'
import './Header.scss'
import { Link, useNavigate, useLocation, Navigate } from 'react-router-dom'
import botonera from "../../funcionesJS/botonera"
import { FiMenu } from 'react-icons/fi'
import { BsFacebook, BsTwitter, BsInstagram } from 'react-icons/bs'
import { FaLinkedinIn } from 'react-icons/fa'
import { Context } from '../../context/Context'
import axios from 'axios'
import { useJwt } from "react-jwt";

function Header() {

    const {
        auth,
        setAuth,
        warning,
        setWarning,
        user,
        setUser,
        token,
        setToken,
        admin,
        setAdmin
    }
        = useContext(Context)

    const location = useLocation().pathname

    const navegador = useNavigate();
    function manejadorBotones(evento) {
        navegador(botonera(evento));
    }

    // Despliegue de barra lateral de navegación
    const [sidebar, setSidebar] = React.useState(false);

    const showSidebar = () => {
        setSidebar(!sidebar);
    }

    function closeSession() {
        setAuth(false)
        localStorage.removeItem('token')
        setToken(null)
        navegador('/')
        if (location === '/') {
            window.location.reload();
        }
    }

    const { decodedToken, isExpired } = useJwt(token);
    if (decodedToken?.rol?.id === 1) {
        setAdmin(true)
    }

    if (location === '/signup') {
        return (
            <nav>
                <div className='navbar-container'>

                    <Link to="/" className='logo-container'>
                        <img src='/images/logo.png' alt='logo' />
                        <p>Sentite como en tu hogar</p>
                    </Link>
                    <div className='button-container'>
                        <button onClick={() => manejadorBotones(false)}>Iniciar sesión.</button>
                    </div>

                    <div className='navbar'>
                        <Link to="#" className='hamburger-menu'>
                            <FiMenu data-testid='icono' style={{ color: "#545776" }} className="icono" onClick={showSidebar} />
                        </Link>
                    </div>
                    <div className={sidebar ? 'nav-menu active' : 'nav-menu'}>

                        <ul className='nav-menu-items' onClick={showSidebar}>

                            <div className='upper-navbar'>
                                <li className='navbar-toggle'>
                                    <p className='menu-bars' onClick={showSidebar}>
                                        X
                                    </p>
                                    <h5>MENÚ</h5>
                                </li>
                            </div>
                            <li className='nav-text'><Link to='/login'>Iniciar sesión</Link></li>

                            <div className='icons'>
                                <BsFacebook />
                                <FaLinkedinIn />
                                <BsTwitter />
                                <BsInstagram />
                            </div>
                        </ul>
                    </div>

                </div>
            </nav>
        )
    } else if (location === '/login') {
        return (
            <nav>
                <div className='navbar-container'>

                    <Link to="/" className='logo-container'>
                        <img src='/images/logo.png' alt='logo' />
                        <p>Sentite como en tu hogar</p>
                    </Link>
                    <div className='button-container'>
                        <button onClick={() => manejadorBotones(true)}>Crear cuenta</button>
                    </div>

                    <div className='navbar'>
                        <Link to="#" className='hamburger-menu'>
                            <FiMenu style={{ color: "#545776" }} onClick={showSidebar} />
                        </Link>
                    </div>
                    <div className={sidebar ? 'nav-menu active' : 'nav-menu'}>

                        <ul className='nav-menu-items' onClick={showSidebar}>

                            <div className='upper-navbar'>
                                <li className='navbar-toggle'>
                                    <p className='menu-bars' onClick={showSidebar}>
                                        X
                                    </p>
                                    <h5>MENÚ</h5>
                                </li>
                            </div>
                            <li className='nav-text'><Link to='/signup'>Crear cuenta</Link></li>
                            <div className='icons'>
                                <BsFacebook />
                                <FaLinkedinIn />
                                <BsTwitter />
                                <BsInstagram />
                            </div>
                        </ul>
                    </div>

                </div>
            </nav>
        )
    } else if (!auth) {
        return (
            <nav>
                <div className='navbar-container'>

                    <Link to="/" className='logo-container'>
                        <img src='/images/logo.png' alt='logo' />
                        <p>Sentite como en tu hogar</p>
                    </Link>
                    <div className='button-container'>
                        <button onClick={() => manejadorBotones(true)}>Crear cuenta</button>
                        <button onClick={() => { manejadorBotones(false); setWarning(false) }}>Iniciar sesión</button>
                    </div>

                    <div className='navbar'>
                        <Link to="#" className='hamburger-menu' onClick={showSidebar} >
                            <FiMenu style={{ color: "#545776" }} />
                        </Link>
                    </div>
                    <div className={sidebar ? 'nav-menu active' : 'nav-menu'}>

                        <ul className='nav-menu-items' onClick={showSidebar}>

                            <div className='upper-navbar'>
                                <li className='navbar-toggle'>
                                    <p className='menu-bars' onClick={showSidebar}>
                                        X
                                    </p>
                                    <h5>MENÚ</h5>
                                </li>
                            </div>

                            <li className='nav-text'><Link to='/signup'>Crear cuenta</Link></li>
                            <hr className='hr-header' />
                            <li className='nav-text'><Link to='/login' >Iniciar sesión</Link></li>

                            <div className='icons'>
                                <BsFacebook />
                                <FaLinkedinIn />
                                <BsTwitter />
                                <BsInstagram />
                            </div>
                        </ul>
                    </div>

                </div>
            </nav>
        )
    } else if (auth && !admin) {
        return (
            <nav>
                <div className='navbar-container'>

                    <Link to="/" className='logo-container'>
                        <img src='/images/logo.png' alt='logo' />
                        <p>Sentite como en tu hogar</p>
                    </Link>

                    <div className='username-container'>
                        <Link to="/reservations" className='admin-title'>Mis reservas</Link>
                        <hr />
                        <div className='avatar'>
                            <p>{decodedToken?.nombre?.charAt(0).toUpperCase()}{decodedToken?.apellido?.charAt(0).toUpperCase()}</p>
                        </div>
                        <div className='greetings'>
                            <h4 style={{ color: "#000", opacity: "50%" }} >Hola, </h4>
                            <h4 style={{ color: "#1DBEB4" }} >{decodedToken?.nombre} {decodedToken?.apellido}</h4>
                        </div>
                        <h4 className='close' onClick={closeSession} >X</h4>
                    </div>
                    <div className='navbar'>
                        <Link to="#" className='hamburger-menu'>
                            <FiMenu style={{ color: "#545776" }} onClick={showSidebar} />
                        </Link>
                    </div>
                </div>
                <div className={sidebar ? 'nav-menu active' : 'nav-menu'}>

                    <ul className='nav-menu-items' onClick={showSidebar}>
                        <div className='upper-navbar'>
                            <li className='navbar-toggle'>
                                <p className='menu-bars' onClick={showSidebar}>
                                    X
                                </p>
                                <div className='avatar-mobile'>
                                    <div className='avatar'>
                                        <h4>{decodedToken?.nombre?.charAt(0).toUpperCase()}{decodedToken?.apellido?.charAt(0).toUpperCase()}</h4>
                                    </div>
                                    <h4 style={{ color: "#fff" }} >Hola, </h4>
                                    <h4 style={{ color: "#383B58" }} >{decodedToken?.nombre} {decodedToken?.apellido}</h4>
                                </div>
                            </li>
                        </div>
                        <li className='nav-text'><Link to='/reservations'>Mis reservas</Link></li>

                        <div className='navbar-footer'>
                            <div className='footer-icons'>

                                <h4 className='cerrar-sesion' onClick={closeSession}>¿Deseas<span style={{ color: '#1DBEB4' }}>cerrar sesión?</span></h4>
                                <hr className='hr-nav' />
                                <BsFacebook />
                                <FaLinkedinIn />
                                <BsTwitter />
                                <BsInstagram />
                            </div>
                        </div>

                    </ul>
                </div>
            </nav>
        )
    } else if (auth && admin) {
        return (
            <nav>
                <div className='navbar-container'>

                    <Link to="/" className='logo-container'>
                        <img src='/images/logo.png' alt='logo' />
                        <p>Sentite como en tu hogar</p>
                    </Link>

                    <div className='username-container'>
                        <Link to="/admin" className='admin-title'>Administración</Link>
                        <hr />
                        <div className='avatar'>
                            <p>{decodedToken?.nombre?.charAt(0).toUpperCase()}{decodedToken?.apellido?.charAt(0).toUpperCase()}</p>
                        </div>
                        <div className='greetings'>
                            <h4 style={{ color: "#000", opacity: "50%" }} >Hola, </h4>
                            <h4 style={{ color: "#1DBEB4" }} >{decodedToken?.nombre} {decodedToken?.apellido}</h4>
                        </div>
                        <h4 className='close' onClick={closeSession} >X</h4>
                    </div>
                    <div className='navbar'>
                        <Link to="#" className='hamburger-menu'>
                            <FiMenu style={{ color: "#545776" }} onClick={showSidebar} />
                        </Link>
                    </div>
                </div>
                <div className={sidebar ? 'nav-menu active' : 'nav-menu'}>

                    <ul className='nav-menu-items' onClick={showSidebar}>
                        <div className='upper-navbar'>
                            <li className='navbar-toggle'>
                                <p className='menu-bars' onClick={showSidebar}>
                                    X
                                </p>
                                <div className='avatar-mobile'>
                                    <div className='avatar'>
                                        <h4>{decodedToken?.nombre?.charAt(0).toUpperCase()}{decodedToken?.apellido?.charAt(0).toUpperCase()}</h4>
                                    </div>
                                    <h4 style={{ color: "#fff" }} >Hola, </h4>
                                    <h4 style={{ color: "#383B58" }} >{decodedToken?.nombre} {decodedToken?.apellido}</h4>
                                </div>
                            </li>
                        </div>
                        <li className='nav-text'><Link to='/admin'>Administración</Link></li>
                        <div className='navbar-footer'>
                            <div className='footer-icons'>

                                <h4 className='cerrar-sesion' onClick={closeSession}>¿Deseas<span style={{ color: '#1DBEB4' }}>cerrar sesión?</span></h4>
                                <hr className='hr-nav' />
                                <BsFacebook />
                                <FaLinkedinIn />
                                <BsTwitter />
                                <BsInstagram />
                            </div>
                        </div>

                    </ul>
                </div>
            </nav>
        )
    }
}

export default Header
