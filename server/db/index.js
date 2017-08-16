const Model = require('objection').Model;
const knex = require('./setup');

module.exports = Model.knex(knex);