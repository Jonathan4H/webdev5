const { v4: uuidv4 } = require('uuid');
const express = require('express');
const router = express.Router();

let products = [{
    id: '1234',
    name: 'smartphone',
    price: 2000,
    currency: 'USD'
}]

router.get('/', (req, res) => {
    res.json({
        message: 'successfully get data',
        data: products
    })
})

router.post('/', (req, res) => {
    const payloadCreate = req.body;
    console.log('payload', payloadCreate)
    const productId = uuidv4();
    const payload = {
        ...payloadCreate,
        id: productId
    }
    products.push(payload)
    res.json({message: 'product create endpoint'})
})

router.route('/:productID')
    .get((req, res) => {
        const {productID} = req.params
        const selectedProduct = products.find((item) => item.id === productID)
        res.json({
            message: `product detail endpoint ID = ${productID}`,
            data: selectedProduct
        })
    })
    .put((req, res) => {
        const {productID} = req.params
        const payloadEdit = req.body;

        products = products.map((item) => {
            if(item.id === productID) {
                return {
                    ...item,
                    ...(payloadEdit.name && {name: payloadEdit.name}),
                    ...(payloadEdit.price && {price: payloadEdit.price}),
                    ...(payloadEdit.currency && {currency: payloadEdit.currency})
                }
            }
            return item
        })
        res.json({
            message: `product update endpoint ID = ${productID}`,
            data: products
        })
    })
    .delete((req, res) => {
        const {productID} = req.params
        products = products.filter((item) => item.id !== productID)
        res.json({
            message: `product delete endpoint ID = ${productID}`,
            data: products
        })
    })

// router.get('/:productID', (req, res) => {
//     const {productID} = req.params
//     res.json({message: `product update endpoint ID = ${productID}`})
// })

// router.put('/:productID', (req, res) => {
//     const {productID} = req.params
//     res.json({message: `product update endpoint ID = ${productID}`})
// })

// router.delete('/:productID', (req, res) => {
//     const {productID} = req.params
//     res.json({message: `product delete endpoint ID = ${productID}`})
// })

module.exports = router;