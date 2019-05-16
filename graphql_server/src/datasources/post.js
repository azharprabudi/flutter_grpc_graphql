const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");
const configs = require("../configs/configs");

class PostAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = configs.FGG_POST_BASEURL;
  }

  async getPosts() {
    return await this.get("/posts");
  }

  async getPost(postId) {
    return await this.get(`/posts/${id}`);
  }
}

module.exports = PostAPI;
