const knex = require('../../setup');
const img_path = '/assets/images/powers/';
const svg_path = '/assets/svgs/powers/';

(async function() {
try {    
    const powers = await knex.select('slug').from('powers');

    powers.forEach(async function(power) {
         const updateQuery = {
            icon: img_path + power.slug + '.png',
            icon_svg: svg_path + power.slug + '.svg'
        };
        const result = await knex('powers').update(updateQuery).where('slug', power.slug);
        if (result) console.log(result);
    })
}
catch(e) {
    console.log(e);
    process.exit(1);
}    
})();