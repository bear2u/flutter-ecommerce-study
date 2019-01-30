var express = require('express');
var router = express.Router();

var Shop = require('../models/shop');

/* GET home page. */
router.get('/', function(req, res, next) {
  Shop.find((err, shops) => {    
    if(err)
      return res.status(500).send({error: err});
    res.json({
      code: 0,
      message: '',
      shops
    })
  }).sort({_id:-1});  
});

/* Add shop item */
router.post('/', (req, res, next) => {
    Shop.create(req.body)
        .then( shop => res.json({ code: 0, message: '', shop}))
});

module.exports = router;