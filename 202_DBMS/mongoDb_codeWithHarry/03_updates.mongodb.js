


// updating the documents  

use("ecommerce");


db.products.updateOne(
    {name: "wireless mouse"},  //yah mandatory hai SELECTOR hota hai
    {$set: {price: 899}}
)