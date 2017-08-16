
exports.up = function(knex, Promise) {
  return Promise.all([
      knex.schema.alterTable('powers', function(t) {
          t.string('icon_svg');
      }),
      knex.schema.alterTable('classes', function(t) {
          t.string('icon_svg');
      }),
      knex.schema.alterTable('races', function(t) {
          t.string('icon_svg');
      }),
      knex.schema.alterTable('disciplines', function(t) {
          t.string('icon_svg');
      }),
  ])
};

exports.down = function(knex, Promise) {
  return Promise.all([
      knex.schema.dropTable('powers'),
      knex.schema.dropTable('race'),
      knex.schema.dropTable('classes'),
      knex.schema.dropTable('disciplines')
  ]);
};
