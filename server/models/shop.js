var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var shopSchema = new Schema({
    intro: String,
    title: String,
    price : Number,
    isbn13: String,
    isbn10: String,
    publisher: String,
    publishDt: String,
    author: String,
    thumbnail: String,
    createdDate: { type: Date, default: Date.now  }
});

module.exports = mongoose.model('shop', shopSchema);
