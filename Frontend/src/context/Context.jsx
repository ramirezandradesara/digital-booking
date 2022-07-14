import React, { useEffect } from "react";
import { useJwt } from "react-jwt";

const Context = React.createContext();

function Provider(props) {
  
  const [user, setUser] = React.useState(null);
  const [warning, setWarning] = React.useState(false);
  const [auth, setAuth] = React.useState(
    localStorage.getItem("token") ? true : false
  );
  const [token, setToken] = React.useState(
    localStorage.getItem("token") ? localStorage.getItem("token") : null
  );

  const { decodedToken, isExpired } = useJwt(token);

  const [admin, setAdmin] = React.useState(decodedToken?.rol.id == 1 ? true : false);
  // const [admin, setAdmin] = React.useState(false);

  return (
    <Context.Provider
      value={{
        auth,
        setAuth,
        warning,
        setWarning,
        user,
        setUser,
        token,
        setToken,
        admin,
        setAdmin,
        decodedToken,
        isExpired,
      }}
    >
      {props.children}
    </Context.Provider>
  );
}

export { Context, Provider };
