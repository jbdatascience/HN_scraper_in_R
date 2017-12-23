library(rvest)

url <- 'https://news.ycombinator.com/'

?rvest::read_xml.response
content <- read_html(url)

#News Title

title <- content %>% html_nodes('a.storylink') %>% html_text()

#News Link Domain

link_domain <- content %>% html_nodes('span.sitestr') %>% html_text()

#Link Score / Upvote

score <- content %>% html_nodes('span.score') %>% html_text()

#Link Age (submission time)

age <- content %>% html_nodes('span.age') %>% html_text()

#Final Dataframe

df <- data.frame(title = title, link_domain = link_domain, score = score, age = age)

# JB - FOUTMELDING:
# Error in data.frame(title = title, link_domain = link_domain, score = score,  : 
# arguments imply differing number of rows: 30, 29
#
# age:          30 entries
# link_domain:  30 entries
# score:        29 entries <- 1 entry te weinig !
# title:        30 entries




#Naive way of extracting the entire page content with this table
#tb <- content %>% html_node('table.itemlist') %>% html_text()

# JB:
  
df1 <- data.frame(title = title, 
                  link_domain = link_domain, 
                  #score = score, 
                  age = age)
df1


