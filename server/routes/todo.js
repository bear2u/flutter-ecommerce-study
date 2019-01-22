var express = require('express');
var router = express.Router();

var Item = require('../models/item');

/* GET home page. */
router.get('/', function(req, res, next) {
  Item.find((err, items) => {    
    if(err)
      return res.status(500).send({error: err});
    res.json({
      code: 0,
      message: '',
      items
    })
  }).sort({_id:-1});  
});

//Add
router.post('/',function(req, res, next) {
  var item = Item();
  item.content = req.body.content;
  item.title = req.body.title;
  item.isdone = req.body.isdone;
  item.save((err, savedItem) => {
    if(err) {
      console.log(err);
      res.json({result: 0});
      return;
    }

    res.json({_id: savedItem.id});
    
  })
});

module.exports = router;