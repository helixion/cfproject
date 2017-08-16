const knex = require('../../setup');
const img_path = '/assets/images/disciplines/';
const svg_path = '/assets/svgs/disciplines/';

const date = new Date();

// knex.select('slug').from('disciplines')
//     .then(disc => disc)
//     .then(disc => {
//         disc.forEach(d => {
//             const updateQuery = {
//                 icon: img_path + d.slug + '.png',
//                 icon_svg: svg_path + d.slug + '.svg',
//                 // created_at: date.toISOString(),
//                 // updated_at: date.toISOString()
//             };
//             knex('disciplines')
//                 .update(updateQuery)
//                 .where('slug', d.slug)
//                 .returning(['icon', 'icon_svg', 'created_at', 'updated_at'])
//                 .then(result => console.log(result));
//         });
//     });


async function updateDisciplines() {
   try {
        const disciplines = await knex.select('slug').from('disciplines');

        disciplines.forEach(d => {
            const updateQuery = {
                    icon: img_path + d.slug + '.png',
                    icon_svg: svg_path + d.slug + '.svg',
                    // created_at: date.toISOString(),
                    // updated_at: date.toISOString()
            };
            const result = await knex('disciplines').update(updateQuery).where('slug', d.slug).returning(['icon', 'icon_svg']);
            if (result) console.log(result);

        })

        process.exit(0);
   }
   catch(e) {
       console.log(e);
       process.exit(1);
   }
}

updateDisciplines();