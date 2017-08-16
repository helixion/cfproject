const controller = require('../controllers');

module.exports = function(express) {

    const router = express.Router();
    
    router.route('/')
        .get(controller.classes.fetchAll);

    router.route('/names')
        .get(controller.classes.fetchClassInfo);    

    router.route('/:slug')
        .get(controller.classes.fetchOne);    

    return router;
}