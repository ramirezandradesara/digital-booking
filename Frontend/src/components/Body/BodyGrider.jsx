import React, { useContext, useEffect, useState } from "react";
import { DataContext } from "../Context/DataContext";
import Glider from "react-glider";
import "glider-js/glider.min.css";
import Api from "../../Helpers/Api";

import scrollTo from "../../funcionesJS/scrollTo";
import { Autoplay } from "swiper";

function Grider() {
  const dataReady = useContext(DataContext);
  const categories = useContext(DataContext);
  const filter = useContext(DataContext);
  const categoriesS = categories.categories.slice(2, 6);

  if (!dataReady) {
    return (
      <div className="Loading Data">
        <h3>Cargando Datos</h3>
      </div>
    );
  } else {
    return (
      <div className="grider-container">
        <h2>Buscar por tipo de alojamiento</h2>
        <div className="grider-card">
          <Glider draggable hasDots slidesToShow={"auto"}>
            {/* {categoriesS.map((category, i) => ( */}
            {categories.categories.map((category, i) => (
              <div
                key={category.id}
                className="grider-card-item"
                onClick={() => {
                  scrollTo();
                  filter.setFilter(Api + `productos/categoria/${category.id}`);
                }}
              >
                <img src={category.urlImagen} alt={category.titulo} />

                <div className="grider-card-details">
                  <h3>{category.titulo}</h3>

                  <p>{category.descripcion}</p>
                </div>
              </div>
            ))}
          </Glider>
        </div>
      </div>
    );
  }
}

export default Grider;
