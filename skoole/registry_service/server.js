// Recover all the libraries
const express = require('express');
const bodyparser = require('body-parser');
const config = require('config');

// Initializes the app
const app = express();

// Set BodyParser middleware on application/json requests
app.use(bodyparser.json());

// Recover the service port to listen for the API
let port = config.get('service_port');

// Recover the service name for display
let serviceName = config.get('service_name');

// Make the API avaliable on port 3001
app.listen(port, () => {
    console.log(serviceName + ' avaliable on port ' + port);
});