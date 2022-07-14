import React, { useContext, useEffect, useState } from "react";
import { DataContext } from "../Context/DataContext";
import dateFormat, { masks } from "dateformat";
import Select from "react-select";
import Api from "../../Helpers/Api";
import DatePicker, { registerLocale } from "react-datepicker";
import es from "date-fns/locale/es";
import "react-datepicker/dist/react-datepicker.css";
import { each } from "jquery";
import { IoLocationSharp } from "react-icons/io5";
import swal from "sweetalert";
import scrollTo from "../../funcionesJS/scrollTo";

registerLocale("es", es);

const Seeker = () => {
  const [value, setValue] = useState(null);
  const cities = useContext(DataContext);
  const filter = useContext(DataContext);
  const products = useContext(DataContext);

  const dateRange = useContext(DataContext);
  const startDate = dateRange.startDate;
  const endDate = dateRange.endDate;

  const startDates = useContext(DataContext);
  const endDates = useContext(DataContext);

  startDates.startDates && startDates.startDates.sort();
  endDates.endDates && endDates.endDates.sort();

  function handleChange(e) {
    setValue(e);
  }

  // VERSIÓN ALTERNATIVA (85%) DE LA FUNCIÓN QUE SETEA PRODUCTOS DESCARTANDO LOS QUE TIENEN RESERVAS DESDE EL FRONTEND
  // function handleOnClick() {
  //   let dateOne = dateFormat(dateRange.startDate, "isoDate");
  //   let dateTwo = dateFormat(dateRange.endDate, "isoDate");
  //   let bookingDatesStart = startDates.startDates[0];
  //   let bookingDatesEnd = endDates.endDates[endDates.endDates.length - 1];

  //   if (
  //     bookingDatesStart >= dateOne ||
  //     dateOne <= bookingDatesEnd ||
  //     bookingDatesEnd >= dateTwo ||
  //     dateTwo <= bookingDatesEnd
  //   ) {
  //     console.log("esta dentro del rango de reservas");
  //     let results = products.products.filter(
  //       (p) =>
  // // !p.reservas.filter((r) => {
  //           // return r.fechaInicio >= dateOne && r.fechaFinal <= dateTwo;
  //           r.fechaInicio.includes(dateOne);
  //         })
  //     );
  //     console.log("RESULTS: ", results);
  //     products.setProducts(results);
  //   } else {
  //     console.log("esta fuera del rango de reservas");
  //   }
  //   // filter.setFilter(Api + `productos/ubicacion/${value.id}`);
  //   // console.log("Se restablecio el filtro");
  // }

  function handleOnClick() {
    //VERSION SOLICITADA, CONSULTA EL ENDPOINT DE PRODUCTOS CON LA UBICACION SELECCIONADA Y EL RANGO DE FECHAS
    let dateOne = dateFormat(dateRange.startDate, "isoDate");
    let dateTwo = dateFormat(dateRange.endDate, "isoDate");
    if (
      value !== null &&
      dateRange.startDate !== null &&
      dateRange.endDate !== null
    ) {
      scrollTo();
      filter.setFilter(
        Api +
          `productos/ubicacion/${value.id}/fechainicial/${dateOne}/fechafinal/${dateTwo}`
      );
    } else if (
      value === null &&
      dateRange.startDate !== null &&
      dateRange.endDate !== null
    ) {
      swal({
        text: "Seleccione una ubicación",
        icon: "warning",
        button: "¡Entendido!",
      });
    } else if (
      value !== null &&
      dateRange.startDate === null &&
      dateRange.endDate === null
    ) {
      scrollTo();
      filter.setFilter(Api + `productos/ubicacion/${value.id}`);
      setValue((e) => {
        e.label = "Todas las ubicaciones";
      });
      handleChange(null);
    } else if (
      value !== null &&
      dateRange.startDate !== null &&
      dateRange.endDate === null
    ) {
      swal({
        text: "Seleccione una fecha de salida",
        icon: "warning",
        button: "¡Entendido!",
      });
    } else {
      filter.setFilter(Api + `productos`); //REFRESH FILTER
      // swal({
      //   text: "Seleccione una ubicación y un rango de fechas",
      //   icon: "warning",
      //   button: "¡Entendido!",
      // });
    }
  }

  const options = cities.cities.map((c) => ({
    id: c.id,
    label: "  " + c.ciudad,
    value: c.ciudad,
    // customAbbreviation: c.ciudad,
  }));

  const formatOptionLabel = ({ options, value, label }) => (
    <div style={{ display: "flex", alignItems: "center" }}>
      <div>{options}</div>
      <div style={{ marginLeft: "5px", color: "hsl(0, 0%, 50%)" }}>
        <IoLocationSharp /> {label}
      </div>
    </div>
  );

  return (
    <div className="seeker-container">
      <h1>Busca ofertas en hoteles, casas y mucho más</h1>
      <p></p>
      <div className="seeker-select">
        <Select
          formatOptionLabel={formatOptionLabel}
          options={options}
          onChange={handleChange}
          placeholder={"🔍 ¿A dónde vamos?"}
          className="seeker-item"
          Value={value}
          isClearable={true}
        />

        <div className="seeker-picker css-b62m3t-container">
          <div>
            <DatePicker
              startDate={startDate}
              endDate={endDate}
              format="yyyy-MM-dd"
              onChange={(update) => {
                dateRange.setDateRange(update);

                // console.log(update[0], update[1]);
              }}
              selectsRange={true}
              dateFormat="dd-MM-yyyy"
              minDate={new Date()}
              isClearable={true}
              monthsShown={2}
              placeholderText={"📅 Check in - Check out"}
              locale="es"
              onClickOutside={true}
              className="input-level seeker-item"
            />
          </div>
        </div>
        <div className="">
          <button
            onClick={handleOnClick}
            className="seeker-button"
            type="button"
          >
            Buscar
          </button>
        </div>
      </div>
    </div>
  );
};

export default Seeker;
