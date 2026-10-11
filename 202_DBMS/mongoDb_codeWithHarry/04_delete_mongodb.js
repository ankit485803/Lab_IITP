

// delete data similar to update


use("ecommerce");


db.contacts.deleteOne({
    "name": "Alice"
})
