import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import MyImage from "../../assets/mundobyn.png";
import Button from 'react-bootstrap/Button';
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import {BiUser, BiUserPlus, BiUserCheck} from "react-icons/bi";
import './navbar.css';
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Tooltip from 'react-bootstrap/Tooltip';

function Navegador() {
  let navigate = useNavigate();
  const routeChange = (dest) => {
    //let path = `login`;
    navigate(dest);
  }

  return (
    <Navbar bg="light" expand="lg" sticky="top">
      <Container >
        <Link to="" className='navbar-brand'>G<img src={MyImage} width={17} height={20} style={{ paddingBottom: 3 }} alt="mundoLogo" />Erasmus</Link>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            {/*<Link to="ciudades" className="nav-link">Ciudades</Link>
            <Link to="articulos" className="nav-link">Articulos</Link>*/}
            <Link to="search" className='nav-link'>Buscar</Link>
            <Link to="asignatura" className='nav-link'>Asignatura</Link>
          </Nav>

          <OverlayTrigger
            key={'Inicio Sesion'}
            placement={'bottom'}
            overlay={
              <Tooltip id={`tooltip-${'bottom'}`}>
                Iniciar sesión
              </Tooltip>
            }
          >
            <Button variant="outline-dark" onClick={() => routeChange("login")} className="rounded-circle custom-button"><BiUserPlus /></Button>
          </OverlayTrigger>
          <OverlayTrigger
            key={'Perfil'}
            placement={'bottom'}
            overlay={
              <Tooltip id={`tooltip-${'bottom'}`}>
                Ver un perfil
              </Tooltip>
            }
          >
            <Button variant="outline-dark" onClick={() => routeChange("perfil/1")} className="rounded-circle custom-button"><BiUserCheck /></Button>
          </OverlayTrigger>

          <OverlayTrigger
            key={'editPerfil'}
            placement={'bottom'}
            overlay={
              <Tooltip id={`tooltip-${'bottom'}`}>
                Acceder a mi perfil
              </Tooltip>
            }
          >
            <Button variant="outline-dark" onClick={() => routeChange("editPerfil")} className="rounded-circle custom-button"><BiUser /></Button>
          </OverlayTrigger>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default Navegador;