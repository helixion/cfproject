const knex = require('../setup');
const uniqBy = require('lodash/uniqBy');
const request = require('got');

(async function() {
    try {
        const powers = await request('https://api.malekai.network/powers');
        const disciplines = await request('https://api.malekai.network/disciplines');

        const parsedPowers = JSON.parse(powers.body);
        const parsedDisciplines = JSON.parse(disciplines.body);
        
        const query = [];

        parsedPowers.forEach(data => data.tags.forEach(tag => query.push({ tag: tag.trim() })));
        parsedDisciplines.forEach(data => data.tags.forEach(tag => query.push({ tag: tag.trim() })));
        
        // console.log(uniqBy(query, 'name'));

        const results = await knex.insert(uniqBy(query, 'tag')).into('tags').returning('id');

        if (results.length > 0) {
            results.forEach(r => console.log(`${r} has been entered into the datbase.`));
        }

        process.exit(0);
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();