
exports.up = function(knex, Promise) {
  return Promise.resolve(knex.schema.alterTable('disciplines', function(t) {
      t.json('attributes');
  }))
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('disciplines'));
};
