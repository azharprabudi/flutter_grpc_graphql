const { RESTDataSource } = require("apollo-datasource-rest");
const configs = require("../configs/configs");

class ArticleAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = "https://newsapi.org";
  }

  async getArticle(page) {
    const resp = await this.get("v2/top-headlines", {
      page,
      country: "id",
      category: "sports",
      apiKey: configs.FGG_NEWS_API_KEY
    });

    return resp;
  }
}

module.exports = ArticleAPI;
