const Model = require('objection').Model;

class Base extends Model {
    $beforeInsert() {
        const now = Date.now().toISOString();
        this.created_at = now;
        this.updated_at = now;        
    }

    $beforeUpdate() {
        const now = Date.now().toISOString();
        this.updated_at = now;        
    }
}

module.exports = Base;