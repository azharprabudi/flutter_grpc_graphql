package configs

import (
	"os"
)

var config = map[string]string{
	"FGG_PORT":             "6969",
	"FGG_PORT_REDIS":       "6379",
	"FGG_NEWS_API_BASEURL": "https://newsapi.org",
	"FGG_NEWS_API_KEY":     "rahasia",
}

func Get(key string) string {
	res := os.Getenv(key)
	if res == "" {
		return config[key]
	}

	return res
}
