
exports.up = function(knex, Promise) {
  return Promise.all([
      knex.schema.createTableIfNotExists('tags', function(t) {
          t.increments('id').primary();
          t.string('tag');
      }),
      knex.schema.createTableIfNotExists('power_tags', function(t) {
          t.integer('power_id').references('powers.id');
          t.integer('tag_id').references('tags.id');
      })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
      knex.schema.dropTable('tags'),
      knex.schema.dropTable('power_tags'),      
  ]);
};
