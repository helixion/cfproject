
exports.up = function(knex, Promise) {
  return Promise.resolve(knex.schema.alterTable('disciplines', function(t) {
      t.dropColumn('extra');
  }));
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('disciplines'));
};
