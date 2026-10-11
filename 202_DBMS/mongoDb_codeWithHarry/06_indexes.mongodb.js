

use("ecommerce");

// db.sales.find()
db.sales.find().pretty()


db.sales.getIndexes()

//create index at quantity jab banate hai to read fast hota hai but write operation very slow ho jata hai
db.sales.createIndex({quantity: 1})