
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTableIfNotExists('races', function(t) {
        t.increments('id').primary();
        t.string('data_type');
        t.string('slug');
        t.string('name');
        t.text('description');
        t.string('icon');
        t.timestamps();
    }),
    knex.schema.createTableIfNotExists('race_tags', function(t) {
        t.integer('race_id').references('races.id');
        t.integer('tag_id').references('tags.id');
    }),
    knex.schema.createTableIfNotExists('race_disciplines', function(t) {
        t.integer('race_id').references('races.id');
        t.integer('discipline_id').references('disciplines.id');
    }),
    knex.schema.createTableIfNotExists('classes', function(t) {
        t.increments('id').primary();
        t.string('data_type');
        t.string('slug');
        t.string('name');
        t.string('icon');
        t.text('description');
        t.timestamps();
    }),
    knex.schema.createTableIfNotExists('class_races', function(t) {
        t.integer('class_id').references('classes.id');
        t.integer('race_id').references('races.id');
    }),
    knex.schema.createTableIfNotExists('class_tags', function(t) { 
        t.integer('class_id').references('classes.id');
        t.integer('tag_id').references('tags.id');
    }),
    knex.schema.createTableIfNotExists('class_powers', function(t) {
        t.integer('class_id').references('classes.id');
        t.integer('power_id').references('powers.id');
    }),
    knex.schema.createTableIfNotExists('disciplines', function(t) {
        t.increments('id').primary();
        t.string('data_type');
        t.string('slug');
        t.string('name');
        t.string('discipline_type');
        t.string('icon');
        t.json('grants');
        t.timestamps();   
    }),
    knex.schema.createTableIfNotExists('discipline_classes', function(t) {
         t.integer('discipline_id').references('disciplines.id');
         t.integer('class_id').references('classes.id');
    }),
    knex.schema.createTableIfNotExists('discipline_powers', function(t) {
        t.integer('discipline_id').references('disciplines.id');
        t.integer('power_id').references('powers.id');
    }),
    knex.schema.createTableIfNotExists('discipline_tags', function(t) {
        t.integer('discipline_id').references('disciplines.id');
        t.integer('tag_id').references('tags.id');
    })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
      knex.schema.dropTable('races'),
      knex.schema.dropTable('race_tags'),
      knex.schema.dropTable('race_disciplines'),
      knex.schema.dropTable('classes'),
      knex.schema.dropTable('class_races'),
      knex.schema.dropTable('class_tags'),
      knex.schema.dropTable('class_powers'),
      knex.schema.dropTable('disciplines'),
      knex.schema.dropTable('discipline_classes'),
      knex.schema.dropTable('discipline_powers'),
      knex.schema.dropTable('discipline_tags'),            
  ]);
};
