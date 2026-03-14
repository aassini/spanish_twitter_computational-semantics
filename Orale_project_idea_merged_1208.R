#setwd("/Users/SanchoPanza/Documents/collect_orale")
source("TwitteR")

library(twitteR)

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

api_key <- "iU1prIONKJ7vJod3SYObe8CAB"
api_secret <- "WYBom7f9njvmZA3MDdxhKJm05kr2Jl3s9xcpIwYW8cZY5fw71e"
access_token <- "499291112-FBri31f6ylnLhu4HoqFKjs6Yfs6VuK7yFifaO2wZ"
access_token_secret <- "Lf0HpI2iCknriWoIOoF74CV8KXrZVSnyrH1g5QY3XI4zr"


#pull tweets that have órale and are in English
ABQ.EN.5 <- searchTwitter("órale", lang="en", since= "2016-10-", until="2016-10-13", geocode='35.0844900,-106.6511400, 200mi', n='10000')

head(ABQ.EN.1)

dfABQ.EN.5 <- twListToDF(ABQ.EN.5)
head(dfABQ.EN.1)

write.csv(dfABQ.EN.5, file="enABQorale5.csv")

###SPanish part
ABQ.ES.5 <- searchTwitter("órale", lang="es", since= "2016-11-03", until="2016-11-10", geocode='35.0844900,-106.6511400, 200mi', n='10000')

#maybe consolidate this??
dfABQ.ES.5 <- twListToDF(searchTwitter("órale", lang="es", since= "2016-11-03", until="2016-11-10", geocode='35.0844900,-106.6511400, 200mi', n='10000'))

#make into data frame
dfABQ.ES.5 <- twListToDF(ABQ.ES.5)

#write to csv
write.csv(dfABQ.ES.5, file="esABQorale10.csv")


#want to strip retweets or not?...need pre-processing

#pull tweets that have órale and are in Spanish

#consider in LA, Laredo? Austin? 

#LA
#Latitude: 34.0522300° 
#Longitude: -118.2436800° 
#English
LA.EN.2 <- searchTwitter("órale", lang="en", since= "2016-09-12", until="2016-09-16", geocode='34.0522300,-118.2436800, 100mi', n='1000')



dfLA.EN.2 <- twListToDF(LA.EN.2)

dfLA.ES.2 <- twListToDF(searchTwitter("órale", lang="es", since= "2016-10-20", until="2016-10-27", geocode='34.0522300,-118.2436800, 100mi', n='10000'))

write.csv(dfLA.EN.2, file="enLAorale2.csv")

#Spanish
LA.ES.3 <- searchTwitter("órale", lang="es", since= "2016-10-01", until="2016-10-07", geocode='34.0522300,-118.2436800, 100mi', n='10000')


dfLA.ES.3 <- twListToDF(LA.ES.3)

dfLA.ES.2 <- twListToDF(searchTwitter("órale", lang="es", since= "2016-11-03", until="2016-11-10", geocode='34.0522300,-118.2436800, 100mi', n='10000'))

write.csv(dfLA.ES.2, file="esLAorale11.csv")



##SAN ANTONIO
#English
SA.EN.2 <- searchTwitter("órale", lang="en", since= "2016-09-16", until="2016-09-23", geocode='29.424122,-98.493629, 200mi', n='10000')



dfSA.EN.2 <- twListToDF(SA.EN.2)

write.csv(dfSA.EN.2, file="enSAorale4.csv")

#Spanish
SA.ES.2 <- searchTwitter("órale", lang="es", since= "2016-10-01", until="2016-10-07", geocode='34.0522300,-118.2436800, 100mi', n='10000')


dfSA.ES.2 <- twListToDF(searchTwitter("órale", lang="es", since= "2016-11-03", until="2016-11-10", geocode='34.0522300,-118.2436800, 100mi', n='10000'))

dfSA.ES.2 <- twListToDF(SA.ES.2)


write.csv(dfSA.ES.2, file="esSAorale11.csv")

#World EN

WORLD.EN.1 <- searchTwitter("órale", lang="en", since= "2016-09-14", until="2016-09-20", n='20000')

head(ABQ.EN.1)

dfWORLD.EN.1 <- twListToDF(WORLD.EN.1)
head(dfWORLD.EN.1)

write.csv(dfWORLD.EN.1, file="enWORLDorale1.csv")

##### Districto Federal-Mexico

19.432608, -99.133209

DF.ES.1 <- searchTwitter("órale", lang="es", since= "2016-11-03", until="2016-11-03", geocode='19.4326077, -99.13320799999997, 500mi', n='10000')

