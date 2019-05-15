const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");
const configs = require("../configs/configs");

class ArticleAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = "https://newsapi.org";
  }

  get progressLoader() {
    return new DataLoader(async page => {
      const resp = await this.get("v2/top-headlines", {
        page,
        country: "id",
        category: "sports",
        apiKey: configs.FGG_NEWS_API_KEY
      });

      return [resp];
    });
  }

  getArticle(page) {
    return this.progressLoader.load(page);
  }
}

module.exports = ArticleAPI;
