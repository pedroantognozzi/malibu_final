var express = require('express');
var router = express.Router();
var nodemailer = require('nodemailer');
var productosModel = require('../models/productosModel');
var cloudinary = require('cloudinary').v2;


/* GET home page. */
router.get('/', async function(req, res, next) {

  var productos = await productosModel.getProductos();

  productos = productos.splice(0, 5);
  productos = productos.map(producto => {
    if (producto.img_id) {
      const imagen = cloudinary.url(producto.img_id, {
        width: 460,
        crop: 'fill',
      });
      return {
        ...producto,
        imagen
      };
    } else {
      return {
        ...producto,
        imagen: '/img/novedades01.jpg'
      };
    }
  });

  res.render('index',{
    productos
  });
});

router.post('/', async (req, res, next) => {

  var nombre = req.body.nombre;
  var apellido = req.body.apellido;
  var email = req.body.email;
  var telefono = req.body.tel;
  var mensaje = req.body.mensaje;

  // console.log(req.body);

  var obj = {
    to: 'pedroantognozzi@gmail.com',
    subject: 'Contacto desde la web',
    html: nombre + " " + apellido + " se contacto a traves de la web de malibu y quiere mas info a este correo: " + email + " <br> Su teléfono es: " + telefono + " <br> Y dejo este mensaje: " + mensaje
  }

  var transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS
    }
  });

  var info = await transporter.sendMail(obj);

  res.render('index', { 
    message: 'Mensaje enviado correctamente',
  });

});



module.exports = router;
