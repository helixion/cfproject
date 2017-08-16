const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const data = await request('https://api.malekai.network/races', { json: true });
        const classes = await knex.select('id', 'slug').from('classes');
        const races = await knex.select('id', 'slug').from('races');

        let query = [];

        data.body.forEach(r => {
            const race = races.find(race => race.slug === r.id);
            for (let i = 0; i < r.classes.length; i++) {
                const c = classes.find(el => el.slug === r.classes[i]);

                if (race.id && c.id) {
                    query.push({
                        race_id: race.id,
                        class_id: c.id
                    });
                }
            }         
        });

        console.log(query);
        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();