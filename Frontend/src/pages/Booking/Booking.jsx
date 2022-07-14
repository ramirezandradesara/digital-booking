import { Formik, Form, Field, ErrorMessage, useFormikContext } from "formik";
import { DateContext } from "../../components/Context/DateContext";
import React, { useEffect, useState, useContext } from "react";
import { Link, useParams } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import { BsCheck2Circle } from "react-icons/bs";
import { MdLocationOn } from "react-icons/md";
import Calendar from "../Booking/Calendar";
import success from "./success-icon.svg";
import dateFormat from "dateformat";
import Select from "react-select";
import Api from "../../Helpers/Api";
import axios from "axios";
import { Context } from "../../context/Context";
import { useJwt } from "react-jwt";
import swal from 'sweetalert';

import "./Booking.scss";

function Booking() {
  const { token } = useContext(Context);
  const { decodedToken, isExpired } = useJwt(token);
  const { id } = useParams();

  const userId = decodedToken?.id;
  const userName = decodedToken?.nombre;
  const userLastname = decodedToken?.apellido;
  const userEmail = decodedToken?.sub;

  /* LÓGICA CALENDARIO */

  const idProduct = useContext(DateContext);
  idProduct.setIdProduct(id);

  const startDate = useContext(DateContext);
  const endDate = useContext(DateContext);
  const product = useContext(DateContext);
  const [bookingOk, setBookingOk] = useState(false);

  /* SELECT */

  const [selectedOption, setSelectedOption] = useState({
    value: "",
    label: "",
  });

  /* HORARIOS SELECT */

  const options = [
    { value: "01:00:00", label: "01:00 AM" },
    { value: "02:00:00", label: "02:00 AM" },
    { value: "03:00:00", label: "03:00 AM" },
    { value: "04:00:00", label: "04:00 AM" },
    { value: "05:00:00", label: "05:00 AM" },
    { value: "06:00:00", label: "06:00 AM" },
    { value: "07:00:00", label: "07:00 AM" },
    { value: "08:00:00", label: "08:00 AM" },
    { value: "09:00:00", label: "09:00 AM" },
    { value: "10:00:00", label: "10:00 AM" },
    { value: "11:00:00", label: "11:00 AM" },
    { value: "12:00:00", label: "12:00 PM" },
    { value: "13:00:00", label: "01:00 PM" },
    { value: "14:00:00", label: "02:00 PM" },
    { value: "15:00:00", label: "03:00 PM" },
    { value: "16:00:00", label: "04:00 PM" },
    { value: "17:00:00", label: "05:00 PM" },
    { value: "18:00:00", label: "06:00 PM" },
    { value: "19:00:00", label: "07:00 PM" },
    { value: "20:00:00", label: "08:00 PM" },
    { value: "21:00:00", label: "09:00 PM" },
    { value: "22:00:00", label: "10:00 PM" },
    { value: "23:00:00", label: "11:00 PM" },
    { value: "24:00:00", label: "12:00 AM" },
  ];

  /* ESTILOS SELECT */

  const customStyles = {
    control: (base, state) => ({
      ...base,
      height: "50px",
      width: "100%",
      border: "1px solid #ccc",
      borderRadius: "5px",
      boxShadow: "0px 1px 5px rgba(0, 0, 0, 0.15)",
      fontSize: "15px",
      fontWeight: "700px",
    }),
    option: (provided, state) => ({
      ...provided,
      borderBottom: "1px dotted pink",
      fontSize: "15px",
      color: "#383B58",
      fontWeight: "700",
      color: state.isSelected ? "#ffffff" : "#383B58",
    }),
  };

  const producto = product && product.product;
  const gallery =
    product.product.imagenes &&
    product.product.imagenes.sort((a, b) => a.id - b.id);

  if (!bookingOk) {
    return (
      <>
        <div className="booking">
          <div className="header-product">
            <div>
              <h4>{producto.categoria?.titulo.toUpperCase()}</h4>
              <h1>{producto.nombre}</h1>
            </div>
            <Link to="/">
              <IoIosArrowBack />
            </Link>
          </div>

          <h1 className="title-form">Completá tus datos</h1>
          <Formik
            initialValues={{
              name: userName,
              lastname: userLastname,
              email: userEmail,
              city: "",
              hora: "",
              fechaInicio: dateFormat(startDate.startDate, "yyyy-mm-dd"),
              fechaFinal: dateFormat(endDate.endDate, "yyyy-mm-dd"),
              producto: { id: parseInt(id) },
              usuario: { id: userId },
              vacunado: false,
              datosExtra: "",
            }}
            enableReinitialize
            validate={(values) => {
              let error = {};

              if (!values.name) {
                error.name = "Por favor, ingresa tu nombre";
              } 
              // else if (!/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(values.name)) {
              //   error.name = "El nombre solo puede contener letras";
              // }

              if (!values.lastname) {
                error.lastname = "Por favor, ingresa tu apellido";
              }
              //  else if (!/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(values.lastname)) {
              //   error.lastname = "El apellido solo puede contener letras";
              // }

              if (!values.email) {
                error.email = "Por favor, ingresa un correo electrónico";
              } else if (
                !/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/.test(
                  values.email
                )
              ) {
                error.email =
                  "El correo solo puede contener letras, números, puntos y guiones ";
              }

              if (!values.city) {
                error.city = "Por favor, ingresa la ciudad";
              } else if (!/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(values.city)) {
                error.city = "La ciudad solo puede contener letras";
              }

              if (!values.hora) {
                error.hora = "Por favor, registra tu hora de llegada";
              }

              return error;
            }}
            onSubmit={(values, { resetForm }) => {
              console.log(values, "Sended");

              // POST crear reserva
              async function postBooking() {
                const data = JSON.stringify({
                  hora: values.hora,
                  fechaInicio: values.fechaInicio,
                  fechaFinal: values.fechaFinal,
                  producto: {
                    id: parseInt(id),
                  },
                  usuario: {
                    id: decodedToken?.id,
                  },
                  datosExtra: values.datosExtra,
                  vacunado: values.vacunado,
                });

                var config = {
                  method: "POST",
                  url: `${Api}reservas`,
                  data: data,
                  headers: {
                    Authorization: `Bearer ${token}`,
                    "Content-Type": "application/json",
                  },
                };

                axios(config)
                  .then(function (response) {
                    setBookingOk(true);
                  })
                  .catch(function (error) {
                    console.log(error);
                    swal({
                      text: "Lamentablemente la reserva no ha podido realizarse. Por favor, reintente más tarde.",
                      icon: "error",
                      button: "¡Entendido!",
                    });
                  });
              }
              postBooking();
              // setBookingOk(true);
            }}
          >
            {/* {({ values, errors, touched, handleChange, handleBlur, handleSubmit }) => ( */}
            {({ errors, setFieldValue }) => (
              <Form>
                {/* // <form onSubmit={handleSubmit}> */}
                <div className="booking-information">
                  <div className="form">
                    <section className="form-inputs">
                      <div className="card-booking">
                        <div className="inputs-div">
                          <label htmlFor="name">Nombre</label>
                          {/* <input */}
                          <Field
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Nombre"
                            disabled
                          // value={values.name}
                          // onChange={handleChange}
                          // onBlur={handleBlur}
                          />
                          <ErrorMessage
                            name="name"
                            component={() => (
                              <div className="error-input">{errors.name}</div>
                            )}
                          />
                          {/* {touched.name && errors.name && <div className='error-input'>{errors.name}</div>} */}
                          <label htmlFor="lastname">Apellido</label>
                          <Field
                            type="text"
                            id="lastname"
                            name="lastname"
                            placeholder="Apellido"
                            disabled
                          />
                          <ErrorMessage
                            name="lastname"
                            component={() => (
                              <div className="error-input">
                                {errors.lastname}
                              </div>
                            )}
                          />
                        </div>
                        <div className="inputs-div">
                          <label htmlFor="email">Email</label>
                          <Field
                            type="email"
                            id="email"
                            name="email"
                            placeholder="mail@example.com"
                            disabled
                          />
                          <ErrorMessage
                            name="email"
                            component={() => (
                              <div className="error-input">{errors.email}</div>
                            )}
                          />
                          <label htmlFor="city">Ciudad</label>
                          <Field
                            type="text"
                            id="city"
                            name="city"
                            placeholder="Ciudad"
                          />
                          <ErrorMessage
                            name="city"
                            component={() => (
                              <div className="error-input">{errors.city}</div>
                            )}
                          />
                        </div>
                      </div>
                    </section>

                    <section className="booking-date">
                      <h1>Seleccioná tu fecha de reserva</h1>
                      <div className="card-booking">
                        <Calendar />
                      </div>
                    </section>

                    <section className="check-in">
                      <h1>Tu horario de llegada</h1>
                      <div className="card-booking">
                        <div className="title-check-in">
                          <BsCheck2Circle />
                          <h4>
                            Tu habitación va a estar lista para el check-in
                            entre las 10:00 AM y las 11:00 PM.
                          </h4>
                        </div>

                        <h4 className="subtitle-check-in">
                          Indicá tu horario estimado de llegada
                        </h4>

                        <Select
                          name="hora"
                          id="hora"
                          required
                          styles={customStyles}
                          defaultValue={{
                            value: "",
                            label: "Seleccionar una hora de llegada",
                          }}
                          onChange={(e) => setFieldValue("hora", e.value)}
                          options={options}
                          theme={(theme) => ({
                            ...theme,
                            borderRadius: 0,
                            colors: {
                              ...theme.colors,
                              primary25: "#BEBEBE",
                              primary: "#1DBEB4",
                              color: "#383B58",
                              fontWeight: "700",
                            },
                          })}
                        />
                        <ErrorMessage
                          name="hora"
                          component={() => (
                            <div className="error-input">{errors.hora}</div>
                          )}
                        />
                      </div>
                    </section>
                  </div>

                  <section className="booking-details">
                    <div className="card-booking">
                      <h1 className="title-booking-details">
                        Detalle de la reserva
                      </h1>

                      <div className="content-booking-details">
                        <div className="image-container">
                          <div
                            className="image"
                            style={{ backgroundImage: `url(${gallery && gallery[0].urlImg})` }}
                          ></div>
                        </div>

                        <div className="bottom-booking-details">
                          <h4 className="category-title">
                            {producto.categoria?.titulo.toUpperCase()}
                          </h4>
                          <h1>{producto.nombre}</h1>

                          <div className="location-booking-details">
                            <div style={{ alignSelf: 'flex-start'}}>
                              <MdLocationOn />
                            </div>
                            <div className="direccion">
                              <h4 style={{marginTop:'-4px', marginLeft: '4px'}}>
                                {producto.direccion}
                              </h4>
                            </div>
                          </div>

                          <div className="check-in-booking-details">
                            <hr className="hr-booking" />
                            <div className="check-in-check-out">
                              <h4>Check in </h4>
                              <h4 className="datesBooking">
                                {dateFormat(startDate.startDate, "yyyy/mm/dd")}
                              </h4>
                            </div>
                            <hr className="hr-booking" />
                            <div className="check-in-check-out">
                              <h4>Check out </h4>
                              <h4 className="datesBooking">
                                {dateFormat(endDate.endDate, "yyyy/mm/dd")}
                              </h4>
                            </div>
                            <hr className="hr-booking" />
                            <div className="textarea-booking">
                              <Field
                                name="datosExtra"
                                placeholder="Datos adicionales para el vendedor"
                                as="textarea"
                              />
                            </div>
                            <div className="checkbox-booking">
                              <label className="container">
                                Estoy vacunado contra el COVID-19
                                <Field type="checkbox" name="vacunado" />
                                <span className="checkmark"></span>
                              </label>
                            </div>
                            <button type="sumbit">Confirmar reserva</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>
                </div>
                <p className="success-submit"></p>
                {/* </form> */}
              </Form>
            )}
          </Formik>
        </div>

        <div className="politics-product">
          <div className="politics-title">
            <h1>Qué tenés que saber</h1>
            <hr />
          </div>
          <div className="politics-grid-container">
            <div className="politics-items">
              <h3> Normas de la casa</h3>
              {producto.politicas
                ?.filter((politica) => politica.tipo === "NORMAS")
                .map((politica, index) => {
                  return <div key={index}>{politica.descripcion}</div>;
                })}
            </div>
            <div className="politics-items">
              <h3> Salud y seguridad</h3>
              {producto.politicas
                ?.filter((politica) => politica.tipo === "SEGURIDAD")
                .map((politica, index) => {
                  return <div key={index}>{politica.descripcion}</div>;
                })}
            </div>
            <div className="politics-items">
              <h3> Política de cancelación</h3>
              {producto.politicas
                ?.filter((politica) => politica.tipo === "CANCELACION")
                .map((politica, index) => {
                  return <div key={index}>{politica.descripcion}</div>;
                })}
            </div>
          </div>
        </div>
      </>
    );
  } else {
    return (
      <>
        <div className="booking-alternative">
          <div className="booking-success-container">
            <div className="booking-success-card card-booking">
              <img src={success} className="success-icon" alt="Success" />
              <h1>¡Muchas gracias!</h1>
              <h3>Su reserva se ha realizado con éxito</h3>

              <Link to="/" className="booking-button">
                ok
              </Link>
            </div>
          </div>
        </div>
      </>
    );
  }
}

export default Booking;
