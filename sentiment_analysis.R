# loading libraries and the dataset
library(tm) 
library(wordcloud) 
library(DataExplorer)

#Calling the functions used to stem the review words and create corpus

source("sentiment.R")
source("corpusFun.R")

user_reviews <- read.csv("dataset_30_restaurant.csv", header= TRUE)


names(user_reviews)
head(user_reviews)
tail(user_reviews)
summary(user_reviews)
str(user_reviews)
dim(user_reviews)
skimr::skim(user_reviews)
#DataExplorer::create_report(user_reviews)


#Following code will be used to remove the URL, punctuation symbols, digits, the word restaurant
user_reviews$Review <- gsub("http\\S+\\s*|[[:punct:]]|[[:digit:]]| $|restaurant|bar|food|^ ","", user_reviews$Review) 


# creating 30 subsets to represent the selected 30 restaurants
restaurant1<-subset(user_reviews,Hotel.Restaurant.name=="2gether Restaurant")
restaurant2<-subset(user_reviews,Hotel.Restaurant.name=="3 Spices Restaurant")
restaurant3<-subset(user_reviews,Hotel.Restaurant.name=="Acqua Restaurant")
restaurant4<-subset(user_reviews,Hotel.Restaurant.name=="Ali Baba Restaurant")
restaurant5<-subset(user_reviews,Hotel.Restaurant.name=="Ann Restaurant")
restaurant6<-subset(user_reviews,Hotel.Restaurant.name=="Arabia Restaurant")
restaurant7<-subset(user_reviews,Hotel.Restaurant.name=="Archee Restaurant")
restaurant8<-subset(user_reviews,Hotel.Restaurant.name=="Audy Restaurant")
restaurant9<-subset(user_reviews,Hotel.Restaurant.name=="Baan Noy Restaurant")
restaurant10<-subset(user_reviews,Hotel.Restaurant.name=="Baan Ra Tree Restaurant")
restaurant11<-subset(user_reviews,Hotel.Restaurant.name=="Baan Sailom Restaurant")
restaurant12<-subset(user_reviews,Hotel.Restaurant.name=="Baluchi Restaurant")
restaurant13<-subset(user_reviews,Hotel.Restaurant.name=="Bella Vista Restaurant")
restaurant14<-subset(user_reviews,Hotel.Restaurant.name=="B-Hive Gallery, Bar and Restaurant")
restaurant15<-subset(user_reviews,Hotel.Restaurant.name=="Bianconero da Tuveri Restaurant & Pizzeria")
restaurant16<-subset(user_reviews,Hotel.Restaurant.name=="Bob's Restaurant & Bar")
restaurant17<-subset(user_reviews,Hotel.Restaurant.name=="Bubbles Restaurant")
restaurant18<-subset(user_reviews,Hotel.Restaurant.name=="Bucintoro Pizzeria-Ristorante")
restaurant19<-subset(user_reviews,Hotel.Restaurant.name=="Cafe 101 Bar & Restaurant")
restaurant20<-subset(user_reviews,Hotel.Restaurant.name=="Cairo Restaurant")
restaurant21<-subset(user_reviews,Hotel.Restaurant.name=="Capri Noi Restaurant")
restaurant22<-subset(user_reviews,Hotel.Restaurant.name=="Capri Restaurant & Bar")
restaurant23<-subset(user_reviews,Hotel.Restaurant.name=="Chai Thaifood Restaurant")
restaurant24<-subset(user_reviews,Hotel.Restaurant.name=="Charm Thai Restaurant at Holiday Inn Resort")
restaurant25<-subset(user_reviews,Hotel.Restaurant.name=="Chekhoff Restaurant and Bar")
restaurant26<-subset(user_reviews,Hotel.Restaurant.name=="COCONUT Bar & Restaurant - Rawai Beach")
restaurant27<-subset(user_reviews,Hotel.Restaurant.name=="Coral Restaurant")
restaurant28<-subset(user_reviews,Hotel.Restaurant.name=="Curry Delight Indian Restaurant")
restaurant29<-subset(user_reviews,Hotel.Restaurant.name=="Curry Night Indian Restaurant")
restaurant30<-subset(user_reviews,Hotel.Restaurant.name=="D Restaurant")

