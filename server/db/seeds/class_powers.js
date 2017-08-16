const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const data = await request('https://api.malekai.network/powers/', { json: true });
        const powers = await knex.select('id', 'slug').from('powers');
        const classes = await knex.select('id', 'slug').from('classes');

        let query = [];

        data.body.forEach(p => {
            //if the previous chain length is 0, it's a primary ability and we want to grab it.
            if (p.sources[0].type === 'class') {
                const power_record = powers.find(el => el.slug === p.id);
                const class_record = classes.find(el => el.slug === p.sources[0].id);

                if (class_record.id && power_record.id) {
                    query.push({
                        class_id: class_record.id,
                        power_id: power_record.id
                    });
                }
            }
        });

        const results = await knex.insert(query).into('class_powers').returning(['class_id', 'power_id']);

        if (results.length > 0) {
            results.forEach(r => console.log(`class_id: ${r.class_id} power_id: ${r.power_id}`));
            console.log(`total records inserted: ${results.length}`);
        }

        // console.log(query);
        process.exit(0);
    }
    catch (e) {
        console.log(e);
        process.exit(1);
    }
})();