dfDF.ES.1 <- twListToDF(DF.ES.1)
write.csv(dfDF.ES.1, file="esDForale1.csv")

######## merging data frames of San Antonio
> SA1 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale1.csv", header = TRUE)
> SA2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale2.csv", header = TRUE)
> SA2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale3.csv", header = TRUE)
> SA2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale3.csv", header = TRUE)
> 
> SA2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale2.csv", header = TRUE)
> SA3 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale3.csv", header = TRUE)
> SA4 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale4.csv", header = TRUE)
> SA5 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale5.csv", header = TRUE)
> SA6 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale6.csv", header = TRUE)
> SA8 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale8.csv", header = TRUE)
> SA9 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/San Antonio/Spanish/esSAorale9.csv", header = TRUE)
> SA.master.df <- rbind(SA1, SA2, SA3, SA4, SA5, SA6, SA8, SA9)
> dimensions(SA.master.df)
Error: could not find function "dimensions"
> dim(SA.master.df)
[1] 50200    17
> write.csv(SA.master.df, file="esSAoraleMaster.csv")



#####ABQ
ABQ1 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale1.csv", header = TRUE)
ABQ2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale2.csv", header = TRUE)
ABQ3 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale4.csv", header = TRUE)
ABQ4 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale5.csv", header = TRUE)
ABQ5 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale6.csv", header = TRUE)
ABQ6 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale8.csv", header = TRUE)
ABQ8 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/ABQ/Spanish/esABQorale8.csv", header = TRUE)

ABQ.master.df <- rbind(ABQ1, ABQ2, ABQ3, ABQ4, ABQ5, ABQ6)

write.csv(ABQ.master.df, file="esABQoraleMaster.csv")
dim(ABQ.master.df)
[1] 27079    17

########LA
LA1 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale1.csv", header = TRUE)
LA2 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale2.csv", header = TRUE)
LA3 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale3.csv", header = TRUE)
LA4 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale4.csv", header = TRUE)
LA5 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale5.csv", header = TRUE)
LA6 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale6.csv", header = TRUE)
LA7 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale7.csv", header = TRUE)
LA8 <- read.csv("/Users/SanchoPanza/Documents/collect_orale/LA/Spanish/esLAorale9.csv", header = TRUE)

LA.master.df <- rbind(LA1, LA2, LA3, LA4, LA5, LA6, LA7, LA8)

write.csv(LA.master.df, file="esLAoraleMaster.csv")
dim(LA.master.df)
[1] 27079    17


setwd("/Users/SanchoPanza/Documents/collect_orale/run/")

abq.data.1 <- read.csv("esABQ_newmaster.csv", header= TRUE)
abq_text <- abq.data$text

special_string= "¡¿"

library(stringr)
library(stringi)

process_text <- function(sentences){
	#sentences <- str_replace_all(sentences,"[^[:punct:]]", " ")
	#sentences <- str_replace_all(sentences,"[^[:alnum:]]", " ")
	sentences <- str_replace_all(sentences,"[^[:graph:]]", " ")
	sentences <- gsub("@\\S+", "", sentences)
	sentences <- gsub("RT", "", sentences)
	#sentences <- gsub("\\p{So}|\\P{Cn}", "", sentences, perl=TRUE)
	sentences <- gsub("https:\\S+", "", sentences)
	sentences <- tolower(sentences)
	sentences <- stri_trans_general(sentences, "Latin-ASCII")
	#sentences <- as.character(sentences)
	sentences <- strsplit(as.character(sentences), "[^A-Za-z']+")
return(sentences)
}

abq.test.data <- process_text(abq_text)
abq.data$text <-process_text(abq.data$text)


paste(unlist(abq.test.data[1]), collapse= ' ')

abq.test <- paste(lapply(abq.test.data, unlist), collapse=" ")

head(abq.test)

prepare_for_export <- function(sentences){
	for (i in 1:length(sentences)){
		new_sentence <- paste(unlist(sentences[i]), collapse= " ")
		new_data <- new_data[new_sentence]
	return(new_data)
	}
}
#this worked for converting and cleaning the data: now to figure out how to export
testlist <- list()
prepare_for_export <- function(sentences){
	for (i in 1:length(sentences)){
		sentences[i] <- paste(unlist(sentences[i]), collapse= " ")
		testlist <- append(testlist, list(sentences[i]))
	}
	return(testlist)
}
# bitches <- this works
prepare_for_export_test <- function(sentences){
	for (i in 1:length(sentences)){
		sentences[i] <- paste(unlist(sentences[i]), collapse= " ")
		#testlist <- append(testlist, list(sentences[i]))
	}
	return(sentences)
}

