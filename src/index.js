const express = require('express');
const querystring = require('querystring');

const { getArticlesByQuery } = require('./database/get');
const pipe = require('./helpers/pipe');


const app = express();


app.get('/:section/', (req, res) => {

  const getProp = (reqObj, key, prop) => {
    return reqObj[key][prop];
  }

  const getParams = getProp.bind(null, req, 'params')
  const getQuery = getProp.bind(null, req, 'query')

  const articlesToSend = pipe(getParams, getQuery, getArticlesByQuery)(Object.keys(req.params)[0]);

  res.header('Access-Control-Allow-Origin', '*');
  res.send(articlesToSend);
});


const port = process.env.PORT || 4000;


app.listen(port, () => {
  console.log(`API server running on port ${port}`);
})
