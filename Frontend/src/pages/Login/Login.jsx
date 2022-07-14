import React, { useContext } from 'react'
import './Login.scss'
import { Link, useNavigate } from 'react-router-dom'
import { Context } from '../../context/Context'
import axios from 'axios'
import api from '../../Helpers/Api'

function Login() {
  const { auth, setAuth, userEmail, setUserEmail, warning, setWarning, user, setUser, token, setToken } = useContext(Context)
  const [errorPost, setErrorPost] = React.useState(null)
  const navigate = useNavigate();
  const [email, setEmail] = React.useState({ campo: "", error: null });
  const [password, setPassword] = React.useState({ campo: "", error: null });

  // Escucha cambios de los inputs
  const onChangeEmail = (e) => { setEmail({ ...email, campo: e.target.value }); }
  const onChangePassword = (e) => { setPassword({ ...password, campo: e.target.value }); }

  // Envio de form si es válido y redireccion al Home
  const onSubmit = (e) => {
    e.preventDefault();
    postUser()
  }

  // Envio de datos para obtener JWT
  async function postUser() {
    axios.post(`${api}authenticate`, {
      email: email.campo,
      password: password.campo,
    })
      .then(function (response) {
        localStorage.setItem('token', response.data.jwt)
        setToken(response.data.jwt)
        navigate('/');
        setAuth(true)
      })
      .catch(function (error) {
        console.log(error);
        setErrorPost(true)
        setAuth(false)
      })
  }

  return (
    <>
      <div className='login'>
        <div className='form-container'>
          <form onSubmit={onSubmit} >
            {warning
              ? <div
                className="warning"
                style={{ display: 'flex' }}>
                <img src="/images/warning.png" alt="warning" />
                <p>Para realizar una reserva necesitas estar logueado</p>
              </div>
              : null}
            <h1>Iniciar sesión</h1>
            {errorPost && <div className='error'><small>Lamentablemente no ha podido iniciar sesión. Por favor intente más tarde</small></div>}
            <label htmlFor='email'>Correo electrónico</label>
            <input
              className={email.error ? 'hasError' : 'noError'}
              type="email"
              name="email"
              value={email.campo}
              onChange={onChangeEmail}
              // onBlur={validacionEmail}
              autoComplete="current-email"
            />
            <label htmlFor='password'>Contraseña</label>
            <input
              className={password.error ? 'hasError' : 'noError'}
              type="password"
              name="password"
              value={password.campo}
              onChange={onChangePassword}
              // onBlur={validacionContra}
              autoComplete="current-password"
            />
            {(email.error || password.error) && <div className='error'><small>Por favor vuelva a intentarlo, sus credenciales son inválidas</small></div>}
            <button name='ingresar'>Ingresar</button>
          </form>
          <span>¿Aún no tenes cuenta? <Link to='/signup' style={{ color: "#5993F5" }}>Registrate</Link> </span>
        </div>
      </div>
    </>
  )
}

export default Login