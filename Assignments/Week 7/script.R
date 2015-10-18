library(XML)
library(RJSONIO)
install.packages("RJSONIO")
b <- readHTMLTable("books.html")
View(b)

x <- xmlParse("books.xml")
class(x)
root <- xmlRoot(x)
xmlName(root)
xmlSize(xmlRoot(x))
root[["book"]][[1]][[1]]
xDFrame <- xmlToDataFrame(root)
View(xDFrame)

library(stringr)
library(plyr)
install.packages("RJSONIO")
isValidJSON("books.json")
data_set <- fromJSON("books.json")
str(data_set.vec)
data_set.vec <- unlist(data_set, recursive = TRUE, use.names = TRUE)
data_set.unlist <- sapply(data_set[[1]], unlist) 
data_set.vec[str_detect(names(data_set.vec), "Title")]

t <- do.call("rbind",data_set.unlist)
View(t)

sapply(data_set.vec[[1]], "[[", "books.Year_Published")
data_set[[1]][[1]][["Title"]]
sapply(data_set[[1]], "[[", "Year_Published")
data_set.unlist <- sapply(t[[1]],unlist)
str(t.unlist)

data_set.df <- do.call("rbind.fill",lapply(lapply(data_set.unlist, t), data.frame,stringsAsFactors=FALSE))

data_set.df <- do.call("rbind", lapply(data_set, data.frame,stringsAsFactors = FALSE))
View(data_set)

