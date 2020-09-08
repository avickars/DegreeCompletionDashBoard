library(tidyverse)

numStudents <- 2000

majors <- c("Computing Science Major", "Buisiness and Computing Science Joint Major", "Software Engineering Major", "Computing Science and Mathematics Joint Major")
majors <-  sample(majors, numStudents, replace = TRUE)

terms_to_comp_elapsed <- round(rnorm(numStudents, mean = 16))

num_coop_terms <- c(0,1,2,3,4)
num_coop_terms <- sample(num_coop_terms, numStudents, replace = TRUE)

comp_gpa <- rnorm(numStudents, mean = 3.0)
for (i in c(1:numStudents)) {
  if (comp_gpa[[i]] > 4.33) {
    comp_gpa[[i]] = 4.33
  }
  
  if (comp_gpa[[i]] < 2.00) {
    comp_gpa[[i]] = 2.00
  }
}

avg_units_per_term <- rnorm(numStudents, mean = 11)

basis_of_admission <- c("Secondary", "Post-Secondary", "Other")
basis_of_admission <- sample(basis_of_admission, numStudents, replace = TRUE)

comp_acad_yr <- c("2004/05","2005/06","2006/07","2007/08","2008/09","2009/10","2010/11","2011/12","2013/14","2014/15","2015/16","2016/17","2017/18","2018/19")
comp_acad_yr <- sample(comp_acad_yr, numStudents, replace = TRUE)

data <- tibble(terms_to_comp_elapsed, majors, num_coop_terms,comp_gpa, comp_acad_yr, basis_of_admission, avg_units_per_term)


write_csv(data,path = "/home/aidan/Documents/GitRepositories/DegreeCompletionDashBoard/dataCSUG.csv")

