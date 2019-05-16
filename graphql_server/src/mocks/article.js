const faker = require("faker");

const ArticleMock = () => ({
  source: {
    id: null,
    name: ""
  },
  author: faker.name.findName(),
  title: faker.name.findName(),
  description: faker.lorem.text(),
  url: faker.internet.url(),
  urlToImage: faker.image.image(),
  publishedAt: faker.date.recent().toString(),
  content: faker.lorem.text()
});

module.exports = ArticleMock;
