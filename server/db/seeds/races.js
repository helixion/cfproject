const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const races = await request('https://api.malekai.network/races', { json: true });

        const query = races.body.map(race => {

            let slug = race.id;

            delete race.id;
            delete race.icon;
            delete race.classes;
            delete race.tags;

            const now = new Date();

            return Object.assign(race, {
                slug,
                icon: '/assets/images/races/' + slug + '.png',
                icon_svg: '/assets/svgs/races/' + slug + '.svg',
                created_at: now.toISOString(),
                updated_at: now.toISOString(),
            });
        });

        const results = await knex.insert(query).into('races').returning(['id', 'name']);

        if (results.length > 0) {
            results.forEach(r => console.log(`Inserting ${r.name} with the id of ${r.id} into races`));
        }
        process.exit(0);

    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();