abq.df <- data.frame(prepare_for_export(abq.test.data))

for (i in 1:length(abq.test.data)){
	abq.test.data[i] <- paste(unlist(sentences[i]), collapse= " "))
}


head(abq.test.data)

type(abq.test.data)

####PREPROCESSING

setwd("/Users/SanchoPanza/Documents/collect_orale/run/")

abq.data <- read.csv("esABQ_newmaster.csv", header= TRUE)

special_string= "¡¿"

library(stringr)
library(stringi)

process_text <- function(sentences){
	#sentences <- str_replace_all(sentences,"[^[:punct:]]", " ")
	#sentences <- str_replace_all(sentences,"[^[:alnum:]]", " ")
	sentences <- str_replace_all(sentences,"[^[:graph:]]", " ")
	sentences <- gsub("@\\S+", "", sentences)
	sentences <- gsub("RT", "", sentences)
	#sentences <- gsub("\\p{So}|\\P{Cn}", "", sentences, perl=TRUE)
	sentences <- gsub("https:\\S+", "", sentences)
	sentences <- tolower(sentences)
	sentences <- stri_trans_general(sentences, "Latin-ASCII")
	#sentences <- as.character(sentences)
	sentences <- strsplit(as.character(sentences), "[^A-Za-z']+")
return(sentences)
}

abq.data$text <-process_text(abq.data$text)

prepare_for_export <- function(sentences){
	for (i in 1:length(sentences)){
		sentences[i] <- paste(unlist(sentences[i]), collapse= " ")
		#testlist <- append(testlist, list(sentences[i]))
	}
	return(sentences)
}

abq.data$text <- prepare_for_export(abq.data$text)

abq_text_data <- as.character(abq.data$text)

write.csv(abq.data, file="ABQ_processed.csv")

###LA
la.data <- read.csv("esLA_newmaster.csv", header= TRUE)

special_string= "¡¿"

library(stringr)
library(stringi)

process_text <- function(sentences){
	#sentences <- str_replace_all(sentences,"[^[:punct:]]", " ")
	#sentences <- str_replace_all(sentences,"[^[:alnum:]]", " ")
	sentences <- str_replace_all(sentences,"[^[:graph:]]", " ")
	sentences <- gsub("@\\S+", "", sentences)
	sentences <- gsub("RT", "", sentences)
	#sentences <- gsub("\\p{So}|\\P{Cn}", "", sentences, perl=TRUE)
	sentences <- gsub("https:\\S+", "", sentences)
	sentences <- tolower(sentences)
	sentences <- stri_trans_general(sentences, "Latin-ASCII")
	#sentences <- as.character(sentences)
	sentences <- strsplit(as.character(sentences), "[^A-Za-z']+")
return(sentences)
}

la.data$text <-process_text(la.data$text)

prepare_for_export <- function(sentences){
	for (i in 1:length(sentences)){
		sentences[i] <- paste(unlist(sentences[i]), collapse= " ")
		#testlist <- append(testlist, list(sentences[i]))
	}
	return(sentences)
}

la.data$text <- prepare_for_export(la.data$text)

la.data$text <- as.character(la.data$text)

write.csv(la.data, file="LA_processed.csv")

#SA

sa.data <- read.csv("esSA_newmaster.csv", header= TRUE)

special_string= "¡¿"

library(stringr)
library(stringi)

process_text <- function(sentences){
	#sentences <- str_replace_all(sentences,"[^[:punct:]]", " ")
	#sentences <- str_replace_all(sentences,"[^[:alnum:]]", " ")
	sentences <- str_replace_all(sentences,"[^[:graph:]]", " ")
	sentences <- gsub("@\\S+", "", sentences)
	sentences <- gsub("RT", "", sentences)
	#sentences <- gsub("\\p{So}|\\P{Cn}", "", sentences, perl=TRUE)
	sentences <- gsub("https:\\S+", "", sentences)
	sentences <- tolower(sentences)
	sentences <- stri_trans_general(sentences, "Latin-ASCII")
	#sentences <- as.character(sentences)
	sentences <- strsplit(as.character(sentences), "[^A-Za-z']+")
return(sentences)
}

sa.data$text <-process_text(sa.data$text)

prepare_for_export <- function(sentences){
	for (i in 1:length(sentences)){
		sentences[i] <- paste(unlist(sentences[i]), collapse= " ")
		#testlist <- append(testlist, list(sentences[i]))
	}
	return(sentences)
}

sa.data$text <- prepare_for_export(sa.data$text)

sa.data$text <- as.character(sa.data$text)

write.csv(sa.data, file="SA_processed.csv")