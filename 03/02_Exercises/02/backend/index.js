'use strict';
let app = require("express")();
let bodyParser = require("body-parser");
const cors = require("cors");


//Set express variable
app.use(cors({orgin: '*'}));
const port = process.env.PORT || 3000;
const server = app.listen(port);
console.log(`Running at Port ${port}`);
server.timeout = 1000 * 60 * 2; // 2 minutes


// support json encoded bodies
app.use(bodyParser.json());
// support encoded bodies
app.use(bodyParser.urlencoded({ extended: true }));

//import api
app.use('/api', require('./api.trafficlight'));

