var express = require('express');
var router = express.Router();
var productosModel = require('../../models/productosModel');


router.get('/', async function(req, res, next) {

    var productos = await productosModel.getProductos();

    res.render('admin/productos', {
        layout: 'admin/layout',
        usuario: req.session.nombre,
        productos
    });
});

router.get('/eliminar/:id', async (req, res, next) => {
    var id = req.params.id;
    await productosModel.deleteProductoById(id);
    res.redirect('/admin/productos');
});


router.get('/agregar', (req, res, next) => {
    res.render('admin/agregar', {   
        layout: 'admin/layout'
    });
});

router.post('/agregar', async (req, res, next) => {
    try {
        if (req.body.titulo != "" && req.body.subtitulo != "") {
            await productosModel.insertProducto(req.body);
            res.redirect('/admin/productos');
        } else {
            res.render('admin/agregar', {
                layout: 'admin/layout',
                error: true,
                message: 'Todos los campos son obligatorios'
            });
        }
    } catch (error) {
        console.log(error);
        res.render('admin/agregar', {
            layout: 'admin/layout',
            error: true,
            message: 'No se pudo agregar el producto'
        });
    }
});

router.get('/modificar/:id', async (req, res, next) => {
    var id = req.params.id;
    var producto = await productosModel.getProductoById(id);
    res.render('admin/modificar', {
        layout: 'admin/layout',
        producto
    });
});

router.post('/modificar', async (req, res, next) => {
    try {
        console.log(req.body);
        
        var obj = {
            titulo: req.body.titulo,
            subtitulo: req.body.subtitulo,
        }

        // console.log(obj);
        await productosModel.modificarProductoById(obj, req.body.id);
        res.redirect('/admin/productos');
    } catch (error) {
        console.log(error);
        res.render('admin/modificar', {
            layout: 'admin/layout',
            error: true,
            message: 'No se pudo modificar el producto'
        });
    }
});


module.exports = router;