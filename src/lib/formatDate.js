module.exports = (millis) => {
  const dateOptions = { day: 'numeric', month: 'short', year: 'numeric' };
  return new Date(millis).toLocaleDateString('en-GB', dateOptions);
};
