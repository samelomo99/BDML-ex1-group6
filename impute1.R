# IMputing the missing values with the median
db <- db  %>%
  mutate(ingtot = ifelse(is.na(ingtot) == TRUE, median(db$ingtot, na.rm = TRUE) , ingtot))
## get missing values
is.na(db$y_salary_m) %>% table()
## replace values:
db %>% select(directorio,y_salary_m) %>% tail()
db = db %>% 
     group_by(directorio) %>% 
     mutate(mean_y_salary_m = mean(y_salary_m,na.rm=T))

db %>% select(directorio,y_salary_m,mean_y_salary_m) %>% tail()
db = db %>%
     mutate(y_salary_m = ifelse(test = is.na(y_salary_m)==T,
                               yes = mean_y_salary_m,
                               no = y_salary_m))

db %>% select(directorio,y_salary_m,mean_y_salary_m) %>% tail()
