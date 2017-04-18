const formatDate = require('./formatDate');


module.exports = (articlesArr) => {
  return articlesArr
    .map(article => Object.assign({}, article, {date_posted: formatDate(+article.date_posted)}));
};
