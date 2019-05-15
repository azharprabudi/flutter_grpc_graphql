const client = require("./utils/client");

const ArticleGRPC = {
  get: page => {
    return new Promise((resolve, reject) => {
      client.get({ page }, (err, articles) => {
        console.log({ err, articles });

        if (err != null) {
          reject(err);
        }

        resolve(articles);
      });
    });
  }
};

module.exports = ArticleGRPC;
