import { Link } from "react-router-dom";
import { useState } from 'react';
import authServices from '../../services/auth.service';
import tokenServices from "../../services/token.service";
import { useNavigate } from "react-router-dom";
import { useEffect } from 'react';
import tokenService from '../../services/token.service'
import logotypeImage from '../../assets/mundobyn.png';
import './login.css';

const Login = () => {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  let nav = useNavigate();

  useEffect(() => {
    tokenService.getToken().then(data => {
        if(data && data.length > 0)
          nav("../", {replace: true})
    })
  }, [nav])

  const handleEmail = (e) => {
    setEmail(e.target.value);
  }

  const handlePassword = (e) => {
    setPassword(e.target.value);
  }

  const generateToken = (e) => {
    e.preventDefault();
    
    let formData = new FormData();
    formData.append("email", email);
    formData.append("password", password);
    
    authServices.signIn(formData).then(t => {
      tokenServices.setToken(t.token);
      window.location.reload(true);
    }).catch(e => {
      console.log(e);
    });
  }

  return (
    <>
      <div className="Auth-form-container">
        <form className="Auth-form">
          <div className="Auth-form-content">
            <h2 style={{cursor: "pointer"}} className="Auth-form-title" onClick={() => nav('/')}>
              G<img
                  src={logotypeImage}
                  width={27}
                  height={31}
                  style={{ paddingBottom: 4.5, paddingTop: 0 }}
                  alt="logo-goerasmus"/>Erasmus
            </h2>
            <div className="form-group mt-3">
              <label>Email</label>
              <input
                type="email"
                className="form-control mt-1"
                style={{fontSize: "14px"}}
                placeholder="johndoe@example.com"
                value={email}
                onChange={handleEmail}
                />
            </div>
            <div className="form-group mt-3">
              <label>Contrase??a</label>
              <input
                type="password"
                className="form-control mt-1"
                style={{fontSize: "14px"}}
                placeholder="Contrase??a"
                value={password}
                onChange={handlePassword}
                />
            </div>
            <div>
              <p style = {{fontSize: "14px", marginTop: "1.5em", marginBottom:"1em"}} className="mt-2">
                He olvidado mi <Link to="/recover" style={{textDecoration: "none"}}>contrase??a</Link>
              </p>
            </div>
            <div className="d-grid gap-2 mt-3">
              <button
                type="submit"
                className="btn btn-primary"
                onClick={generateToken}>
                  Iniciar sesi??n
              </button>
            </div>
            <div className="text-center">
              <p style = {{fontSize: "14px", marginTop: "1.5em", marginBottom:"1em"}}>
                ??No tienes una cuenta? Reg??strate {" "}
                <Link to="/signUp" style={{textDecoration: "none"}}>aqu??</Link>
              </p>
            </div>
          </div>
        </form>
      </div>
    </>
  );
}

export default Login;