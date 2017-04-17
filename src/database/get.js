const database = require('./database');
const formatDate = require('./../lib/formatDate');


const getArticlesByQuery = (requestedTag) => {
  return Object.keys(database)
    .filter(key => database[key].tags.includes(requestedTag))
    .map(id => database[id])
    .map(article => Object.assign({}, article, {date_posted: formatDate(article.date_posted)}))
};


module.exports = {
  getArticlesByQuery
};
