const connect = require('./db-connect');
const formatDate = require('./../lib/formatDate');


const get = {};


get.articlesByQuery = (requestedTag, callback) => {

  const sqlQuery = `
    SELECT u.avatar_url as author_avatar_url, u.display_name as author_display_name, a.date_posted, a.reading_time, a.image_url, a.title, a.body_text FROM articles as a
    INNER JOIN users as u
    ON u.id = a.author_id
    WHERE tags = $1;
  `;

  connect.query(sqlQuery, [requestedTag], (err, articles) => {
    if (err) { return callback(new Error('Database error')); }

    callback(null, articles.rows);
  })

};


module.exports = get;
