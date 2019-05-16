const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");
const configs = require("../configs/configs");

class Comment extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = configs.FGG_POST_BASEURL;
  }

  async getComments(postId) {
    return await this.get(`/comments?postId=${postId}`);
  }
}

module.exports = Comment;
