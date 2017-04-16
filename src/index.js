const express = require('express');
const database = require('./database');

const app = express();


app.get('/tag/', (req, res) => {
  const requestedTag = req.query.q;

  const articlesToSend = Object.keys(database)
    .filter(key => database[key].tags.includes(requestedTag))
    .map(id => database[id]);

  res.send(articlesToSend);
});


const port = process.env.PORT || 4000;


app.listen(port, () => {
  console.log(`API server running on port ${port}`);
})
