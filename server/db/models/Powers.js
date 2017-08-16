const Model = require('./Base');

class Powers extends Model {

    $beforeInsert() {
        //call the parent constructor of base
        super.$beforeInsert();
    }

    $beforeUpdate() {
        //call the parent constructor of base
        super.$beforeUpdate();
    }

    static get tableName() {
        return 'powers';
    }

    static get jsonSchema() {
        return {
            type: 'object',
            required: ['name', 'description', 'icon'],

            properties: {
                id: { type: 'integer' },
                name: { type: 'string' },
                description: { type: 'text' },
                slug: { type: 'string' },
                icon: { type: 'string' },
                icon_svg: { type: 'string' },
                type: { type: 'string' },
                cast_type: { type: 'string' },
                resource_cost: { type: 'integer' },
                resource_type: { type: 'string' },
                duration: { type: 'integer' },
                cooldown: { type: 'integer' },
                targeting: { type: 'string' },
                max_targets: { type: 'integer' },
                range: { type: 'integer' },
                min_damage: { type: 'integer' },
                max_damage: { type: 'integer' }
            }
        };
    }

    static get relationMappings() {
        return {
            combos: {
                relation: Model.ManyToManyRelation,
                modelClass: __filename,
                join: {
                    from: 'powers.id',
                    through: {
                        from: 'combos.parent_power_id',
                        to: 'combos.child_power_id'
                    },
                    to: 'powers.id'
                }
            },
            class: {
                relation: Model.HasOneThroughRelation,
                modelClass: __dirname + '/Classes',
                join: {
                    from: 'powers.id',
                    through: {
                        from: 'class_powers.power_id',
                        to: 'class_powers.class_id'
                    },
                    to: 'classes.id'
                }
            },
            discipline: {
                relation: Model.ManyToManyRelation,
                modelClass: __dirname + '/Disciplines',
                join: {
                    from: 'powers.id',
                    through: {
                        from: 'discipline_powers.power_id',
                        to: 'discipline_powers.discipline_id'
                    },
                    to: 'disciplines.id'
                }
            },
            // tags: {
            //     relation: Model.ManyToManyRelation,
            //     modelClass: __dirname + '/Tags',
            //     join: {
            //         from: 'powers.id',
            //         through: {
            //             from: 'power_tags.power_id',
            //             to: 'power_tags.tag_id'
            //         },
            //         to: 'tags.id'
            //     }
            // }
        };
    }
}

module.exports = Powers;