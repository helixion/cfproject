'use strict';

const Disciplines = require('../db/models/Disciplines');
const {raw} = require('objection');
const knex = require('../db/setup');

async function fetchAll(req, res, next) {
    try {
        const limit = req.query.limit || 82;
        const offset = req.query.page ? (req.query.page - 1) * limit : 0;

        const numOfRecords = await Disciplines.query().count().first();
        const total = Number(numOfRecords.count);
        const totalPages = Math.ceil(total / limit);

        const meta = {
            total,
            totalPages,
            perPage: limit
        };

        const results = await Disciplines
            .query()
            .eager('[powers.[combos.^], classes]')
            .modifyEager('powers', (qb) => {
                qb.where('is_combo_child', false);
            })
            .limit(meta.perPage)
            .offset(offset)
            .orderBy('discipline_type');
        
        if (results.length > 0) {
            const disciplines = Object.assign({}, { results, meta });
            res.status(200).json({ disciplines });
        } else {
            res.sendStatus(404);
        }    
    }
    catch(e) {
        next(e);
    }
}

async function fetchAll(req, res, next) {
    try {

        if (req.query.hasOwnProperty('classes') || req.query.hasOwnProperty('disciplines')) {
            let query = Disciplines
            .query()
            .select(raw('DISTINCT ON (disciplines.id) disciplines.*'))
            .eager('[powers.[combos.^], classes]')
            .modifyEager('powers', qb => qb.where('is_combo_child', false))
            .modifyEager('classes', qb => qb.select('slug', 'icon_svg'))
            .innerJoin('discipline_classes', 'discipline_classes.discipline_id', 'disciplines.id')
            .innerJoin('classes', 'classes.id', 'discipline_classes.class_id')
            .groupBy('disciplines.id')
            .groupBy('disciplines.id')
            .orderBy('discipline_type');

            if (req.query.classes && Array.isArray(req.query.classes)) {
                if (req.query.classes.length > 0) {
                    const classes = req.query.classes
                    query.whereIn('classes.slug', classes);
                }
            }

            if (req.query.disciplines && Array.isArray(req.query.disciplines)) {
                if (req.query.disciplines.length > 0) {
                    const disciplines = req.query.disciplines;
                    query.whereIn('disciplines.discipline_type', disciplines);
                }
            }   

            const results = await query;

            const meta = {
                total: results.length,
                totalPages: Math.ceil(results.length / 10),
                perPage: 10
            };

            const disciplines = Object.assign({}, { results, meta });          

            res.status(200).json({ disciplines });    
        }
    }
    catch (e) {
        console.log(e);
        next(e);
    }
}

async function fetchOne(req, res, next) {
    try {
        const discipline = await Disciplines
            .query()
            .eager('[powers.[combos.^], classes]')
            .modifyEager('powers', (qb) => {
                qb.where('is_combo_child', false);
            })
            .where('slug', req.params.slug)
            .first();

        if (discipline) {
            res.status(200).json({discipline});
        }   
    }
    catch(e) {
        next(e);
    }
}

async function fetchTypes(req, res, next) {
    try {
        let types = await knex.select('type_name').from('discipline_types');
        if (types.length > 0) {
            types = types.map(type => type.type_name);
            res.status(200).json({ types });
        }
    }
    catch(e) {
        console.log(e);
        next(e);
    }
}

module.exports = {
    fetchAll,
    fetchOne,
    filteredResults,
    fetchTypes
};