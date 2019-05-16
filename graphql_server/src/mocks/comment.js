const faker = require("faker");

const CommentMock = () => ({
  postId: faker.random.number(),
  id: faker.random.number(),
  name: faker.name.findName(),
  email: faker.internet.email(),
  body: faker.lorem.text()
});

module.exports = CommentMock;