#Selecting the review column to create the text vector for each subset
restaurant1_review<-restaurant1$Review
restaurant2_review<-restaurant2$Review
restaurant3_review<-restaurant3$Review
restaurant4_review<-restaurant4$Review
restaurant5_review<-restaurant5$Review
restaurant6_review<-restaurant6$Review
restaurant7_review<-restaurant7$Review
restaurant8_review<-restaurant8$Review
restaurant9_review<-restaurant9$Review
restaurant10_review<-restaurant10$Review
restaurant11_review<-restaurant11$Review
restaurant12_review<-restaurant12$Review
restaurant13_review<-restaurant13$Review
restaurant14_review<-restaurant14$Review
restaurant15_review<-restaurant15$Review
restaurant16_review<-restaurant16$Review
restaurant17_review<-restaurant17$Review
restaurant18_review<-restaurant18$Review
restaurant19_review<-restaurant19$Review
restaurant20_review<-restaurant20$Review
restaurant21_review<-restaurant21$Review
restaurant22_review<-restaurant22$Review
restaurant23_review<-restaurant23$Review
restaurant24_review<-restaurant24$Review
restaurant25_review<-restaurant25$Review
restaurant26_review<-restaurant26$Review
restaurant27_review<-restaurant27$Review
restaurant28_review<-restaurant28$Review
restaurant29_review<-restaurant29$Review
restaurant30_review<-restaurant30$Review



#Changing all upper case letters into lower case
restaurant1_review<-tolower(restaurant1_review)
restaurant2_review<-tolower(restaurant2_review)
restaurant3_review<-tolower(restaurant3_review)
restaurant4_review<-tolower(restaurant4_review)
restaurant5_review<-tolower(restaurant5_review)
restaurant6_review<-tolower(restaurant6_review)
restaurant7_review<-tolower(restaurant7_review)
restaurant8_review<-tolower(restaurant8_review)
restaurant9_review<-tolower(restaurant9_review)
restaurant10_review<-tolower(restaurant10_review)
restaurant11_review<-tolower(restaurant11_review)
restaurant12_review<-tolower(restaurant12_review)
restaurant13_review<-tolower(restaurant13_review)
restaurant14_review<-tolower(restaurant14_review)
restaurant15_review<-tolower(restaurant15_review)
restaurant16_review<-tolower(restaurant16_review)
restaurant17_review<-tolower(restaurant17_review)
restaurant18_review<-tolower(restaurant18_review)
restaurant19_review<-tolower(restaurant19_review)
restaurant20_review<-tolower(restaurant20_review)
restaurant21_review<-tolower(restaurant21_review)
restaurant22_review<-tolower(restaurant22_review)
restaurant23_review<-tolower(restaurant23_review)
restaurant24_review<-tolower(restaurant24_review)
restaurant25_review<-tolower(restaurant25_review)
restaurant26_review<-tolower(restaurant26_review)
restaurant27_review<-tolower(restaurant27_review)
restaurant28_review<-tolower(restaurant28_review)
restaurant29_review<-tolower(restaurant29_review)
restaurant30_review<-tolower(restaurant30_review)




# Apply the function (corpusFun) which covert the reviews into a corpus then stem the words, load the positive and negative
#lexicon, then calculate the postitive and negative reviews after generating the cloud word

corp_restuarnt1<- corpusFun(review_vector = restaurant1_review)
corp_restuarnt2<- corpusFun(review_vector = restaurant2_review)
corp_restuarnt3<- corpusFun(review_vector = restaurant3_review)
corp_restuarnt4<- corpusFun(review_vector = restaurant4_review)
corp_restuarnt5<- corpusFun(review_vector = restaurant5_review)
corp_restuarnt6<- corpusFun(review_vector = restaurant6_review)
corp_restuarnt7<- corpusFun(review_vector = restaurant7_review)
corp_restuarnt8<- corpusFun(review_vector = restaurant8_review)
corp_restuarnt9<- corpusFun(review_vector = restaurant9_review)
corp_restuarnt10<- corpusFun(review_vector = restaurant10_review)
corp_restuarnt11<- corpusFun(review_vector = restaurant11_review)
corp_restuarnt12<- corpusFun(review_vector = restaurant12_review)
corp_restuarnt13<- corpusFun(review_vector = restaurant13_review)
corp_restuarnt14<- corpusFun(review_vector = restaurant14_review)
corp_restuarnt15<- corpusFun(review_vector = restaurant15_review)
corp_restuarnt16<- corpusFun(review_vector = restaurant16_review)
corp_restuarnt17<- corpusFun(review_vector = restaurant17_review)
corp_restuarnt18<- corpusFun(review_vector = restaurant18_review)
corp_restuarnt19<- corpusFun(review_vector = restaurant19_review)
corp_restuarnt20<- corpusFun(review_vector = restaurant20_review)
corp_restuarnt21<- corpusFun(review_vector = restaurant21_review)
corp_restuarnt22<- corpusFun(review_vector = restaurant22_review)
corp_restuarnt23<- corpusFun(review_vector = restaurant23_review)
corp_restuarnt24<- corpusFun(review_vector = restaurant24_review)
corp_restuarnt25<- corpusFun(review_vector = restaurant25_review)
corp_restuarnt26<- corpusFun(review_vector = restaurant26_review)
corp_restuarnt27<- corpusFun(review_vector = restaurant27_review)
corp_restuarnt28<- corpusFun(review_vector = restaurant28_review)
corp_restuarnt29<- corpusFun(review_vector = restaurant29_review)
corp_restuarnt30<- corpusFun(review_vector = restaurant30_review)


