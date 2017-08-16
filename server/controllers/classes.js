const Classes = require('../db/models/Classes');

async function fetchAll(req, res, next) {

    try {
        const classes = await Classes
            .query()
            .eager('[powers.[combos.^]]')
            .modifyEager('powers', (qb) => {
                qb.where('is_combo_child', false);
            });


        if (results.length > 0) {
            // const classes = Object.assign({}, { results });
            res.status(200).json({ classes });
        } else {
            res.sendStatus(404);
        }  
    }
    catch(e) {
        next(e);
    }
}

async function fetchOne(req, res, next) {

    try {
        const result = await Classes
            .query()
            .eager('[powers.[combos.^]]')
            .modifyEager('powers', qb => {
                qb.where('is_combo_child', false);
            })
            .where('slug', req.params.slug)
            .first();

        if (result) {
            res.status(200).json({ result });
        } else {
            res.sendStatus(404);
        }    
    }
    catch(e) {
        next(e);
    }

}

async function fetchClassInfo(req, res, next) {
    try {
        let classes = await Classes
            .query()
            .select('slug')
            .orderBy('id');

        if (classes) {
            classes = classes.map(c => c.slug);
            res.status(200).json({ classes })
        }    
    }
    catch(e) {
        next(e)
    }
}

module.exports = {
    fetchOne,
    fetchAll,
    fetchClassInfo
};