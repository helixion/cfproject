
exports.up = function(knex, Promise) {
  return Promise.all([
      knex.schema.createTableIfNotExists('powers', function(t) {
          t.increments('id').primary();
          t.string('slug');
          t.string('data_type');
          t.string('description');
          t.string('icon');
          t.string('type');
          t.string('cast_type');
          t.string('resource_type');
          t.string('resource_cost');
          t.string('targeting');
          t.integer('duration');
          t.integer('max_targets');
          t.integer('range');
          t.integer('min_damage');
          t.integer('max_damage');
          t.boolean('is_combo_child').default(false);
          t.timestamps();
          t.unique('slug');
      }),
      knex.schema.createTableIfNotExists('combos', function(t) {
          t.integer('parent_power_id').references('powers.id');
          t.integer('child_power_id').references('powers.id');
      })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
      knex.schema.dropTable('powers'),
      knex.schema.dropTable('combos')
  ]);
};
