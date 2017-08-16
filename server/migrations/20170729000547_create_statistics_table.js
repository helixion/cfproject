
exports.up = function(knex, Promise) {
  return Promise.resolve(knex.schema.createTableIfNotExists('statistics', function(t) {
    t.increments('id');
    t.string('type');
  }));
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('statistics'));
};
