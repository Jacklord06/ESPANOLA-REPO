#EspaNola, Jacklord BSIT 2-A
#INDIVIDUAL PROJECT #2

#Packages that will be needed
library(twitteR)
library(tm)
library(dplyr)
library(plotly)
library(ggplot2)
library(tidytext)
library(stringr)
library(tidyr)
library(magrittr)
library(corpus)
library(rtweet)
library(slam)


#1. Extract 10000 tweets from Twitter using twitteR package including retweets

#place your own token key and secret
# set the credentials
CONSUMER_SECRET <- "8LvRHk6qo04uwR5MD3LiBFQjKkntdScxp965Ig8cUGDHfrYskw"
CONSUMER_KEY <- "i9BRjoSEXukdBdAVhQi6tistg"
ACCESS_SECRET <- "HyHUdA1S9nVoncvWwokPAwNPf6isQOTStXj7exKE0vYX9"
ACCESS_TOKEN <- "1595426639126880257-eqts7cMokyHWn8A59Wj3B9pJzzQEmO"

# connect to twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#Get 10000 observations "including retweets.
library(twitteR)
tweeTenK <- searchTwitter("Twice",
                          n = 10000,
                          lang = "en",
                          since = "2022-11-21",
                          until = "2022-11-30",
                          retryOnRateLimit = 120)
tweeTenK

#Converting data into dataframe
twits <- twListToDF(tweeTenK)
twits

#Saving the data into a file
save("twits", file = "twits.Rdata")
load("twits.Rdata")


#2. Subset the retweets and the original tweets into a seperate file.
#Subsetting using the dplyr()package

#Original tweets
 orig_tweets <- twits %>%
   select(screenName,text,created,isRetweet) %>%
   filter(isRetweet == FALSE)
 save(orig_tweets, file = "orig_tweets.Rdata")
 
 #Retweets
 re_tweets <- twits %>%
   select(screenName,text,created,isRetweet) %>%
   filter(isRetweet == TRUE)
 save(re_tweets, file = "re_tweets.Rdata")
 
 
 #Grouping the data created
 
 #Original tweets
 orig_tweets %>%  
   group_by(1) %>%  
   summarise(max = max(created), min = min(created))
 
 original <- orig_tweets %>% 
   mutate(Created_At_Round = created %>% round(units = 'hours') %>%
            as.POSIXct())

 minOrig <- orig_tweets %>% pull(created) %>% min()
 
 maxOrig <- orig_tweets %>% pull(created) %>% max()
 
 #Retweets
 re_tweets %>%  
   group_by(1) %>%  
   summarise(max = max(created), min = min(created))
 
 reTweet <- re_tweets %>% 
   mutate(Created_At_Round = created %>% round(units = 'hours') %>%
            as.POSIXct())
 
 minTweet <- re_tweets %>% pull(created) %>% min()
 
 maxTweet <- re_tweets %>% pull(created) %>% max()
 

 
 
#3. Plot the retweets and the original tweets using bar graph in vertical manner.
 #Original tweets
 origTwit <- ggplot(data = original, aes(x = Created_At_Round)) +
   geom_histogram(aes(fill = ..count..)) +
   theme(legend.position = "right") +
   xlab("Time") + ylab("Number of tweets") + 
   scale_fill_gradient(low = "midnightblue", high = "aquamarine4")
 
 origTwit %>% ggplotly()
 
 #Retweets
 reTwit <- ggplot(data = reTweet, aes(x = Created_At_Round)) +
   geom_histogram(aes(fill = ..count..)) +
   scale_fill_gradient(low = "midnightblue", high = "aquamarine4")
 
 reTwit %>% ggplotly()
 
 

 
