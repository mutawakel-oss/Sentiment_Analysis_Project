corpusFun <- function(review_vector){
  require(tm)
  require(wordcloud)
  
  # Following code is used to create the corpus vector
  z1 = Corpus(VectorSource(review_vector)) 
  # Following code will be used to remove stop words, white spaces and then stem the words
  z2 = tm_map(z1, removeWords, stopwords("english"))
  z3 = tm_map(z2, stripWhitespace)
  z4 = tm_map(z3, stemDocument)
  res = sentiment(z4)
  return(res)
}

