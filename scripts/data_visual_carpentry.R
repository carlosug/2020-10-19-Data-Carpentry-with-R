#============== INPUTS ==================#
# load the file
interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

# ============ INTRO TO PLOT WITH GGPLOT2 ================= #

# the code for plotting
interviews_plotting %>% 
  ggplot()

# add arguments
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y =number_items)) +
  geom_point()

# this will not work
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y =number_items)) 
+  geom_point()

# my first plot
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y =number_items)) +
  geom_point()
# ============= OVERPLOTTING ISSUES =========== #
# 1. Change the transparency of the points
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.2)

# 2. Use the geom_jitter() == moving the data points
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              width = 0.2,
              height = 0.2)
# adding colors
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              width = 0.2,
              height = 0.2,
              color = "pink")

# color points by the village of the obs
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(aes(color = village),
              alpha = 0.5,
              width = 0.2,
              height = 0.2)

# geom_count() 

interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items, color = village)) +
  geom_count()


# Exercise 2: create a scatter plot
# of rooms by village with the respondent_wall_type

# solution exercise 2
interviews_plotting %>% 
  ggplot(aes(x = village, y = rooms)) +
  geom_jitter(aes(color = respondent_wall_type),
              alpha = 0.5,
              width = 0.2,
              height = 0.2)

# ============================= BOXPLOT ==================#
# first boxplot
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot()
# adding the points to the boxplot
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.5,
              color = "tomato",
              width = 0.2,
              height = 0.2)

# Exercise 3


# a. violin plot
# answer Rodrigo
interviews %>%
  ggplot(aes(x = respondent_wall_type, y = rooms))+
  geom_violin(alpha = 0)+
  geom_jitter(alpha = 0.5,
              color = "blue",
              width = 0.2,
              height = 0.2)

# b. another variable liv_count

# Veronika answer:
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type, y = liv_count)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.5,   # add points
              color = "steel blue",
              width = 0.2, 
              height = 0.2)

# add colour to the data points on veronika boxplot
# according to the respondent e.g. whether or not is
# member of an irrigation association (memb_assoc)

interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type, y = liv_count)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(aes(color = memb_assoc),
              alpha = 0.5,
              width = 0.2,
              height = 0.2)


# ================== BARPLOTS ====================== #

# freq plot
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type)) +
  geom_bar()

# by village
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type)) +
  geom_bar(aes(fill = village))

# side-by-side plot
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type)) +
  geom_bar(aes(fill = village),position = "dodge")

# create proportion of each housing type in each village graph
percent_wall_type <- interviews_plotting %>% 
  filter(respondent_wall_type != "cement") %>% 
  count(village, respondent_wall_type) %>% 
  group_by(village) %>% 
  mutate(percent = (n /sum(n)) * 100) %>% 
  ungroup()
percent_wall_type

percent_wall_type %>% 
  ggplot(aes(x = village, y = percent,
             fill = respondent_wall_type)) +
  geom_bar(stat = "identity", position = "dodge")











