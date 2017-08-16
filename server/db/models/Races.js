const Model = require('./Base');

class Races extends Model {

    $beforeInsert() {
        super.$beforeInsert();
    }

    $beforeUpdate() {
        super.$beforeUpdate();
    }

    static get tableName() {
        return 'races';
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
                created_at: { type: 'string' },
                updated_at: { type: 'string' }
            }
        }
    }

    static get relationMappings() {
        return {
            disciplines: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + './Disciplines',
                join: {
                    from: 'races.id',
                    through: {
                        from: 'race_disciplines.race_id',
                        to: 'race_disciplines.discipline_id'
                    },
                    to: 'disciplines.id'
                }
            },
            classes: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + './Classes',
                join: {
                    from: 'races.id',
                    through: {
                        from: 'class_races.class_id',
                        to: 'class_races.tag_id'
                    },
                    to: 'classes.id'
                }
            },
            tags: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + './Tags',
                join: {
                    from: 'races.id',
                    through: {
                        from: 'race_tags.race_id',
                        to: 'race_tags.tag_id'
                    },
                    to: 'tags.id'
                }
            }
        }
    }
}

module.exports = Races;