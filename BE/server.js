const express = require('express');
const productRouter = require('./routes/product');
const app = express();

app.use(express.json())
app.get('/', (req, res) => {
    console.log('hello world')
    res.status(200).json({message: "hello world"})
})

app.use('/products', productRouter)
app.listen(5555);