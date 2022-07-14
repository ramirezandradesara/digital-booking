import React, { useEffect, useState, createContext } from "react";
import Api from "../../Helpers/Api";

export const DataContext = createContext();

export const DataProvider = ({ children }) => {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [cities, setCities] = useState([]);
  const [dataReady, setDataReady] = useState(false);
  const [filter, setFilter] = useState(Api + "productos");
  const [gallery, setGallery] = useState([]);
  const [booking, setBooking] = useState([]);

  const [dateRange, setDateRange] = useState([null, null]);
  const [startDate, endDate] = dateRange;
  const [startDates, setStartDates] = useState([]);
  const [endDates, setEndDates] = useState([]);

  const getDataProducts = async () => {
    try {
      const response = await fetch(filter);
      const data = await response.json();

      setProducts(data);
    } catch (error) {
      console.log(error);
    }
  };

  const getData = async () => {
    try {
      const response = await fetch(Api + "productos");
      const data = await response.json();
      setDataReady(true);
      // setCategories(data.map((p) => p.categoria));
      // setCities(data.map((p) => p.ubicacion));
      setGallery(data.map((p) => p.imagenes));
    } catch (error) {
      console.log(error);
    }
  };

  const getCategories = async () => {
    try {
      const response = await fetch(Api + "categorias");
      const data = await response.json();
      setDataReady(true);
      setCategories(data);
    } catch (error) {
      console.log(error);
    }
  };

  const getCities = async () => {
    try {
      const response = await fetch(Api + "ubicaciones");
      const data = await response.json();
      setDataReady(true);
      setCities(data);
    } catch (error) {
      console.log(error);
    }
  };

  const getAllBooking = async () => {
    try {
      const response = await fetch(Api + "reservas");
      const data = await response.json();
      setBooking(data);
      setStartDates(data.map((p) => p.fechaInicio));
      setEndDates(data.map((p) => p.fechaFinal));
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    getData();
    getCities();
    getCategories();
    getDataProducts();
    getAllBooking();
  }, [filter, setProducts]);

  return (
    <DataContext.Provider
      value={{
        products,
        setProducts,
        categories,
        setCategories,
        cities,
        setCities,
        dataReady,
        setDataReady,
        gallery,
        setGallery,
        dateRange,
        setDateRange,
        startDate,
        endDate,
        booking,
        setBooking,
        startDates,
        setStartDates,
        endDates,
        setEndDates,

        filter,
        setFilter,
      }}
    >
      {children}
    </DataContext.Provider>
  );
};
