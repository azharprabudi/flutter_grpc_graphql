const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");
const configs = require("../configs/configs");

class PostAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = configs.FGG_POST_BASEURL;
  }

  get progressLoader() {
    return new DataLoader(async key => {
      const resp = await this.get("/posts");

      return [resp];
    });
  }

  get postProgressLoader() {
    return new DataLoader(async id => {
      const resp = await this.get(`/posts/${id}`);

      return [resp];
    });
  }

  async getPosts() {
    return await this.progressLoader.load(new Date().getTime());
  }

  async getPost(postId) {
    return await this.postProgressLoader.load(postId);
  }
}

module.exports = PostAPI;
