base_url <- "http://api.nytimes.com/svc/movies/v2/reviews/picks"
response_format <-"json"
api_key <- "8cf79f3353f439b9af033db83ab98d78%3A13%3A73314805"

url <- sprintf("%s.%s?api-key=%s", base_url, response_format, api_key)
j <- fromJSON(url)
length(j$results)
str(j$results)

h <- data.frame(matrix(j$results))

t <- do.call(rbind,j$results)
class(t)
k <- data.frame(t)
unlist(j$results)
class(h) 
dim(k)
View(k)
t <- j$results[1]
 class(t)
 length(t)
colnames(t)
attributes(t)
names(j$results)
js <- sapply(j$results, unlist) 
ja <- do.call("rbind",js)
class(js)
View(js)
require(reshape2)
melt(js)
colnames(j[1])
?dim
