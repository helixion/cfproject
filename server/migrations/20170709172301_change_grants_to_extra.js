
exports.up = function(knex, Promise) {
 return Promise.resolve(knex.schema.alterTable('disciplines', function(t) {
      t.renameColumn('grants', 'extra');
  }))
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('disciplines'));
};
