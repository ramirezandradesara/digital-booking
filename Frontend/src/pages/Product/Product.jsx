import React, { useState, useEffect } from "react";
import Api from "../../Helpers/Api";
import "swiper/css";
import "swiper/css/autoplay";
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay } from "swiper";
import {
  IoIosArrowBack,
  IoIosArrowDropleftCircle,
  IoIosArrowDroprightCircle,
} from "react-icons/io";
import { MdLocationOn } from "react-icons/md";
import { Link, useParams, useLocation } from "react-router-dom";
import Modal from "../../funcionesJS/Modal";
import PickerP from "./PickerP";
import axios from "axios";
import { BsShare } from "react-icons/bs";
import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet'

import {
  FacebookShareButton,
  TelegramShareButton,
  TwitterShareButton,
  WhatsappShareButton,
} from "react-share";

import {
  FacebookIcon,
  TelegramIcon,
  TwitterIcon,
  WhatsappIcon,

} from "react-share";

/* STYLES */
import "./Product.scss";
import "./Product.css";

function Product() {
  const { id } = useParams();
  const [producto, setProducto] = useState({});
  const coords = [producto?.latitud, producto?.longitud]
  const pageURL = window.location.href

  const [Gallery, setGallery] = useState([]);
  const [mainImg, setMainImg] = useState(null);
  const [mainImgM, setMainImgM] = useState(null);
  const gallery = [];

  const GalleryR = Gallery.slice(1, 5);

  /* MODAL SWITCH */
  const [modalActive, setModalActive] = useState(false);
  const toggleModal = () => {
    setModalActive(!modalActive);
  };


  /* MODAL SM */
  const [modalSM, setModalSM] = useState(false);
  const toggleModalSM = () => {
    setModalSM(!modalSM);
  }

  async function getProducto() {
    try {
      const result = await axios.get(Api + `productos/${id}`);
      setProducto(result.data);
      setGallery(result.data.imagenes);
      setMainImg(result.data.imagenes[0].urlImg);
      setMainImgM(result.data.imagenes[0].urlImg);
    } catch (error) {
      console.log(error);
    }
  }

  for (let i in Gallery) {
    gallery.push(Gallery[i].urlImg);
  }

  const len = Gallery.length;

  /* MODAL BUTTONS */

  const nextImg = () => {
    let index = gallery.indexOf(mainImgM);
    console.log(index);
    if (index === len - 1) {
      setMainImgM(gallery[0]);
    } else {
      setMainImgM(gallery[index + 1]);
    }
  };
  const prevImg = () => {
    let index = gallery.indexOf(mainImgM);
    if (index === 0) {
      setMainImgM(gallery[Gallery.length - 1]);
    } else {
      setMainImgM(gallery[index - 1]);
    }
  };

  useEffect(() => {
    getProducto();
  }, []);

  return (
    <>
      <div className="header-product">
        <div>
          <h4>{producto.categoria?.titulo.toUpperCase()}</h4>
          <h1>{producto.nombre}</h1>
        </div>
        <Link to="/">
          <IoIosArrowBack />
        </Link>
      </div>


      <div className="location-product">
        <div className="location-content">
          <div>
            <MdLocationOn />
          </div>
          <div>
            <h4>
              {producto.ubicacion?.ciudad}, {producto.ubicacion?.pais}
            </h4>
            {/* <h4 className="distance-text">A 940 m del centro </h4> */}
          </div>
        </div>
        <div className="score"></div>
      </div>

      <div className="share-social-media">
        <BsShare onClick={toggleModalSM} />
      </div>

      {modalSM &&
        <div className="modal-background-sm">
          <div className="modal-container-sm">
            <div className="modal-header">
              <h1>¡Compartí en tus redes sociales!</h1>
              <button onClick={toggleModalSM}> X </button>
            </div>
            <div className="body-modal">
              <FacebookShareButton
                url={pageURL}
                quote="Compartí en Facebook"
              >
                <FacebookIcon
                  size={45}
                  round />
              </FacebookShareButton>
              <WhatsappShareButton
                url={pageURL}
              >
                <WhatsappIcon
                  size={45}
                  round />
              </WhatsappShareButton>
              <TwitterShareButton
                url={pageURL}
              >
                <TwitterIcon
                  size={45}
                  round />
              </TwitterShareButton>
              <TelegramShareButton
                url={pageURL}
              >
                <TelegramIcon
                  size={45}
                  round />
              </TelegramShareButton>
            </div>
          </div>
        </div>}

      <div className="wrapper">
        <img src={mainImg} alt="" className="main-block" key={Gallery.id} />

        <div className="random">
          {GalleryR.map((img, index) => (
            <img key={index} src={img.urlImg} alt="" className="img-next" />
          ))}

          <button id="modal-gallery" className="" onClick={toggleModal}>
            ver más
          </button>
        </div>
      </div>

      {/* <div className="wrapper-alt">
        <div className="random-animation">
          {GalleryR.map((img, index) => (
            <img key={index} src={img.urlImg} alt="" className="img-next" />
          ))}
        </div>
      </div> */}
      <div className="swiper-container">
        <Swiper
          modules={[Autoplay]}
          spaceBetween={0}
          centeredSlides={true}
          autoplay={{
            delay: 3000,
            disableOnInteraction: false,
          }}
          loop={true}
          className="mySwiper"
        >
          {gallery.map((img, index) => (
            <SwiperSlide key={index}>
              <img src={img} alt="" className="img-swiper" />
              <div className="swiper-slide-text">
                <h2>
                  {index + 1} / {Gallery.length}
                </h2>
              </div>
            </SwiperSlide>
          ))}
        </Swiper>
      </div>

      <div className="description-product">
        <h1>{producto.titulo}</h1>
        <p>{producto.descripcion}</p>
      </div>

      <div className="characteristics-product">
        <div className="charactetistics-title">
          <h1>¿Qué ofrece este lugar?</h1>
          <hr />
        </div>
        <div className="characteristics-grid-container">
          {producto.caracteristicas?.map((caracteristica, index) => {
            return (
              <div index={index}>
                <img
                  src={caracteristica.icono}
                  alt={"icono-" + caracteristica.nombre}
                />
                {caracteristica.nombre.replace("-", " ")}
              </div>
            );
          })}
        </div>
      </div>
      <div className="characteristics-product wrapper-calendar">
        <div className="charactetistics-title wrapper-calendar-title">
          <h1>Fechas disponibles</h1>
          <br />
          <br />
        </div>
        <PickerP />
      </div>

      <div className="map-product">
        <div className="map-title">
          <h1>¿Dónde vas a estar? </h1>
          <hr />
          <div className="map-ubication-text">{producto.ubicacion?.ciudad}, {producto.ubicacion?.pais}</div>
          <div className="map-wrap" >
            {producto?.latitud && producto?.longitud &&
              <MapContainer
                style={{ height: '100%', width: '100%', }}
                center={coords}
                zoom={15}
                scrollWheelZoom={false}>
                <TileLayer
                  attribution='&copy;<ahref="http://osm.org/copyright">OpenStreetMap </a> contributors'
                  url='https://{s}.tile.openstreetmap.de/tiles/osmde/{z}/{x}/{y}.png'
                />
                <Marker position={coords}>
                  <Popup>
                    {producto?.direccion}
                  </Popup>
                </Marker>
              </MapContainer>
            }
          </div>
        </div>
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

      {/* MODAL */}
      <Modal modalActive={modalActive} toggle={toggleModal}>
        <div className="modal-container">
          <div className="g-container">
            <button
              id="modal-gallery"
              className="modal-gallery-x"
              onClick={toggleModal}
            >
              X
            </button>
            <img src={mainImgM} alt="" className="main-img" />

            <span className="arrows">
              <IoIosArrowDropleftCircle className="left-aw" onClick={prevImg} />
              <IoIosArrowDroprightCircle
                className="right-aw"
                onClick={nextImg}
              />
            </span>
            <div className="counter-gallery">
              <br />
              <span>{gallery.indexOf(mainImgM) + 1}</span>
              <span>/</span>
              <span>{Gallery.length}</span>
            </div>

            <div className="carousel">
              {gallery.map((img, index) => (
                <img
                  style={{ cursor: "pointer" }}
                  key={index}
                  src={img}
                  alt=""
                  className="img-next"
                  onClick={() => setMainImgM(img)}
                />
              ))}
            </div>
          </div>
        </div>
      </Modal>
    </>
  );
}

export default Product;
