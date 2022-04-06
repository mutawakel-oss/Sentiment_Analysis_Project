#Following function will be used to apply link the language positive and negative lexicon, then display the word cloud
# and finally calculate the percentage of negative and positive reviewes
sentiment <- function(corpus_after_stem)
{
  
  
  #Following code is going to be used to generate the word cloud
  wordcloud(corpus_after_stem,
            min.freq = 3,
            colors=brewer.pal(8, "Dark2"),
            random.color = TRUE,
            max.words = 100)
  #Following code will be used to load the dataset of the negative and positive English lexicons
  
  
  positive <- read.csv("positive-lexicon.txt")
  negative <- read.csv("negative-lexicon.txt")
  
  #initiating variables
  total_pos <- 0
  total_neg <- 0
  pos_count_vector <- c()
  neg_count_vector <- c()
  #Following code will calculate the length of the corpus
  size <- length(corpus_after_stem)
  
  for(i in 1:size)
  {
    #Following code will be used to grasp all the words in the corpus
    corpus_words<- list(strsplit(corpus_after_stem[[i]]$content, split = " "))
    
    #Following code will be used to get the negative review
    pos_count <-length(intersect(unlist(corpus_words), unlist(positive)))
    
    #Following code will be used to get the positive review
    neg_count <- length(intersect(unlist(corpus_words), unlist(negative)))
    
    total_pos <- total_pos + pos_count 
    total_neg <- total_neg + neg_count 
    
  }
  #Following code will be use to calculate the positive and negative percentages after reviewing the whole corpus
  total_pos 
  total_pos 
  total_count <- total_pos + total_neg
  overall_positive_percentage <- (total_pos*100)/total_count
  overall_negative_percentage <- (total_neg*100)/total_count
  
  #Following code will be used to create a new dataframe for the overall results
  df<-data.frame(Review_Type=c("Postive","Negitive"),
                 Count=c(total_pos ,total_neg ))
  print(total_count)
  print(df) #Print
  overall_positive_percentage<-paste("Positive Reviews %:",
                                     round(overall_positive_percentage,2),"%")
  overall_negative_percentage<-paste("Negative Reviews %:",
                                     round(overall_negative_percentage,2),"%")
  print(overall_positive_percentage)
  print(overall_negative_percentage)
  return(overall_positive_percentage)
}
