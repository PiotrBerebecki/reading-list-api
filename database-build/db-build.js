const fs = require('fs');
const path = require('path');


let build;

if (process.env.NODE_ENV === 'dev') {
  require('dotenv').config({path: './config-dev.env'});
  build = fs.readFileSync(path.join(__dirname, 'db-build-dev.sql'), 'utf8');
} else {
  require('dotenv').config({path: './config-prod.env'});
  build = fs.readFileSync(path.join(__dirname, 'db-build-prod.sql'), 'utf8');
}


const connect = require('./../src/database/db-connect');


connect.query(build, (err, res) => {
  if (err) throw err;
  console.log('db build successful');
});
