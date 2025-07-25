var pool = require('./bd')

async function getProductos() {
    var query = 'select * from productos';
    var rows = await pool.query(query);
    return rows;
}

async function deleteProductoById(id) {
    var query = 'delete from productos where id = ?';
    var rows = await pool.query(query, [id]);
    return rows;
}

async function insertProducto(obj) {
    try {
        var query = 'insert into productos set ?';
        var rows = await pool.query(query, [obj]);
        return rows;    

    } catch (error) {
        console.log(error);
        throw error;
    }
}

async function getProductoById(id) {
    var query = 'select * from productos where id = ?'; 
    var rows = await pool.query(query, [id]);
    return rows[0];
}

async function modificarProductoById(obj, id) {
    try {
        var query = 'update productos set titulo = ?, subtitulo = ?, img_id = ? where id = ?';
        var rows = await pool.query(query, [obj.titulo, obj.subtitulo, obj.img_id, id]);
        return rows;    
    } catch (error) {
        throw error;
    }
}
    

module.exports = { getProductos, deleteProductoById, insertProducto, getProductoById, modificarProductoById }
