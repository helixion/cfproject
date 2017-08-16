const knex = require('../setup');
const date = new Date();
const types = [
    { type_name: 'Major', created_at: date.toISOString(), updated_at: date.toISOString() },
    { type_name: 'Minor', created_at: date.toISOString(), updated_at: date.toISOString() },
    { type_name: 'Weapon', created_at: date.toISOString(), updated_at: date.toISOString() },
    { type_name: 'Racial', created_at: date.toISOString(), updated_at: date.toISOString() }
];

(async function() {
    try {
        
        const results = await knex.insert(types).into('discipline_types').returning(['id', 'type_name']);
        if (results.length > 0) {
            results.forEach(r => console.log(r));
        }
        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})()