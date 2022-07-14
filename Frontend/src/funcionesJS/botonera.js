export default function botonera(evento) {
    if (evento === true || evento === false) {
        return (evento ? "/signup" : "/login");
    } else {
        return ("/");
    }
}