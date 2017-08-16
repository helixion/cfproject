const knex = require('../setup');
const uniqBy = require('lodash/uniqBy');
// const request = require('got');

(async function() {
    try {
        let data = await knex.select('attributes').from('disciplines');
        let query = [];
        data.forEach(d => {
            if (d.attributes.stats.length > 0) {
                const stats = d.attributes.stats;
                stats.forEach(stat => query.push({ type: stat.name}));
            }
        });
        const results = await knex.insert(uniqBy(query, 'type')).into('statistics').returning(['id', 'type']);
        if (results.length > 0) results.forEach(r => console.log(r));
        process.exit(0);
    } catch(e) {
        console.log(e);
        process.exit(1);
    }
})();