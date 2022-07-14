import React, { useState, useEffect, useContext } from "react";
import { DateContext } from "../../components/Context/DateContext";
import DatePicker, { registerLocale } from "react-datepicker";
import eachDayOfInterval from "date-fns/eachDayOfInterval";
import "react-datepicker/dist/react-datepicker.css";
import dateFormat, { masks } from "dateformat";
import parseISO from "date-fns/parseISO";
import swal from "sweetalert";
import es from "date-fns/locale/es";

registerLocale("es", es);

const Calendar = () => {
  const booking = useContext(DateContext);
  const startDates = useContext(DateContext);
  const endDates = useContext(DateContext);
  const excluded = useContext(DateContext);

  const arrayExcluded = [];
  let exclutions = [];

  const getExcluded = () => {
    booking.booking &&
      booking.booking.forEach((reservation) => {
        arrayExcluded.push(
          eachDayOfInterval({
            start: parseISO(reservation.fechaInicio),
            end: parseISO(reservation.fechaFinal),
          })
        );
      });

    console.log(arrayExcluded, "ARRAY");

    exclutions = [].concat.apply([], arrayExcluded);
  };

  getExcluded();

  const dateRange = useContext(DateContext);
  const startDate = useContext(DateContext);
  const endDate = useContext(DateContext);

  const onChange = (dates) => {
    const [start, end] = dates;
    startDate.setStartDate(start);
    if (exclutions) {
      if (exclutions.some((date) => start <= date && date <= end)) {
        //Usar swwet alert aqui
        swal({
          text: "No puedes reservar en esas fechas",
          icon: "error",
          button: "¡Entendido!",
        });
        startDate.setStartDate(null);
      } else {
        endDate.setEndDate(end);
      }
    } else {
      endDate.setEndDate(end);
    }
  };

  return (
    <>
      <div className="react-datepicker-wrapper-prod">
        <div className="datepicker-desktop">
          <div className="react-datepicker-wrapper__picker">
            <DatePicker
              selected={null}
              onChange={onChange}
              startDate={dateRange.startDate}
              endDate={dateRange.endDate}
              monthsShown={2}
              selectsRange
              locale={es}
              inline
              dateFormat="dd-MM-yyyy"
              className="react-datepicker-wrapper__picker-input"
              excludeDates={exclutions}
              minDate={new Date()}
            />
          </div>
        </div>
      </div>
      <div className="datepicker-mobile">
        <div className="react-datepicker-wrapper__picker">
          <DatePicker
            selected={null}
            onChange={onChange}
            startDate={dateRange.startDate}
            endDate={dateRange.endDate}
            // monthsShown={2}
            selectsRange
            locale={es}
            inline
            dateFormat="dd-MM-yyyy"
            className="react-datepicker-wrapper__picker-input"
            excludeDates={exclutions}
            minDate={new Date()}
          />
        </div>
      </div>
    </>
  );
};
export default Calendar;
