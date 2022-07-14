import React, { useContext } from 'react'
import './SignUp.scss'
import { Link, useNavigate } from 'react-router-dom'
import { Context } from '../../context/Context'
import axios from 'axios'
import api from '../../Helpers/Api'
import swal from 'sweetalert';

function SignUp() {
  const navigate = useNavigate()

  const { auth, setAuth, setWarning } = useContext(Context)
  const [errorPost, setErrorPost] = React.useState(null)
  const [formSent, setFormSent] = React.useState(false)

  const emailRegExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  const passwordRegExp = /^.{6,30}$/;
  const nameRegExp = /^[a-zA-Zа-яА-ЯёЁ]{2,30}$/;
  const lastNameRegExp = /^[a-zA-Zа-яА-ЯёЁ]{1,30}$/;

  const [email, setEmail] = React.useState({ campo: "", error: null, mensajeError: "Ingrese un email válido." });
  const [password, setPassword] = React.useState({ campo: "", error: null, mensajeError: "La contraseña debe tener más de 6 caracteres." });
  const [password2, setPassword2] = React.useState({ campo: "", error: null, mensajeError: "Las contraseñas deben coincidir." });
  const [name, setName] = React.useState({ campo: "", error: null, mensajeError: "Ingrese un nombre válido." });
  const [lastName, setLastName] = React.useState({ campo: "", error: null, mensajeError: "Ingrese un apellido válido." });
  const [errorCuentaYaExiste, setErrorCuentaYaExiste] = React.useState(null)

  // Escucha cambios de los inputs

  const onChangeEmail = (e) => { setEmail({ ...email, campo: e.target.value }) }
  const onChangePassword = (e) => { setPassword({ ...password, campo: e.target.value }) }
  const onChangePassword2 = (e) => { setPassword2({ ...password2, campo: e.target.value }) }
  const onChangeName = (e) => { setName({ ...name, campo: e.target.value }) }
  const onChangeLastName = (e) => { setLastName({ ...lastName, campo: e.target.value }) }

  // Validaciones por cada input

  const validacionName = () => {
    return (name.campo === "" || name.campo === null || !nameRegExp.test(name.campo))  
      ? setName({ ...name, error: true })
      : setName({ ...name, error: false })
  }

  const validacionLastName = () => {
    return (lastName.campo === "" || lastName.campo === null || !lastNameRegExp.test(lastName.campo)) 
      ? setLastName({ ...lastName, error: true })
      : setLastName({ ...lastName, error: false })
  }

  const validacionEmail = () => {
    return (emailRegExp.test(email.campo))
      ? setEmail({ ...email, error: false })
      : setEmail({ ...email, error: true })
  }

  const validacionContra = () => {
    return (passwordRegExp.test(password.campo))
      ? setPassword({ ...password, error: false })
      : setPassword({ ...password, error: true })
  }

  const validacionContra2 = () => {
    return (password.campo !== password2.campo || password2.campo === "" || password2.campo === null)
      ? setPassword2({ ...password2, error: true })
      : setPassword2({ ...password2, error: false })
  }

  // Envio de form si es válido y redireccion al login para obtención de token
  const onSubmit = (e) => {
    e.preventDefault();

    validacionEmail();
    validacionContra();
    validacionContra2();
    validacionName();
    validacionLastName();
    postUser()

    if (email.error === false &&
      password.error === false &&
      password2.error === false &&
      name.error === false &&
      lastName.error === false) {
      // setFormSent(true)
      setErrorCuentaYaExiste(false)
      setErrorPost(false)
      setWarning(false)
      // swal({
      //   text: "¡Revise su correo para validar su cuenta!",
      //   icon: "/images/email.png",
      //   button: "¡Entendido!",
      // });
    }
  }

  // Envio de datos para crear un nuevo usuario
  async function postUser() {
    axios.post(`${api}usuarios`, {
      nombre: name.campo,
      apellido: lastName.campo,
      email: email.campo,
      contraseña: password.campo,
      ciudad: "",
      rol: {
        id: 2,
      }
    })
      .then(function (response) {
        console.log(response);
        setFormSent(true)
        setErrorPost(false)
        swal({
          text: "¡Revise su correo para validar su cuenta!",
          icon: "/images/email.png",
          button: "¡Entendido!",
        });
      })
      .catch(function (error) {
        console.log(error.response);
        console.log(error.response.status);
        if (error.response.data === 'Este email ya esta asociada con una cuenta creada') {
          setErrorCuentaYaExiste(true)
          setErrorPost(false)
          setFormSent(false)
        } else {
          setFormSent(false)
          setErrorPost(true)
        }
      })
  }

  return (
    <>
      <div className='signup'>
        <div className='form-container'>
          <form onSubmit={onSubmit}>
            <h1>Crear cuenta</h1>
            {formSent ? <div className='form-sent' style={{ justifyContent: 'center' }}><small>📫 ¡Revise su correo para validar su cuenta!</small></div> : null}
            {errorPost && <div className='error' style={{ justifyContent: 'center' }}><small>Lamentablemente no ha podido registrarse. Por favor intente más tarde.</small></div>}
            {errorCuentaYaExiste && <div className='error' style={{ justifyContent: 'center' }}><small>Este email ya esta asociado a una cuenta existente.</small></div>}
            <div className='input-half'>
              <div style={{ marginRight: '5px' }}>
                <label htmlFor="nombre">Nombre</label>
                <input
                  className={name.error ? 'hasError' : 'noError'}
                  type="text"
                  name="nombre"
                  value={name.campo}
                  onChange={onChangeName}
                  onBlur={validacionName}
                  autoComplete="username"
                />
                {name.error && <div className='error'><small>{name.mensajeError}</small></div>}
              </div>
              <div>
                <label htmlFor="apellido">Apellido</label>
                <input
                  className={lastName.error ? 'hasError' : 'noError'}
                  type="text"
                  name="apellido"
                  value={lastName.campo}
                  onChange={onChangeLastName}
                  onBlur={validacionLastName}
                />
                {lastName.error && <div className='error'><small>{lastName.mensajeError}</small></div>}
              </div>
            </div>
            <div className="form-group">
              <label htmlFor="email">Correo electrónico</label>
              <input
                className={email.error ? 'hasError' : 'noError'}
                type="email"
                name="email"
                value={email.campo}
                onChange={onChangeEmail}
                onBlur={validacionEmail}
                autoComplete="email"
              />
              {email.error && <div className='error'><small>{email.mensajeError}</small></div>}
            </div>
            <div className="form-group">
              <label htmlFor="contraseña">Contraseña</label>
              <input
                className={password.error ? 'hasError' : 'noError'}
                type="password"
                name="contraseña"
                value={password.campo}
                onChange={onChangePassword}
                onBlur={validacionContra}
                autoComplete="current-password"
              />
              {password.error && <div className='error'><small>{password.mensajeError}</small></div>}
            </div>
            <div className="form-group">
              <label htmlFor="contraseña2">Confirmar contraseña</label>
              <input
                className={password2.error ? 'hasError' : 'noError'}
                type="password"
                name="contraseña2"
                value={password2.campo}
                onChange={onChangePassword2}
                onBlur={validacionContra2}
                autoComplete="current-password"
              />
              {password2.error && <div className='error'><small>{password2.mensajeError}</small></div>}
            </div>
            <button type='submit'>Crear cuenta</button>
            <span>¿Ya tienes una cuenta? <Link to='/login' style={{ color: "#5993F5" }}>Iniciar sesión</Link> </span>
          </form>
        </div>
      </div>
    </>
  )
}

export default SignUp