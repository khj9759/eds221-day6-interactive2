#---------section1: filter --------------#

library(tidyverse)
library(palmerpenguins)
library(lterdatasampler)

# look for an exact match: ==

penguins_biscoe <- penguins %>% filter(island == "Biscoe")

penguins_2007 <- penguins %>% filter(year == 2007)

adelie_torgersen <- penguins %>% filter(species = "Adelie" & island == "Torgersen")
 #Alternatives : penguins %>% filter (species == "Adelie, island == "Torgersen")

# create a subset from penguins that only contains Gentoo penguins observed in 2008.
gentoo_penguins <- penguins %>% filter(species == "Gentoo" & year == 2008)

# Create subset that Gentoo and Adelies
gentoo_adelie <- penguins %>% filter (species == "Gentoo" | species == "Adelie")

# create subset that contains overvation where the island is Dream or the year is 2009
dream_2009 <- penguins %>% filter(island == "Dream" | year == 2009)

# Make a ggplot chart of water temperature v. crab size:
ggplot(pie_crab, aes(x=water_temp, y=size)) +
  geom_point()

# keep obsevations for
pie_crab %>% filter (site == "NIB" | site == "ZI" | site == "DB" |site == "JC")

# we can use the %in% operator to ask : does the value in our column match ANY of the value IN this vector?

pie_site <- pie_crab %>% filter (site %in% c("NIB", "ZI", "DB", "JC"))

# Run a line of code in the Console to confirm that only the sites above remain in the new subset you created

sites <- c("CC", "BB", "PIE")
pie_sites_2 <- pie_crab %>% filter (site %in% sites)

# create a subset using in the %in% operator that includes sites PIE, ZI, NIB, BB and CC
most_site <- pie_crab %>% filter (site %in% c("PIE", "ZI", "NIB", "BB", "CC"))

# excluding filter statements
# != (asks is that NOT EQUAL to that value)?
exclude_zi <- pie_crab %>% filter(site != "ZI")

# what if I want to exclude sites "BB", "CC", and "PIE".
exclude_bb_cc_pie <- pie_crab %>% filter(!site %in% c("BB", "CC", "PIE"))

# Create a subset from pie_crab that only contains observations from NIB, CC, and ZI, for crabs with carapace size exceeding 13.

site_nib_cc_zi_over13 <- pie_crab %>% filter(site %in% c("NIB", "CC", "ZI"), size >13)

# -----------------selecting column------------------#

#select individual columns by name, seperate them by a comma
crabs_subset <- pie_crab %>% select (latitude, size, water_temp)

#select a range of columns using :
crabs_subset2 <- pie_crab %>% select (site:air_temp)

# select a range and an individual column
crabs_subset3 <- pie_crab %>% select (date:water_temp, name)

# reoder the columns
crabs_subset4 <- pie_crab %>% select(name, water_temp, size)

#---------------Mutate------------------------#

#use dplyr::mutate() to add or update a column, while keeping all existing columns
crabs_cm <- pie_crab %>%
  mutate(size_cm = size / 10 )

# what happens if I use mutate to add a new columns containing the mean of the size column?
crabs_mean <- pie_crab %>%
  mutate(mean_size = mean(size, na.rm=TRUE))

crab_awesome <- pie_crab %>%
  mutate(name = "Teddy is awesome")

# reminder : group_by+summarize
mean_size_by_site <- pie_crab %>%
  group_by(site) %>%
  summarize(mean_size = mean(size, na.rm=TRUE),
            sd_size = sd(size,na.rm=TRUE))

# what about a group_by then mutate?
group_mutate <- pie_crab %>%
  group_by(site) %>%
  mutate(mean_size = mean(size, na.rm=TRUE))


penguins %>%
  group_by(species, island) %>%
  summarize(mean_body_mass = mean (body_mass_g, na.rm = TRUE))

# what if I want to create a new column in pie_crab that contains "giant" if the size is greater than 20, or "not giant" if the size is less than or equal to 35?

# use dplyr::case_when() to write if else satements more easily.

crabs_bin <- pie_crab %>%
  mutate(size_binned = case_when(
    size >20 ~ "giant",
    size <= 20 ~ "not giant"))

site_binned <- pie_crab %>%
  mutate(region = case_when
         (site %in% c("ZI", "CC", "PIE") ~ "Low",
          site %in% c("BB", "NIB") ~ "Middle",
          TRUE ~ "High"))

# .default = "High"
