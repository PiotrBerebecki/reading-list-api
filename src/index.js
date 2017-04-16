const express = require('express');
const url = require('url');
const database = require('./database');

const app = express();


app.get('/tags/', (req, res) => {
  const requestedTag = url.parse(req.url, true).query.q;

  const articlesToSend = Object.keys(database)
    .filter(key => database[key].tags.includes(requestedTag))
    .map(id => database[id]);

  res.send(articlesToSend);
});


const port = process.env.PORT || 4000;


app.listen(port, () => {
  console.log(`API server running on port ${port}`);
})
