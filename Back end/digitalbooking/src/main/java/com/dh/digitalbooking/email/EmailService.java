package com.dh.digitalbooking.email;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.logging.Logger;

@Service
@Log4j
public class EmailService {
    @Autowired
    JavaMailSender mailSender;

    @Async
    public void enviar(String to, String email) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
            helper.setText(email, true);
            helper.setTo(to);
            helper.setSubject("confirmacion de email");
            helper.setFrom("digitalzooking@gmail.com");
            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            log.error("fallo al enviar el email : " + e);
            throw new IllegalStateException("fallo al enviar el email");
        }
    }

    //construir el mail:
    public String armarEmail(String nombre, String link) {
        return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
                "<head>\n" +
                "    <meta http-equiv= \"content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>email</title>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <style type=\"text/css\">\n" +
                "     \n" +
                "    \n" +
                "    body{\n" +
                "      margin: 0;\n" +
                "    }\n" +
                "    table{\n" +
                "       border-spacing: 0;\n" +
                "    }\n" +
                "    td {\n" +
                "        padding: 0;\n" +
                "    }\n" +
                "    img {\n" +
                "        border: 0\n" +
                "    }\n" +
                "\n" +
                "  \n" +
                "    \n" +
                "</style>\n" +
                "    <center style=\" width: 100%;\n" +
                "    table-layout: fixed;\n" +
                "    background-color: #cccccc;\n" +
                "    padding-bottom: 60px;\">\n" +
                "        <table style=\" width: 100%;\n" +
                "        max-width: 600px;\n" +
                "        background-color:  #eaf6fb;\n" +
                "        color:#545776 ;\n" +
                "        box-shadow: 0 0 25px rgba(0, 0, 0, .15);\">\n" +
                "              <tr>\n" +
                "                <td height=\"8\" style=\"background-color: #1dbeb4 ;\">\n" +
                "                   \n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              <tr>\n" +
                "                <td style=\"padding:20px 0 4px\">\n" +
                "                    <table width=\"100%\">\n" +
                "                        <tr>\n" +
                "                            <td style=\"font-size: 0;\n" +
                "                            text-align: center;\" >\n" +
                "                                   <table style=\"   width: 100%;\n" +
                "                                   max-width: 300px;\n" +
                "                                   display:inline-block;\n" +
                "                                   vertical-align: top;\">\n" +
                "                                    <tr>\n" +
                "                                        <td style=\"padding: 0 13px 10px;\">\n" +
                "                                            <a href=\"http://digitalzooking.sytes.net/\"><img src=\"https://i.ibb.co/dmZ1Yrg/digitalboking.pngY\" alt=\"logo\" title=\"digitalboking\" width=\"65\"><p style=\" font-size:17px;\n" +
                "                                                display: inline-block;\n" +
                "                                                vertical-align: top;\n" +
                "                                                padding-left: 5px;\n" +
                "                                                font-family: Roboto,sans-serif;\n" +
                "                                                font-style: italic;\n" +
                "                                                color: #545776;\">Sentite como en tu hogar</p></a>\n" +
                "                                        </td>\n" +
                "                                    </tr>\n" +
                "                                   </table>\n" +
                "                                   <table style=\"   width: 100%;\n" +
                "                                   max-width: 300px;\n" +
                "                                   display:inline-block;\n" +
                "                                   vertical-align: top;\">\n" +
                "                                     <tr>\n" +
                "                                        <td  style=\"padding: 12px 0 21px 98px;\">\n" +
                "                                            <a href=\"https://www.facebook.com/DigitalHouseColombia/?brand_redir=865681700186683\">\n" +
                "                                                <img src=\"http://talk.onevietnam.org/wp-content/uploads/2011/04/facebook_icon.png\"  alt=\"facebook_logo\" width=\"30\" >\n" +
                "                                            </a>\n" +
                "                                            <a href=\"https://www.instagram.com/_digitalhouse/\">\n" +
                "                                                <img src=\"https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png\"  alt=\"instagram_logo\" width=\"30\">\n" +
                "                                            </a>\n" +
                "                                            <a href=\"https://twitter.com/_digitalhouse\">\n" +
                "                                                <img src=\"https://logodownload.org/wp-content/uploads/2014/09/twitter-logo-1.png\" alt=\"twitter_logo\" width=\"30\">\n" +
                "                                            </a>\n" +
                "                                            <a href=\"https://www.linkedin.com/school/digitalhouseschool/\">\n" +
                "                                                <img src=\"https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png\" alt=\"facebook_logo\" width=\"30\">\n" +
                "                                            </a>\n" +
                "                                        </td>\n" +
                "                                     </tr>\n" +
                "                                   </table> \n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                    </table>\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              <tr>\n" +
                "                <td height=\"2\" style=\"background-color: #1dbeb4 ;\">\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              <tr >\n" +
                "                <td style=\"text-align: center;\">\n" +
                "                     <img src=\"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+complementos/imagen-mail.png\" alt=\"logo_telefono\" width=\"400\" style=\"max-width: 100%;\">\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              \n" +
                "              <tr>\n" +
                "                <td style=\"text-align: center;\">\n" +
                "                    <span style=\"font-size: 30px; font-family: Roboto,sans-serif;\"> Confirmación de correo:</span>\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              \n" +
                "              <tr>\n" +
                "                <td style=\"text-align:center ;\">\n" +
                "                       <p style=\"font-size: 20px; ;\"> ¡Hola  " +nombre+ "!"+"</p>\n" +
                "                       <p style= \"font-size: 20px; \">Gracias por registrarte. Por favor haz click en el siguiente link para activar tu cuenta:</p>\n" +
                "                       <br>\n" +
                "                       <blockquote style=\"margin: 0 0 20px 9; border-left:10px solid #545776; padding:  15px 0 0 1px; font-size: 19px;line-height: 25px; background-color:#f7f6f6 ;\">\n" +
                "                        <p style=\" margin: 0 0 45px 0 ; font-size:19px; line: height 25px; color:#1dbeb4 ; padding-bottom:15px;\">\n" +
                "                            <a href="+link+" style=\"color: #1dbeb4;\"> Activar ahora </a>\n" +
                "                        </p>\n" +
                "                       </blockquote>\n" +
                "                       <p style=\"font-size: 20px;\"> El link expirará  en 30 minutos.</p>\n" +
                "                       <p style=\"font-size: 20px\"> Esperamos verte pronto \uD83D\uDE09</p>\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              <tr>\n" +
                "                <td style=\"background-color: #545776; color:#ffffff\">\n" +
                "                    <table width=\"100%\">\n" +
                "                        <tr>\n" +
                "                            <td >\n" +
                "                                <p style=\"text-align: center;\">©2022 Digital Booking</p>\n" +
                "                            </td>\n" +
                "                        </tr>\n" +
                "                    </table>\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "              <tr>\n" +
                "                <td height=\"8\" style=\"background-color: #1dbeb4 ;\">\n" +
                "                </td>\n" +
                "              </tr>\n" +
                "        </table>\n" +
                "    </center>\n" +
                "    \n" +
                "</body>\n" +
                "</html>" ;
    }
}
