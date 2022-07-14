import React, { useEffect, useState, createContext } from "react";
import eachDayOfInterval from "date-fns/eachDayOfInterval";
import parseISO from "date-fns/parseISO";
import Api from "../../Helpers/Api";

export const DateContext = createContext();

export const DateProvider = ({ children }) => {
  const [idProduct, setIdProduct] = useState();
  const [product, setProduct] = useState({});
  const [booking, setBooking] = useState([]);
  const [startDates, setStartDates] = useState();
  const [endDates, setEndDates] = useState();
  const [excluded, setExcluded] = useState([]);

  const [dateRange, setDateRange] = useState([null, null]);
  const [startDate, setStartDate] = useState(dateRange[0]);
  const [endDate, setEndDate] = useState(dateRange[1]);

  const getProduct = async () => {
    try {
      const result = await fetch(Api + `productos/` + idProduct);
      const data = await result.json();
      setProduct(data);
      setStartDates([data.reservas.map((p) => p.fechaInicio)]);
      setEndDates([data.reservas.map((p) => p.fechaFinal)]);
      setBooking(data.reservas);
    } catch (error) {
      console.log(error);
    }
  };

  // const getBooking = async () => {
  //   try {
  //     const response = await fetch(Api + `reservas/producto/` + idProduct);
  //     const data = await response.json();
  //     setDateRange.startDate(data.map((p) => p.fechaInicio));
  //     setDateRange.endDate(data.map((p) => p.fechaFinal));

  //     setDateRange(data);
  //   } catch (error) {
  //     console.log(error);
  //   }
  // };

  useEffect(() => {
    getProduct();
    // getBooking();
  }, [idProduct]);

  return (
    <DateContext.Provider
      value={{
        idProduct,
        setIdProduct,
        product,
        setProduct,
        dateRange,
        setDateRange,
        startDate,
        setStartDate,
        endDate,
        setEndDate,
        booking,
        setBooking,
        startDates,
        setStartDates,
        endDates,
        setEndDates,
        excluded,
        setExcluded,
      }}
    >
      {children}
    </DateContext.Provider>
  );
};
