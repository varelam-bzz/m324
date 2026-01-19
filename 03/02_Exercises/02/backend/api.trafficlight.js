//require trafficlight.js
const {trafficLight} = require('./trafficlight');

//Export API
const express = require('express');
const router = express.Router();

//welcome message
/**
 *  /api/welcome: welcome message
 */
router.get('/welcome', (req, res) => {
    res.status(200).send({
        message: 'Welcome to the traffic light API'
    });
});

/**
 * /api/trafficlight
 */
router.get('/trafficlight', (req, res) => {
    const result = trafficLight();
    res.status(200).send({
        message: result
    });
});

/**
 * /api/trafficlight/:color
 * color is a parameter i.e. /api/trafficlight/red
 */
router.get('/trafficlight/:color', (req, res) => {
    const color = req.params.color;
    const result = trafficLight(color);
    res.status(200).send({
        message: result
    });
});

module.exports = router;
