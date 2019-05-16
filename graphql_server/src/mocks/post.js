const faker = require("faker");
const { MockList } = require("apollo-server");

const PostMock = () => ({
  userId: faker.random.number().toString(),
  id: faker.random.number(),
  title: faker.name.findName(),
  body: faker.lorem.text(),
  comments: () => new MockList(20)
});

module.exports = PostMock;
