import React from 'react'
import './Footer.scss'
import { BsFacebook, BsTwitter, BsInstagram } from 'react-icons/bs'
import { FaLinkedinIn } from 'react-icons/fa'

function Footer() {
  return (
    <footer>
      <div data-testid='footer' className="footer-container">
        <div className='footer-copyrights'>
          <p>©2022 Digital Booking</p>
        </div>

        <div className='footer-social-media'>
          <BsFacebook />
          <FaLinkedinIn />
          <BsTwitter />
          <BsInstagram />
        </div>
      </div>
    </footer>
  )
}

export default Footer