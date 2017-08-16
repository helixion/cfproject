const knex = require('../../setup');
const _ = require('lodash');

const abbreviations = [
    { name: 'myrmidon', abbreviation: 'MYRM' },
    { name: 'knight', abbreviation: 'KNGT' },
    { name: 'cleric', abbreviation: 'CLER' },
    { name: 'ranger', abbreviation: 'RNGR' },
    { name: 'assassin', abbreviation: 'ASSN' },
    { name: 'druid', abbreviation: 'DRUD' },
    { name: 'duelist', abbreviation: 'DUEL' },
    { name: 'templar', abbreviation: 'TMPR' },
    { name: 'champion', abbreviation: 'CHMP' },
    { name: 'confessor', abbreviation: 'CONF' },
    // { name: 'frostweaver', abbreviation: 'FRTW' }
];
const img_path = '/assets/images/classes/';
const svg_path = '/assets/svgs/classes/';

abbreviations.forEach(classes => {
            knex('classes')
            .update({
                icon: img_path + classes.name + '.png',
                icon_svg: svg_path + classes.name + '.svg',
                // abbreviation: classes.abbreviation
            })
            .where('slug', classes.name)
            .then(res => {
                console.log(res);
            })
});

// (async function() {
//    try {
//        const img_path = '/assets/images/';
//        const svg_path = '/assets/svgs/';

//        let where = [];
//        let query = [];
//        let val = [];
       
//         abbreviations.forEach(classes => {
//             query.push({
//                 icon: img_path + classes.name + '.png',
//                 icon_svg: svg_path + classes.name + '.svg',
//                 abbreviation: classes.abbreviation
//             });
//             where.push({ slug: classes.name });
//         });

//         let updateQuery = [
//             'INSERT INTO classes (icon, icon_svg, abbreviation) VALUES',
//             _.map(query, () => '(?)').join(','),
//             'WHERE slug =',
//             _.map(where, 'slug').join(',')
//         ].join(' ');

//        _.map(query, q => val.push(_.values(q)));

//         // const results = await knex.raw(updateQuery, val).returning(['icon', 'icon_svg', 'abbreviation']);

//         // if (results.length > 0) {
//         //     results.forEach(r => console.log(`${r.icon} ${r.icon_svg} ${r.abbreviation} ${r.name}`));
//         // }

//         console.log(updateQuery);
//         console.log(val);
//         process.exit(0);
//    }
//    catch(e) {
//        console.log(e);
//        process.exit(1);
//    }
// })();