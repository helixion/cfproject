const knex = require('../setup');
const request = require('got');

(async function() {
    try {
        const data = await request('https://api.malekai.network/powers');
        const db = await knex.select('id', 'slug').from('powers');
        const powers = JSON.parse(data.body);

        let query = [];
        
        for (let i = 0; i < db.length; i++) {
            if (powers[i].previous_chain.length === 0) {
                continue;
            } else {
                let child_power = db.find(el => el.slug === powers[i].id);
                let parent_power = db.find(el => el.slug === powers[i].previous_chain[0]);

                if (child_power.id && parent_power.id) {
                    query.push({
                        parent_power_id: parent_power.id,
                        child_power_id: child_power.id
                    });
                }
            }
        }

        if (query.length > 0) {
            const results = await knex.insert(query).into('combos').returning(['parent_power_id', 'child_power_id']);
            if (results.length > 0) {
                results.forEach(r => console.log('%s is parent to %s', r.parent_power_id, r.child_power_id));
            }
        }
        process.exit(0);
    } 
    catch (e) {
        console.log(e);
        process.exit(1);
    }
})();