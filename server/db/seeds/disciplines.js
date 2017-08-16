const knex = require('../setup');
const request = require('got');

const img_path = '/public/assets/images/disciplines/';
const svg_path = '/public/assets/svg/disciplines/';

(async function() {
    try {
        const data = await request('https://api.malekai.network/disciplines');
        const discs = JSON.parse(data.body);

        const query = discs.map(disc => {

            const extra = {};

            for (let key in disc) {
                if (key === 'stats_granted' || key === 'stats_value' || 
                key === 'equips_granted' || key === 'slots_granted' || 
                key === 'slots_removed' || key === 'trays_granted' ||
                key === 'trays_removed') {
                    Object.assign(extra, { [key]: disc[key] });
                }
            }
            
            const now = new Date();

            return {
                data_type: disc.data_type,
                slug: disc.id,
                name: disc.name,
                description: disc.description,
                discipline_type: disc.type,
                icon: img_path + disc.id,
                icon_svg: svg_path + disc.id,
                extra: JSON.stringify(extra),
                created_at: now.toISOString(),
                updated_at: now.toISOString(),                
            };
        });

        // console.log(query);

        const results = await knex.insert(query).into('disciplines').returning('id');

        if (results.length > 0) {
            results.forEach(r => console.log(`${r} has been entered into the database`));
        }

        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();