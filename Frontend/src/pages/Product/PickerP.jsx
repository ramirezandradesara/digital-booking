import React, { useState, useContext } from "react";
import { DateContext } from "../../components/Context/DateContext";
import DatePicker, { registerLocale } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { Link, useNavigate } from "react-router-dom";
import es from "date-fns/locale/es";
import { Context } from "../../context/Context";

registerLocale("es", es);

function Picker_() {
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(null);

  const addDays = (date, days) => {
    const copy = new Date(Number(date));
    copy.setDate(date.getDate() + days);
    return copy;
  };
  const subDays = (date, days) => {
    const copy = new Date(Number(date));
    copy.setDate(date.getDate() - days);
    return copy;
  };

  const navigate = useNavigate();
  const { auth, setAuth, jwt, setJwt, warning, setWarning } =
    useContext(Context);

  function userLogged() {
    if (auth) {
      navigate("reserva");
    } else {
      setWarning(true);
      navigate("/login");
    }
  }

  return (
    <div className="react-datepicker-wrapper-prod">
      <div className="datepicker-desktop">
        <div className="react-datepicker-wrapper__picker">
          <DatePicker
            disabled
            monthsShown={2}
            locale={es}
            inline
            minDate={new Date()}
            disabledKeyboardNavigation
            disabledDayAriaLabelPrefix="No disponible"
            className="react-datepicker-wrapper__picker-input"
            excludeDates={[addDays(new Date(), 1), addDays(new Date(), 5)]}
            excludeDateIntervals={[
              { start: subDays(new Date(), 5), end: addDays(new Date(), 5) },
            ]}
          />
        </div>
        <div className="react-datepicker-card">
          <div className="react-datepicker-card__body">
            <h4>Agregá tus fechas de viaje para obtener precios exactos</h4>
            {/* <Link
            to={auth ? 'reserva' : '/login'}
            className="seeker-button seeker-item wrapper-calendar-button"
            type="button"
          >
            Iniciar reserva
          </Link> */}
            <button
              onClick={() => userLogged()}
              className="seeker-button seeker-item wrapper-calendar-button"
            >
              Iniciar reserva
            </button>
          </div>
        </div>
      </div>

      <div className="datepicker-mobile">
        <div className="react-datepicker-wrapper__picker">
          <DatePicker
            disabled
            locale={es}
            inline
            minDate={new Date()}
            disabledKeyboardNavigation
            disabledDayAriaLabelPrefix="No disponible"
            className="react-datepicker-wrapper__picker-input"
            excludeDates={[addDays(new Date(), 1), addDays(new Date(), 5)]}
            excludeDateIntervals={[
              { start: subDays(new Date(), 5), end: addDays(new Date(), 5) },
            ]}
          />
        </div>
        <div className="react-datepicker-card">
          <div className="react-datepicker-card__body">
            <h4>Agregá tus fechas de viaje para obtener precios exactos</h4>
            {/* <Link
              to={auth ? 'reserva' : '/login'}
              className="seeker-button seeker-item wrapper-calendar-button"
              type="button"
            >
              Iniciar reserva
            </Link> */}
            <button
              onClick={() => userLogged()}
              className="seeker-button seeker-item wrapper-calendar-button"
            >
              Iniciar reserva
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
export default Picker_;
