import { useEffect, useState } from "react";
import { Tab, Tabs } from "react-bootstrap";
import { useParams } from "react-router-dom";
import ImageGallery from 'react-image-gallery';
import "react-image-gallery/styles/css/image-gallery.css";
import Universidades from "../Universidades/universidades";
import CityArticles from "./CityArticles/cityArticles";
import cityServices from "../../services/city.service";
import articleServices from "../../services/article.service";
import universityServices from "../../services/university.service";
import cityGalleryServices from "../../services/cityGallery.service";
import "./ciudad.css";
import "../Ciudades/ciudades.css";

const Paragraph = ({text}) => {

  const paragraphs = text.split('\n');

  return (
    <>
      <section className="citySection">
        {paragraphs.map((paragraph, id) => <p style={{fontSize:"18px", fontFamily:"Times New Roman"}} key={id}> {paragraph} </p>)}
      </section>
    </>
  );
}

const Informacion = () => {

  const params = useParams();
  const [ciudad, setCiudad] = useState([]);
  const [gallery, setGallery] = useState([]);

  useEffect(() => {
    cityServices.getCityByName(params.nombreCiudad).then(city => {
      setCiudad(city);
    })
  }, [params.nombreCiudad]);

  useEffect(() => {
    cityGalleryServices.getCityImagesByCityName(params.nombreCiudad).then(gallery => {
      setGallery(gallery);
    })
  }, [params.nombreCiudad]);

  const setImages = (ciudad, gallery) => {
    let images = [];
    ciudad.forEach( ({urlCabecera}) => {images.push({original: urlCabecera, thumbnail: urlCabecera})});
    gallery.forEach( ({urlImagen}) => {images.push({original: urlImagen, thumbnail: urlImagen})});
    return images;
  }

  return (
    <>
      <article className="cityInformation">
        <h1
          style={{
            marginTop:"1.5em",
            marginBottom:"1em",
            textAlign:"center",
            fontWeight:"bold",
            fontFamily:"Times New Roman"}}>
              ??Te damos la bienvenida a {params.nombreCiudad}!
        </h1>
        <ImageGallery items={setImages(ciudad, gallery)} showPlayButton={false} showBullets={true} autoPlay={true} />
        <div style={{marginTop:"3em"}}></div>
        {ciudad.map(({informacion}, id) => <Paragraph key={id} text={informacion} />)}
      </article>
    </>);
}

function Ciudad() {
  const params = useParams();
  const [numArticles, setNumArticles] = useState([]);
  const [numUniversities, setNumUniversities] = useState([]);

  useEffect(() => {
    articleServices.getCityArticlesLength(params.nombreCiudad).then(length => {
      setNumArticles(length);
    })
  }, [params.nombreCiudad]);

  useEffect(() => {
    universityServices.getUniversitiesCityLength(params.nombreCiudad).then(length => {
      setNumUniversities(length);
    })
  }, [params.nombreCiudad]);

  let articles, universities;
  numArticles.forEach( ({length}) => {articles |= length === 0});
  numUniversities.forEach( ({length}) => {universities |= length === 0});
  return (
  <section>
    <Tabs
      defaultActiveKey="informacion"
      id="informacion-universidades-articulos"
      className="mb-3"
      fill
    >
      <Tab eventKey="informacion" title="Informaci??n">
        <Informacion />
      </Tab>
      <Tab eventKey="universidades" title="Universidades" disabled={universities === 1}>
        <Universidades />
      </Tab>
      <Tab eventKey="articulos" title="Art??culos" disabled={articles === 1}>
        <CityArticles />
      </Tab>
    </Tabs>
  </section>
  )
}

export default Ciudad;