install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

setwd("C:/Users/cabal/OneDrive/Desktop/DM1/WordCloud")

feedback_text <- readLines("feedback.txt")

corpus <- Corpus(VectorSource(feedback_text))

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)

tdm <- TermDocumentMatrix(corpus)
matrix <- as.matrix(tdm)
word_freq <- sort(rowSums(matrix), decreasing = TRUE)
freq_df <- data.frame(word = names(word_freq), freq = word_freq)
top10 <- head(freq_df, 10)
print(top10, row.names = FALSE)

cat("\nINTERPRETATION:\n")
cat("The top words show common themes in the feedback.\n")
cat("offic, staff, and process-related words appear most frequently.\n")
cat("These indicate main customer concerns and experiences.\n")


png("wordcloud_exam.png", width = 800, height = 600)
wordcloud(
  words = freq_df$word,
  freq = freq_df$freq,
  min.freq = 2,
  max.words = 1000,
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()

rare_words <- subset(freq_df, freq == 1)

png("wordcloud_rare.png", width = 800, height = 600)
wordcloud(
  words = rare_words$word,
  freq = rare_words$freq,
  min.freq = 1,
  max.words = 5,
  colors = brewer.pal(8, "Dark2"),
  random.order = FALSE
)
dev.off()




