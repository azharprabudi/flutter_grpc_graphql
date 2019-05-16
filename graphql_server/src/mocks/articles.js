const { MockList } = require("apollo-server");

const ArticlesMock = () => ({
  status: "ok",
  totalResults: 20,
  articles: () => new MockList(20)
});

module.exports = ArticlesMock;
