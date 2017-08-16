
exports.up = function(knex, Promise) {
  return Promise.resolve(
    knex.schema.alterTable('powers', function(t) {
        t.string('name');
    })
  );
};

exports.down = function(knex, Promise) {
  return Promise.resolve(
      knex.schema.dropTable('powers')
  );
};
