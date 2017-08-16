
exports.up = function(knex, Promise) {
  return Promise.all([
      knex.schema.alterTable('classes', function(t) {
          t.string('abbreviation');
      }),
      knex.schema.alterTable('disciplines', function(t) {
          t.text('lore');
      })
  ])
};

exports.down = function(knex, Promise) {
  return Promise.all([
      knex.schema.dropTable('classes'),
      knex.schema.dropTable('disciplines')
  ]);
};
