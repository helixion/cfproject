const Model = require('./Base');

class Disciplines extends Model {
    
    $beforeInsert() {
        super.$beforeInsert();
    }

    $beforeUpdate() {
        super.$beforeUpdate();
    }

    static get tableName() {
        return 'disciplines';
    }

    static get jsonSchema() {
        return {
            type: 'object',
            required: ['name', 'description', 'icon'],

            properties: {
                id: { type: 'integer' },
                data_type: { type: 'string' },
                name: { type: 'string' },
                slug: { type: 'string' },
                description: { type: 'string' },
                discipline_type: { type: 'string' },
                icon: { type: 'string' },
                icon_svg: { type: 'string' },
                extra: { type: 'json' },
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
                    from: 'disciplines.id',
                    through: {
                        from: 'discipline_powers.discipline_id',
                        to: 'discipline_powers.power_id'
                    },
                    to: 'powers.id'
                }
            },
            classes: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + '/Classes',
                join: {
                    from: 'disciplines.id',
                    through: {
                        from: 'discipline_classes.discipline_id',
                        to: 'discipline_classes.class_id'
                    },
                    to: 'classes.id'
                }
            },
            // tags: {
            //     relation: Model.ManyToManyRelation,
            //     modelClass: __dirname + '/Tags',
            //     join: {
            //         from: 'disciplines.id',
            //         through: {
            //             from: 'discipline_tags.discipline_id',
            //             to: 'discipline_tags.tag_id'
            //         },
            //         to: 'tags.id'
            //     }
            // }
        }
    }
}

module.exports = Disciplines;