import React, { useEffect, useState, useContext } from "react";
import Api from "../../Helpers/Api";
import axios from "axios";
import { Link, useParams } from "react-router-dom";
import { Context } from "../../context/Context";
import { useJwt } from "react-jwt";
import { IoIosArrowBack } from "react-icons/io";
import SelectCategory from "react-select";
import SelectCity from "react-select";
import "./AdminProduct.scss";
import success from "../Booking/success-icon.svg";
import { Formik, Form, Field, ErrorMessage, useFormikContext } from "formik";
import NotFound from "../NotFound/NotFound";
import swal from 'sweetalert';

function AdminProduct() {
  const { token, auth, admin } = useContext(Context);
  const [newBooking, setNewBooking] = useState(false);

  /* SELECT CATEGORÍAS */
  const [categories, setCategories] = useState([]);

  const getCategories = async () => {
    try {
      const response = await fetch(Api + "categorias");
      const data = await response.json();
      setCategories(data);
    } catch (error) {
      console.log(error);
    }
  };

  const categoryOptions = categories?.map((c) => ({
    label: c.titulo,
    value: c.titulo,
    id: c.id,
  }));

  /* SELECT CIUDAD */
  const [cities, setCities] = useState([]);

  const getCities = async () => {
    try {
      const response = await fetch(Api + "ubicaciones");
      const data = await response.json();
      setCities(data);
    } catch (error) {
      console.log(error);
    }
  };

  const cityOptions = cities?.map((c) => ({
    label: c.ciudad,
    value: c.ciudad,
    id: c.id,
  }));

  useEffect(() => {
    getCities();
    getCategories();
  }, []);

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

  /* INPUTS VALIDATION */
  
  const [inputs, setInputs] = useState([{ urlImg: "" }]);

  const handleInputsChange = (e, i) => {
    const { name, value } = e.target;
    const array = [...inputs];
    array[i][name] = value;
    setInputs(array);
  };

  const handleQuit = (i) => {
    const array = [...inputs];
    array.splice(i, 1);
    setInputs(array);
  };

  const handleAdd = () => {
    setInputs([...inputs, { urlImg: "" }]);
    console.log(inputs);
  };

  if (auth && admin && !newBooking) {
    return (
      <>
        <div className="header-product">
          <div>
            <h1>Administración</h1>
          </div>
          <Link to="/">
            <IoIosArrowBack />
          </Link>
        </div>

        <div className="admin-product-container">
          <h1 className="title-form">Crear propiedad</h1>
          <div className="form-container">
            <Formik
              initialValues={{
                nombre: "",
                direccion: "",
                latitud: "",
                longitud: "",
                descripcion: "",
                ciudad: "",
                categoria: "",
                caracteristicas: [],
                CheckIn: "",
                CheckOut: "",
                Covid: "",
                Cancel: "",
                Fumar: "",
                Party: "",
                Smoke: "",
                Safe: "",
                urlImg: [],
              }}
              validate={(valores) => {
                let errores = {};

                if (!valores.nombre) {
                  errores.nombre = "El nombre es requerido";
                } else if (!/^[a-zA-ZÀ-ÿ\s]{1,40}$/.test(valores.nombre)) {
                  errores.nombre = "El nombre no es válido";
                }

                if (!valores.direccion) {
                  errores.direccion = "La dirección es requerida";
                }

                if (!valores.latitud) {
                  errores.latitud = "La latitud es requerida";
                } 
                // else if (!/^[0-9]{1,10}$/.test(valores.latitud)) {
                //   errores.latitud = "La latitud no es válida";
                // }

                if (!valores.longitud) {
                  errores.longitud = "La longitud es requerida";
                } 
                // else if (!/^[0-9]{1,10}$/.test(valores.longitud)) {
                //   errores.longitud = "La longitud no es válida";
                // }

                if (!valores.descripcion) {
                  errores.descripcion = "La descripción es requerida";
                }

                if (!valores.caracteristicas) {
                  errores.caracteristicas =
                    "Las características son requeridas";
                }

                if (valores.caracteristicas.length === 0) {
                  errores.caracteristicas =
                    "Seleccione como mínimo 1 característica";
                }

                if (!valores.ciudad) {
                  errores.ciudad = "La ciudad es requerida";
                }

                if (!valores.categoria) {
                  errores.categoria = "La categoría es requerida";
                }

                if (
                  !valores.CheckIn ||
                  !valores.CheckOut ||
                  !valores.Covid ||
                  !valores.Cancel ||
                  !valores.Fumar ||
                  !valores.Party ||
                  !valores.Smoke ||
                  !valores.Safe
                ) {
                  errores.CheckIn = "Seleccione todas las políticas";
                }

                if (!inputs || inputs.length < 5) {
                  errores.urlImg =
                    "Debe cargar al menos 5 imágenes de la propiedad";
                }

                if (/^(ftp|http|https):\/\/[^ "]+$/.test(inputs.urlImg)) {
                  errores.urlImg = "La URL debe tener el formato apropiado";
                }

                return errores;
              }}
              onSubmit={(valores, { resetForm }) => {
                async function postProduct() {
                  // Transforma el array de características en objetos con ID
                  const arrayCaracteristicas = [];
                  function politicas() {
                    for (let i = 0; i < valores.caracteristicas.length; i++) {
                      arrayCaracteristicas[i] = {
                        id: parseInt(valores.caracteristicas[i]),
                      };
                    }
                    return arrayCaracteristicas;
                  }
                  politicas();

                  //POST producto
                  const data = JSON.stringify({
                    nombre: valores.nombre,
                    titulo: "Disfruta de " + valores.nombre,
                    descripcion: valores.descripcion,
                    precio: 0,
                    disponible: true,
                    latitud: parseInt(valores.latitud),
                    longitud: parseInt(valores.longitud),
                    direccion: valores.direccion,
                    estrellas: 5,
                    caracteristicas: arrayCaracteristicas,
                    politicas: [
                      { id: parseInt(valores.CheckIn) },
                      { id: parseInt(valores.CheckOut) },
                      { id: parseInt(valores.Covid) },
                      { id: parseInt(valores.Cancel) },
                      { id: parseInt(valores.Fumar) },
                      { id: parseInt(valores.Party) },
                      { id: parseInt(valores.Smoke) },
                      { id: parseInt(valores.Safe) },
                    ],
                    categoria: {
                      id: valores.categoria,
                    },
                    ubicacion: {
                      id: valores.ciudad,
                    },
                  });

                  var config = {
                    method: "POST",
                    url: `${Api}productos`,
                    data: data,
                    headers: {
                      Authorization: `Bearer ${token}`,
                      "Content-Type": "application/json",
                    },
                  };

                  axios(config)
                    .then(function (response) {
                      console.log(
                        response,
                        " ---PROPIEADA CREADA CON ID: ",
                        response.data.id
                      );

                      inputs.pop();

                      // POST imagenes
                      inputs.forEach((item) => {
                        let payload = {
                          titulo: "",
                          urlImg: item.urlImg.trim(),
                          producto: { id: response.data.id },
                        };

                        axios({
                          url: `${Api}imagenes`,
                          method: "post",
                          data: payload,
                          headers: {
                            Authorization: `Bearer ${token}`,
                            "Content-Type": "application/json",
                          },
                        })
                          .then(function (responseImg) {
                            // your action after success
                            console.log(
                              "Listo el elemento: ",
                              responseImg.data.id
                            );
                            setNewBooking(true);
                          })
                          .catch(function (error) {
                            // your action on error success
                            console.log(error);
                          });
                      });

                      // resetForm();
                    })
                    .catch(function (error) {
                      console.log("El producto se creo sin imágenes");
                      console.log("Más detalles: ", error);
                      swal({
                        text: "Lamentablemente el producto no ha podido crearse. Por favor intente más tarde",
                        icon: "error",
                        button: "¡Entendido!",
                      });
                    });
                }

                postProduct();
              }}
            >
              {({ errors, setFieldValue }) => (
                <Form className="admin-form">
                  <div className="input-container-admin">
                    <div className="inputs-container">
                      <div className="input-div-admin">
                        <label htmlFor="name">Nombre de la propiedad</label>
                        <Field
                          type="text"
                          className="input-admin"
                          placeholder="Hotel Las Palmas"
                          name="nombre"
                        />
                        <ErrorMessage
                          name="nombre"
                          component={() => (
                            <div className="error-message">{errors.nombre}</div>
                          )}
                        />
                      </div>

                      <div className="input-div-admin">
                        <label htmlFor="category">Categoría</label>
                        <SelectCategory
                          name="categoria"
                          id="categoria"
                          required
                          styles={customStyles}
                          defaultValue={{
                            value: "",
                            label: "Seleccionar una categoría",
                          }}
                          onChange={(e) => setFieldValue("categoria", e.id)}
                          options={categoryOptions}
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
                          name="categoria"
                          component={() => (
                            <div className="error-message">
                              {errors.categoria}
                            </div>
                          )}
                        />
                      </div>
                    </div>
                    <div className="inputs-container">
                      <div className="input-div-admin">
                        <label htmlFor="direction">Dirección</label>
                        <Field
                          type="text"
                          className="input-admin"
                          name="direccion"
                        />
                        <ErrorMessage
                          name="direccion"
                          component={() => (
                            <div className="error-message">
                              {errors.direccion}
                            </div>
                          )}
                        />
                      </div>
                      <div className="input-div-admin">
                        <label htmlFor="city">Ciudad</label>
                        <SelectCity
                          name="ciudad"
                          id="ciudad"
                          required
                          styles={customStyles}
                          defaultValue={{
                            value: "",
                            label: "Seleccionar una ciudad",
                          }}
                          onChange={(e) => setFieldValue("ciudad", e.id)}
                          options={cityOptions}
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
                          name="ciudad"
                          component={() => (
                            <div className="error-message">
                              {errors.ciudad}
                            </div>
                          )}
                        />
                      </div>
                    </div>
                    <div className="inputs-container">
                      <div className="input-div-admin">
                        <label htmlFor="direction">Latitud</label>
                        <Field
                          type="tel"
                          className="input-admin"
                          name="latitud"
                        />
                        <ErrorMessage
                          name="latitud"
                          component={() => (
                            <div className="error-message">
                              {errors.latitud}
                            </div>
                          )}
                        />
                      </div>
                      <div className="input-div-admin">
                        <label htmlFor="longitud">Longitud</label>
                        <Field
                          type="text"
                          className="input-admin"
                          name="longitud"
                        />
                        <ErrorMessage
                          name="longitud"
                          component={() => (
                            <div className="error-message">
                              {errors.longitud}
                            </div>
                          )}
                        />
                      </div>
                    </div>
                  </div>
                  <label htmlFor="descripcion">Descripción</label>
                  <Field
                    name="descripcion"
                    placeholder="   Escribe aquí"
                    as="textarea"
                  />
                  <ErrorMessage
                    name="descripcion"
                    component={() => (
                      <div className="error-message">{errors.descripcion}</div>
                    )}
                  />
                  {/* Checkboxes */}
                  <h1>Agregar atributos</h1>
                  <div className="checkbox-container">
                    <div>
                      <label className="container">
                        Aire acondicionado
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="1"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Apto mascotas
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="2"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Calefacción
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="3"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Bodega
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="4"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Cocina
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="5"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Estacionamiento
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="6"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Gimnasio
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="7"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Televisor
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="8"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Pileta
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="9"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                    <div>
                      <label className="container">
                        Wifi
                        <Field
                          type="checkbox"
                          name="caracteristicas"
                          value="10"
                        />
                        <span className="checkmark"></span>
                      </label>
                    </div>
                  </div>
                  <ErrorMessage
                    name="caracteristicas"
                    component={() => (
                      <div className="error-message">
                        {errors.caracteristicas}
                      </div>
                    )}
                  />
                  {/* Radio buttons  */}
                  <h1>Políticas del producto</h1>
                  <div className="cards-politics-container">
                    <div className="cards-politics-setup">
                      <h3 className="title-section">Generales</h3>
                      <div className="politics-inputs">
                        <div className="politics-blocks">
                          <h3 className="title-politic">Hora check in</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="CheckIn" type="radio" value="4" />9
                              am
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="CheckIn" type="radio" value="3" />
                              10 am
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">Hora check out</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="CheckOut" type="radio" value="6" />8
                              am
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="CheckOut" type="radio" value="5" />9
                              am
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">Normativa COVID</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Covid" type="radio" value="9" />
                              País
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Covid" type="radio" value="10" />
                              OMS
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">Costo cancelación</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Cancel" type="radio" value="15" />
                              $0
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Cancel" type="radio" value="16" />
                              50%
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div className="cards-politics-setup">
                      <h3 className="title-section">Habitación</h3>

                      <div className="politics-inputs">
                        <div className="politics-blocks">
                          <h3 className="title-politic">¿Se permite fumar?</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Fumar" type="radio" value="1" />
                              Si
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Fumar" type="radio" value="2" />
                              No
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">
                            ¿Se permiten fiestas?
                          </h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Party" type="radio" value="8" />
                              Si
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Party" type="radio" value="7" />
                              No
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">¿Detector de humo?</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Smoke" type="radio" value="12" />
                              Si
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Smoke" type="radio" value="11" />
                              No
                            </label>
                          </div>
                        </div>

                        <div className="politics-blocks">
                          <h3 className="title-politic">¿Caja de seguridad?</h3>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Safe" type="radio" value="13" />
                              Si
                            </label>
                          </div>
                          <div className="radio">
                            <label className="radio-label">
                              <Field name="Safe" type="radio" value="14" />
                              No
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <ErrorMessage
                    name="CheckIn"
                    component={() => (
                      <div className="error-message">{errors.CheckIn}</div>
                    )}
                  />
                  {/* Imagenes */}
                  <h1>Cargar imágenes</h1>
                  {inputs.map((x, i) => {
                    return (
                      <div className="gallery-sender">
                        <form className="gallery-sender-form">
                          <Field
                            type="text"
                            name="urlImg"
                            placeholder="   https://..."
                            onChange={(e) => {
                              setFieldValue("urlImg", e.value);
                              handleInputsChange(e, i);
                            }}
                          />
                        </form>

                        {inputs.length !== 1 && inputs.length - 1 !== i && (
                          <button
                            name="button-add"
                            type="button"
                            className="gallery-sender-add"
                            onClick={() => handleQuit(i)}
                            style={{ background: "#545776" }}
                          >
                            x
                          </button>
                        )}

                        {inputs.length - 1 === i && (
                          <button
                            name="button-add"
                            type="button"
                            className="gallery-sender-add"
                            onClick={handleAdd}
                          >
                            +
                          </button>
                        )}
                      </div>
                    );
                  })}
                  <ErrorMessage
                    name="urlImg"
                    component={() => (
                      <div className="error-message">{errors.urlImg}</div>
                    )}
                  />
                  <div className="btn-admin">

                    <button type="submit">
                      Crear
                    </button>
                  </div>
                </Form>
              )}
            </Formik>
          </div>
        </div>
      </>
    );
  } else if (newBooking) {
    return (
      <>
        <div className="booking-alternative">
          <div className="booking-success-container">
            <div className="booking-success-card card-booking">
              <img src={success} className="success-icon" alt="Success" />

              <h3>Tu propiedad se ha creado con éxito.</h3>

              <Link to="/" className="booking-button">
                volver
              </Link>
            </div>
          </div>
        </div>
      </>
    );
  }
  //  else if (auth && !admin && !newBooking) {
  //   return (
  //     <>
  //       <NotFound />
  //     </>
  //   )
  // }
}

export default AdminProduct;
