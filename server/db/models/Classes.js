const Model = require('./Base');

class Classes extends Model {

    $beforeInsert() {
        super.$beforeInsert();
    }

    $beforeUpdate() {
        super.$beforeUpdate();
    }

    static get tableName() {
        return 'classes';
    }

    static get jsonSchema() {
        return {
            type: 'object',
            required: ['name', 'icon'],

            properties: {
                id: { type: 'integer' },
                data_type: { type: 'string' },
                slug: { type: 'string' },
                name: { type: 'string' },
                description: { type: 'string' },
                lore: { type: 'string' },
                icon: { type: 'string' },
                icon_svg: { type: 'string' },
                class: { type: 'string' },
                created_at: { type: 'string' },
                updated_at: { type: 'string' },                
            }
        }
    }

    static get relationMappings() {
        return {
            powers: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + '/Powers',
                join: {
                    from: 'classes.id',
                    through: {
                        from: 'class_powers.class_id',
                        to: 'class_powers.power_id'
                    },
                    to: 'powers.id'
                }
            },
            disciplines: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + '/Disciplines',
                join: {
                    from: 'classes.id',
                    through: {
                        from: 'discipline_classes.class_id',
                        to: 'discipline_classes.discipline_id'
                    },
                    to: 'disciplines.id'
                }
            },
            races: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + '/Races',
                join: {
                    from: 'classes.id',
                    through: {
                        from: 'class_races.class_id',
                        to: 'class_races.race_id'
                    },
                    to: 'races.id'
                }
            },
            // tags: {
            //     relation: Model.ManyToManyRelation,
            //     modelClass: __dirname + '/Tags',
            //     join: {
            //         from: 'classes.id',
            //         through: {
            //             from: 'class_tags.class_id',
            //             to: 'class_tags.tag_id'
            //         },
            //         to: 'tags.id'
            //     }
            // }
        }
    }
}

module.exports = Classes;