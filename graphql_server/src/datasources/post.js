const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");
const configs = require("../configs/configs");

class PostAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = configs.FGG_POST_BASEURL;
  }

  get progressLoader() {
    return new DataLoader(async () => {
      const resp = await this.get("/posts");
      return [resp];
    });
  }

  async getPosts() {
    return await this.progressLoader.load();
  }
}

module.exports = PostAPI;
