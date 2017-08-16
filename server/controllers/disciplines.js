'use strict';

const Disciplines = require('../db/models/Disciplines');
const {raw} = require('objection');
const knex = require('../db/setup');

async function fetchAll(req, res, next) {
    try {

        const limit = req.query.limit || 20;
        const offset = req.query.page ? (req.query.page - 1) * limit : 0;

        let query = Disciplines
            .query()
            .eager('[powers.[combos.^], classes]')
            .modifyEager('powers', qb => qb.where('is_combo_child', false))
            .modifyEager('classes', qb => qb.select('slug', 'icon_svg'))
            .orderBy('discipline_type')
            .offset(offset)
            .limit(limit);

        let countQuery = Disciplines.query();
            

        if (req.query.hasOwnProperty('classes') || req.query.hasOwnProperty('disciplines')) {
            query.innerJoin('discipline_classes', 'discipline_classes.discipline_id', 'disciplines.id');
            query.innerJoin('classes', 'classes.id', 'discipline_classes.class_id');
            query.groupBy('disciplines.id');

            countQuery = Disciplines
                .query()
                .innerJoin('discipline_classes', 'discipline_classes.discipline_id', 'disciplines.id')
                .innerJoin('classes', 'classes.id', 'discipline_classes.class_id')
          
            if (req.query.classes && Array.isArray(req.query.classes)) {
                if (req.query.classes.length > 0) {
                    const classes = req.query.classes
                    query.whereIn('classes.slug', classes);
                    countQuery.whereIn('classes.slug', classes);
                }
            }

            if (req.query.disciplines && Array.isArray(req.query.disciplines)) {
                if (req.query.disciplines.length > 0) {
                    const disciplines = req.query.disciplines;
                    query.whereIn('disciplines.discipline_type', disciplines);
                    countQuery.whereIn('disciplines.discipline_type', disciplines);
                }
            }

            
        }

        const results = await query;
        const {count} = await countQuery.countDistinct('disciplines.id').first();
        const total = Number(count);

        const meta = {
            total,
            totalPages: Math.ceil(total / limit),
            perPage: limit
        };

        const disciplines = Object.assign({}, { results, meta });          

        res.status(200).json({ disciplines });    
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
    fetchTypes
};