const controller = require('../controllers');

module.exports = function(express) {

    const router = express.Router();
    
    router.route('/')
        .get(controller.powers.fetchAll);

    router.route('/:slug')
        .get(controller.powers.fetchOne);    

    return router;
}