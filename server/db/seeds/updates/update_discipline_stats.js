const knex = require('../../setup');
const request = require('got');


(async function() {
    try {
        const disciplines = await request('https://api.malekai.network/disciplines', { json: true });

        disciplines.body.forEach(async function(disc) {
            const attributes = {};
            for (let key in disc) {
                if (key === 'stats' || key === 'equips' || key === 'tray_granted'
                || key === 'tray_removed' || key === 'slots_granted' || key === 'slots_removed') {
                    Object.assign(attributes, { [key]: disc[key] });
                }
            }

            const result = await knex('disciplines').update({ attributes: JSON.stringify(attributes)}).where('slug', disc.id).returning(['slug', 'attributes']);

            if (result) {
                console.log(result);
            }
        });
        
    }
    catch (e) {
        console.log(e);
        process.exit(1);
    }
})();