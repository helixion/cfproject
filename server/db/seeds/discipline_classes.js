const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const data = await request('https://api.malekai.network/disciplines', { json: true });
        const disciplines = await knex.select('id', 'slug').from('disciplines');
        const classes = await knex.select('id', 'slug').from('classes');

        let query = [];

        data.body.forEach(disc => {
            const d = disciplines.find(el => el.slug === disc.id);
            
            for (let i = 0; i < disc.classes.length; i++) {
                const c = classes.find(el => el.slug === disc.classes[i]);

                if (d.id && c.id) {
                    query.push({
                        discipline_id: d.id,
                        class_id: c.id
                    });
                }
            }
        });

        // console.log(query);
        const results = await knex.insert(query).into('discipline_classes').returning(['discipline_id', 'class_id']);

        if (results.length > 0) {
            results.forEach(r => console.log(`discipline_id: ${r.discipline_id} class_id: ${r.class_id}`));
        }

        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();