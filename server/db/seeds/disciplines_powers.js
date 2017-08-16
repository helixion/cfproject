const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const data = await request('https://api.malekai.network/powers');
        const d = await knex.select('id', 'slug').from('disciplines');
        const p = await knex.select('id', 'slug').from('powers');
        const powers = JSON.parse(data.body);

        var query = [];

        powers.forEach(power => {

            if (!/\d/.test(power.name)) {
                let pwr = p.find(el => el.slug === power.id);
                let discipline = 0;

                if (power.sources[0].type === 'discipline') {
                    discipline = d.find(el => el.slug === power.sources[0].id);
                }

                if (pwr.id && discipline.id) {
                    query.push({
                        discipline_id: discipline.id,
                        power_id: pwr.id
                    });
                }
            } 
        });

        const results = await knex.insert(query).into('discipline_powers').returning(['discipline_id', 'power_id']);

        if (results.length > 0) {
            results.forEach(r => console.log(`discipline_id: ${r.discipline_id} power_id: ${r.power_id}`));
        }

        process.exit(0);
    }
    catch (e) {
        console.log(e);
        process.exit(1);
    }
})();