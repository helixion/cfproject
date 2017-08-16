const knex = require('../setup');
const request = require('got');

const img_path = '/public/assets/images/classes/';
const svg_path = '/public/assets/svg/classes/';

const classTypes = [
    { class: 'myrmidon', type: 'Melee'},
    { class: 'knight', type: 'Melee'},
    { class: 'templar', type: 'Melee'},
    { class: 'champion', type: 'Melee'},
    { class: 'cleric', type: 'Melee'},
    { class: 'assassin', type: 'Melee'},    
    { class: 'ranger', type: 'Hybrid'},
    { class: 'duelist', type: 'Hybrid'},
    { class: 'confessor', type: 'Ranged'},
    { class: 'druid', type: 'Ranged'},
    { class: 'frostweaver', type: 'Ranged'},        
];

(async function() {
    try {
        const data = await request('https://api.malekai.network/classes');
        const classes = JSON.parse(data.body);

        const query = classes.map(c => {

            const classType = classTypes.find(el => el.class === c.id);

            const date = new Date();

            return {
                data_type: c.data_type,
                slug: c.id,
                name: c.name,
                description: c.description,
                class_type: classType.type,
                icon: img_path + c.id,
                icon_svg: svg_path + c.id,
                created_at: date.toISOString(),
                updated_at: date.toISOString()
            };
        });

        // console.log(query);

        const results = await knex.insert(query).into('classes').returning(['id', 'name']);

        if (results.length > 0) {
            results.forEach(r => console.log(`${r.name} has been entered into the database with an id of ${r.id}`));
        }

        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();