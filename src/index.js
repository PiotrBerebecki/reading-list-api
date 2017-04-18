if (process.env.NODE_ENV === 'dev') {
  require('dotenv').config({path: './config-dev.env'});
} else {
  require('dotenv').config({path: './config-prod.env'});
}


const express = require('express');
const querystring = require('querystring');

const get = require('./database/get');
const pipe = require('./helpers/pipe');


const app = express();


// Allow CORS for all routes
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


app.get('/tag/', (req, res) => {

  get.articlesByQuery(req.query.tag, (dbErr, dBres) => {
    if (dbErr) { return res.send({error: dbErr.message}); }

    res.send(dBres);
  });
});


app.get('/*', (req, res) => {
  res.send({error: 'Sorry, we are having a tech glitch'});
});


const port = process.env.PORT || 4000;


app.listen(port, () => {
  console.log(`API server running on port ${port}`);
});






// const getProp = (reqObj, key, prop) => {
//   return reqObj[key][prop];
// }
//
// const getParams = getProp.bind(null, req, 'params')
// const getQuery = getProp.bind(null, req, 'query')
//
// const articlesToSend = pipe(getParams, getQuery, getArticlesByQuery)(Object.keys(req.params)[0]);
