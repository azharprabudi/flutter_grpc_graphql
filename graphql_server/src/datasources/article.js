const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require("dataloader");

class ArticleAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = "https://newsapi.org/v2";
  }

  get progressLoader() {
    return new DataLoader(async page => {
      const resp = await this.get("/top-headlines", {
        page,
        country: "id",
        category: "sports",
        apiKey: "c6f23162e2f8454f8a87763a5c9d7fca"
      });

      return resp.data;
    });
  }

  getArticle(page) {
    return this.progressLoader.load(page);
  }
}

module.exports = ArticleAPI;
