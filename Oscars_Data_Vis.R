#Michael Overman
#Oscars Data Visualization
#05/06/2026

library("tidyverse")

install.packages("openintro")
library("openintro")
oscars

winners <- oscars %>% #pipe operator
  select(!c(birth_date, birth_mo, birth_d)) %>%
  arrange(oscar_yr)

winners %>%
  group_by(award) %>%
  summarise(
    mean_age = mean(age),
    sd_age = sd(age),
    n = n()
  )

t.test(age ~ award, data = winners)

# Boxplot
ggplot(winners, aes(x = award, y = age, fill = award)) +
  geom_boxplot() +
  labs(
    title = "Age of Oscar Winners by Award Category",
    x = "Award Category",
    y = "Age at Time of Award"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Bar chart of mean age
winners %>%
  group_by(award) %>%
  summarise(mean_age = mean(age), .groups = "drop") %>%
  ggplot(aes(x = award, y = mean_age, fill = award)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Mean Age of Oscar Winners by Award Category",
    x = "Award Category",
    y = "Mean Age"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
