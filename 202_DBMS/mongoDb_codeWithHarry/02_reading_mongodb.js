
// reading the documents CRUD operation

use("ecommerce");


db.products.find({"name": "Wireless Mouse"})

// find all the product bhai present hai database mai
db.products.find();

//category se find karo using comparison operators
db.products.find({ price: { $gt: 1000 } });