import React, { useContext, useEffect, useState } from "react";
import { DataContext } from "../Context/DataContext";
import { Link } from "react-router-dom";
import { GoLocation } from "react-icons/go";
import { BsWifi } from "react-icons/bs";
import { BiSwim } from "react-icons/bi";
import Api from "../../Helpers/Api";

const Listing = () => {
  const dataReady = useContext(DataContext);
  const products = useContext(DataContext);

  // const results = 4;
  // const [dataAPI, setDataAPI] = useState(products.products);
  // const [pagination, setPagination] = useState([...dataAPI].splice(0, results));
  // const [currentShowing, setCurrentShowing] = useState(0);

  if (!dataReady) {
    return (
      <div className="Loading Data">
        <h3>Cargando Datos</h3>
      </div>
    );
  } else {
    let feedback = [];
    // let average = () =>

    const check = document.getElementById("bt-create-account");
    // const shuffle = (arr) => [...arr].sort(() => Math.random() - 0.5);
    // const productsS = shuffle(products.products);

    if (check) {
      return (
        <div className="listing-container">
          <h1>Recomendaciones</h1>
          <ul>
            {products.products &&
              products.products.map(
                (product) => (
                  product.imagenes &&
                    product.imagenes.sort((a, b) => a.id - b.id),
                  (
                    <li className="listing-card" key={product.id}>
                      <img
                        src={product.imagenes[0] && product.imagenes[0].urlImg}
                        alt={product.titulo}
                      />
                      <p className="icon-img">🤍</p>
                      <div className="listing-card-details">
                        <div className="listing-card-header ">
                          <h4>
                            {product.categoria.titulo}
                            <span className="stars-icons"> ★★★★★ </span>
                          </h4>
                          <h2>{product.nombre}</h2>
                        </div>
                        <div className="review-container">
                          <p className="review-number">
                            {product.puntuaciones
                              ? product.puntuaciones.map(
                                  (p) =>
                                    parseInt(p.valor) && feedback.push(p.valor)
                                ) &&
                                Math.trunc(
                                  feedback.reduce(
                                    (prev, curr) => (prev += curr)
                                  ) / feedback.length
                                ) * 2
                              : 8}
                          </p>
                          <h5 className="review-text">
                            {" "}
                            {feedback.length > 0 &&
                            Math.trunc(
                              feedback.reduce((prev, curr) => (prev += curr)) /
                                feedback.length
                            ) *
                              2 >=
                              6
                              ? "Muy bueno"
                              : "Regular"}
                          </h5>
                          {/* <p className="review-number"> 8 </p>
                          <h5 className="review-text">Muy Bueno</h5> */}
                        </div>

                        <h4>
                          <br />

                          <GoLocation className="icons" />
                          {}
                          {"  A 940 m del centro  "}
                          <a
                            href={product.nombre}
                            rel="noreferrer"
                            target={"_blank"}
                          >
                            MOSTRAR EN EL MAPA
                          </a>
                          <p className="icons-amenities">
                            <BsWifi className="icons" />
                            <BiSwim className="icons" />
                          </p>
                          <br />
                        </h4>

                        <h5>
                          {product.descripcion}{" "}
                          <a href="https://digitalhouse.com">más...</a>
                        </h5>

                        <Link
                          to={`productos/${product.id}`}
                          className="listing-card-button"
                          type="button"
                        >
                          Ver más
                        </Link>
                      </div>
                    </li>
                  )
                )
              )}
          </ul>
        </div>
      );
    } else {
      // let feedback = [];
      // let average = () =>
      //   Math.trunc(
      //     feedback.reduce((prev, curr) => (prev += curr)) / feedback.length
      //   ) * 2;

      return (
        <div className="listing-container">
          <h1>Recomendaciones</h1>
          <ul>
            {products.products &&
              products.products.map(
                (product) => (
                  product.imagenes &&
                    product.imagenes.sort((a, b) => a.id - b.id),
                  (
                    <li className="listing-card" key={product.id}>
                      <img
                        src={product.imagenes[0] && product.imagenes[0].urlImg}
                        alt={product.titulo}
                      />
                      <p className="icon-img">🤍</p>
                      <div className="listing-card-details">
                        <div className="listing-card-header ">
                          <h4>
                            {product.categoria.titulo}
                            <span className="stars-icons"> ★★★★★ </span>
                          </h4>
                          <h2>{product.nombre}</h2>
                        </div>
                        <div className="review-container">
                          <p className="review-number">
                            {product.puntuaciones
                              ? product.puntuaciones.map(
                                  (p) =>
                                    parseInt(p.valor) && feedback.push(p.valor)
                                ) &&
                                Math.trunc(
                                  feedback.reduce(
                                    (prev, curr) => (prev += curr)
                                  ) / feedback.length
                                ) * 2
                              : 8}
                          </p>
                          <h5 className="review-text">
                            {" "}
                            {feedback.length > 0 &&
                            Math.trunc(
                              feedback.reduce((prev, curr) => (prev += curr)) /
                                feedback.length
                            ) *
                              2 >=
                              6
                              ? "Muy bueno"
                              : "Regular"}
                          </h5>
                          {/* <p className="review-number"> 8 </p>
                          <h5 className="review-text">Muy Bueno</h5> */}
                        </div>

                        <h4>
                          <br />

                          <GoLocation className="icons" />
                          {"  A 940 m del centro  "}
                          <a
                            href={product.nombre}
                            rel="noreferrer"
                            target={"_blank"}
                          >
                            MOSTRAR EN EL MAPA
                          </a>
                          <p className="icons-amenities">
                            <BsWifi className="icons" />
                            <BiSwim className="icons" />
                          </p>
                          <br />
                        </h4>

                        <h5>
                          {product.descripcion}{" "}
                          <a href="https://digitalhouse.com">más...</a>
                        </h5>
                        <Link
                          to={`productos/${product.id}`}
                          className="listing-card-button"
                          type="button"
                        >
                          Ver más
                        </Link>
                      </div>
                    </li>
                  )
                )
              )}
          </ul>
        </div>
      );
    }
  }
};

export default Listing;
