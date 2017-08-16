
exports.up = function(knex, Promise) {
  return Promise.resolve(knex.schema.alterTable('powers', function(t) {
    t.text('description').alter();
  }));
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('powers'));
};
