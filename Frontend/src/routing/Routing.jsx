import React from 'react'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import Home from '../pages/Home/Home'
import Login from '../pages/Login/Login'
import SignUp from '../pages/SignUp/SignUp'
import UserHome from '../pages/Home/UserHome'
import Layout from '../components/Layout/index'
import Product from '../pages/Product/Product'
import Booking from '../pages/Booking/Booking'
import AdminProduct from '../pages/AdminProduct/AdminProduct'
import Reservations from 'src/pages/Reservations/Reservations'
import NotFound from 'src/pages/NotFound/NotFound'

function Routing() {
    return (
        <>
            <Router>
                <Layout>
                    <Routes>
                        <Route path="/" exact element={<Home />} />
                        <Route path="/login" element={<Login />} />
                        <Route path="/signup" element={<SignUp />} />
                        <Route path="/productos/:id" element={<Product />} />
                        <Route path="/productos/:id/reserva" element={<Booking />} />
                        <Route path="/admin" element={<AdminProduct />} />
                        <Route path="/reservations" element={<Reservations />} />
                        <Route path="*" element={<NotFound />} />
                    </Routes>
                </Layout >
            </Router>
        </>
    )
}

export default Routing