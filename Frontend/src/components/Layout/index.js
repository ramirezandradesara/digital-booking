import Footer from "../Footer/Footer";
import Header from "../Header/Header";


const Layout = ({children, auth}) => {
    return (
        <>
            <Header auth={auth}/>
            {children}
            <Footer />
        </>
    )
}

export default Layout;
