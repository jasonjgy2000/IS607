library(XML)
library(RJSONIO)
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
data_set.vec <- unlist(t, recursive = TRUE, use.names = TRUE)
t.vec
t.vec[str_detect(names(t.vec), "books.Title")]
sapply(t.vec[[1]], "[[", "books.Year_Published")
t[[1]][[1]][["Title"]]
str(sapply(t[[1]], "[[", "Year_Published"))
data_set.unlist <- sapply(t[[1]],unlist)
str(t.unlist)

data_set.df <- do.call("rbind.fill",lapply(lapply(data_set.unlist, t), data.frame,stringsAsFactors=FALSE))

data_set.df <- do.call("rbind", lapply(data_set, data.frame,stringsAsFactors = FALSE))
View(data_set.df)

