const { RESTDataSource } = require("apollo-datasource-rest");
const DataLoader = require('dataloader');
const configs = require("../configs/configs");

class Comment extends RESTDataSource {
    constructor() {
        super();
        this.baseURL = configs.FGG_POST_BASEURL
    }

    get progressLoader() {
        return new DataLoader((postId) => {
            const resp = await this.get(`/comments?postId=${postId}`);
            
            return [resp];
        })
    }

    async getComments(postId) {
        return this.progressLoader.load(postId);
    }
}


module.exports = Comment;
