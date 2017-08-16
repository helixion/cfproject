
exports.up = function(knex, Promise) {
  return Promise.resolve(
      knex.schema.alterTable('classes', function(t) {
          t.text('lore');
          t.string('class_type');
      })
  );
};

exports.down = function(knex, Promise) {
  return Promise.resolve(knex.schema.dropTable('classes'));
};
