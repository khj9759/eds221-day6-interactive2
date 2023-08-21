#---------section1: filter --------------#

library(tidyverse)
library(palmerpenguins)
library(lterdatasampler)

# look for an exact match: ==

penguins_biscoe <- penguins %>% filter(island == "Biscoe")

penguins_2007 <- penguins %>% filter(year == 2007)

adelie_torgersen <- penguins $>$ filter(species = "Adelie" & island == "Torgersen")
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
