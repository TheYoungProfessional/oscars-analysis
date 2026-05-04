library("tidyverse")

install.packages("openintro")
library("openintro")
oscars

winners <- select(oscars, !c(birth_date, birth_mo, birth_d))
arrange(winners, oscar_yr)

#males <- groupby(winners, award)
#females <- groupby(winners, award)
