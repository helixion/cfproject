
exports.up = function(knex, Promise) {
  return Promise.resolve(knex.schema.createTableIfNotExists('discipline_types', function(t) {
      t.increments('id');
      t.string('type_name');
      t.timestamps();
  }))
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('discipline_types'));
};
