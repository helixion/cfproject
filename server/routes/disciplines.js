// const express = require('express');
// const router = express.Router();
const controller = require('../controllers');

module.exports = function(express) {

    const router = express.Router();
    
    router.route('/')
        .get(controller.disciplines.fetchAll);

    router.route('/types')
        .get(controller.disciplines.fetchTypes);      

    router.route('/:slug')
        .get(controller.disciplines.fetchOne);    

    return router;
}