const knex = require('../setup');
const request = require('got');

const img_path = '/public/assets/images/powers/';
const svg_path = '/public/assets/svg/powers/';

const resourceTypes = [
    { class: 'myrmidon', r_type: 'fury' },
    { class: 'templar', r_type: 'pips' },
    { class: 'knight', r_type: 'stamina'},
    { class: 'druid', r_type: 'essence' },
    { class: 'cleric', r_type: 'N/A' },
    { class: 'champion', r_type: 'rage'},
    { class: 'confessor', r_type: 'mana' },
    { class: 'ranger', r_type: 'energy' },
    { class: 'duelist', r_type: 'pip' },
];

(async function() {
    try {
        
        const data = await request('https://api.malekai.network/powers');
        const powers = JSON.parse(data.body);
        
        if (powers.length > 0) {

            const query = powers.map(power => {
                
                let is_combo_child = false;
                let resource_type;
                const icon_path_png = img_path + power.id + '.png';
                const icon_path_svg = svg_path + power.id + '.svg';

                if (power.previous_chain.length > 0) {
                    is_combo_child = true;
                } else {
                    is_combo_child = false;
                }

                // if (power.sources.length > 0) {
                //     resource_type = resourceTypes.filter(resource => {
                //         let r = '';
                //         for (let i = 0; i < power.sources.length; i++) {
                //             if (power.sources[i].id === resource.class) {
                //                 r = resource['r_type'];
                //             } 
                //         }
                //         return r;
                //     });
                // }
                
                if (power.sources[0].id === 'class') {
                    resource_type = resourceTypes.find(el => el.class === power.sources[0].id);
                }
                

                const date = new Date();

                return {
                    data_type: power.data_type,
                    slug: power.id,
                    name: power.name,
                    description: power.description,
                    icon: icon_path_png,
                    icon_svg: icon_path_svg,
                    type: power.type,
                    cast_type: power.cast_type,
                    resource_cost: power.cost.pips > 0 ? power.cost.pips : power.cost.resource,
                    // resource_type: resource_type[0] ? resource_type[0].r_type[0].toUpperCase() + resource_type[0].r_type.slice(1) : 'Universal',
                    resource_type: resource_type ? resource_type.r_type[0].toUpperCase() + resource_type.r_type.slice(1) : 'Universal',                    
                    duration: Math.abs(Math.floor(power.duration)),
                    cooldown: power.cooldown,
                    targeting: power.targeting,
                    max_targets: power.max_targets,
                    range: parseInt(power.range),
                    is_combo_child: is_combo_child,
                    created_at: date.toISOString(),
                    updated_at: date.toISOString()
                };
            });

            const results = await knex.insert(query).into('powers').returning('id');

            if (results.length > 0) {
                results.forEach(result => console.log(`${result} has been entered into the databse.`));
            }

            process.exit(0);
        }
    }
    catch(e) {
        console.log(e);
        process.exit(1);
    }
})();