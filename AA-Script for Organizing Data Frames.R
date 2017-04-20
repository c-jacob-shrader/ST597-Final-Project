# This script loads the packages and data we'll need for the analyis. 

library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Seasons <- c(X2000_2001, X2001_2002, X2002_2003, X2003_2004, X2004_2005, X2005_2006, 
#             X2006_2007, X2007_2008, X2008_2009, X2009_2010, X2010_2011, X2011_2012, 
#            X2012_2013, X2013_2014, X2014_2015)
#save(Seasons, file = 'Seasons.RData')
#
#Seasons_Adjusted <- c(OO5_OO6_adjusted, OO6_OO7_adjusted, OO7_OO8_adjusted, OO8_OO9_adjusted, 
#                      OO9_O10_adjusted, O10_O11_adjusted, O11_O12_adjusted, O12_O13_adjusted, 
#                      O13_O14_adjusted, O14_O15_adjusted)
#save(Seasons_Adjusted, file = 'Seasons_Adjusted.RData')
#
#Teams <- c(Arsenal, Aston_Villa, Birmingham, Blackbrun, Blackpool, Bolton, 
#                 Burnley, Cardiff, Charlton, Chelsea, Crystal_Palace, Derby, Everton, 
#                 Fulham, Hull, Leicester, Liverpool, Man_United, Manchester_City, 
#                 Middlesborough, Newcastle, Norwich, Portsmouth, QPR, Reading, 
#                 Sheffield_United, Southampton, Stoke, Sunderland, Swansea, Tottenham, 
#                 Watford, West_Brom, West_Ham, Wigan, Wolves)
#save(Teams,file = 'Teams.RData') 

# This will take the raw data from each season( X2005_2006, X2006_2007, etc.)
# and break each season down into a more usable data frame for our use.

OO5_OO6_adjusted <- select(X2005_2006, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

OO6_OO7_adjusted <- select(X2006_2007, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

OO7_OO8_adjusted <- select(X2007_2008, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

OO8_OO9_adjusted <- select(X2008_2009, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

OO9_O10_adjusted <- select(X2009_2010, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

O10_O11_adjusted <- select(X2010_2011, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

O11_O12_adjusted <- select(X2011_2012, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

O12_O13_adjusted <- select(X2012_2013, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

O13_O14_adjusted <- select(X2013_2014, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

O14_O15_adjusted <- select(X2014_2015, Date, HomeTeam, FTHG, AwayTeam, FTAG, 
                           FTR, BbAvH, BbAvA)

# This script was initially used to combine each season data frame into a single 
# data frame. 

Full_Seasons <- rbind(OO5_OO6_adjusted, OO6_OO7_adjusted, OO7_OO8_adjusted, 
                      OO8_OO9_adjusted, OO9_O10_adjusted, O10_O11_adjusted, 
                      O11_O12_adjusted, O12_O13_adjusted, O13_O14_adjusted, 
                      O14_O15_adjusted)

# Script shows Premier League teams who played in any season from 2005-2015 
# and how many games played.

Teams <- Full_Seasons %>% 
  group_by(HomeTeam) %>% 
  summarise(count = n() * 2) %>%
  arrange(desc(count))

# Script combines data frames for each team across seasons.

Arsenal <- filter(Full_Seasons, HomeTeam == 'Arsenal' | AwayTeam == 'Arsenal') %>%
  group_by(Date)

Aston_Villa <- filter(Full_Seasons, HomeTeam == 'Aston Villa' | AwayTeam == 'Aston Villa') %>%
  group_by(Date)

Chelsea <- filter(Full_Seasons, HomeTeam == 'Chelsea' | AwayTeam == 'Chelsea') %>%
  group_by(Date)

Everton <- filter(Full_Seasons, HomeTeam == 'Everton' | AwayTeam == 'Everton') %>%
  group_by(Date)

Liverpool <- filter(Full_Seasons, HomeTeam == 'Liverpool' | AwayTeam == 'Liverpool') %>%
  group_by(Date)

Manchester_City <- filter(Full_Seasons, HomeTeam == 'Man City' | AwayTeam == 'Man City') %>%
  group_by(Date)

Man_United <- filter(Full_Seasons, HomeTeam == 'Man United' | AwayTeam == 'Man United') %>%
  group_by(Date)

Tottenham <- filter(Full_Seasons, HomeTeam == 'Tottenham' | AwayTeam == 'Tottenham') %>%
  group_by(Date)

Fulham <- filter(Full_Seasons, HomeTeam == 'Fulham' | AwayTeam == 'Fulham') %>%
  group_by(Date)

Newcastle <- filter(Full_Seasons, HomeTeam == 'Newcastle' | AwayTeam == 'Newcastle') %>%
  group_by(Date)

Sunderland <- filter(Full_Seasons, HomeTeam == 'Sunderland' | AwayTeam == 'Sunderland') %>%
  group_by(Date)

West_Ham <- filter(Full_Seasons, HomeTeam == 'West Ham' | AwayTeam == 'West Ham') %>%
  group_by(Date)

Wigan <- filter(Full_Seasons, HomeTeam == 'Wigan' | AwayTeam == 'Wigan') %>%
  group_by(Date)

Blackbrun <- filter(Full_Seasons, HomeTeam == 'Blackburn' | AwayTeam == 'Blackburn') %>%
  group_by(Date)

Bolton <- filter(Full_Seasons, HomeTeam == 'Bolton' | AwayTeam == 'Bolton') %>%
  group_by(Date)

Stoke <- filter(Full_Seasons, HomeTeam == 'Stoke' | AwayTeam == 'Stoke') %>%
  group_by(Date)

West_Brom <- filter(Full_Seasons, HomeTeam == 'West Brom' | AwayTeam == 'West Brom') %>%
  group_by(Date)

Portsmouth <- filter(Full_Seasons, HomeTeam == 'Portsmouth' | AwayTeam == 'Portsmouth') %>%
  group_by(Date)

Birmingham <- filter(Full_Seasons, HomeTeam == 'Birmingham' | AwayTeam == 'Birmingham') %>%
  group_by(Date)

Hull <- filter(Full_Seasons, HomeTeam == 'Hull' | AwayTeam == 'Hull') %>%
  group_by(Date)

Middlesborough <- filter(Full_Seasons, HomeTeam == 'Middlesborough' | AwayTeam == 'Middlesborough') %>%
  group_by(Date)

Swansea <- filter(Full_Seasons, HomeTeam == 'Swansea' | AwayTeam == 'Swansea') %>%
  group_by(Date)

Norwich <- filter(Full_Seasons, HomeTeam == 'Norwich' | AwayTeam == 'Norwich') %>%
  group_by(Date)

QPR <- filter(Full_Seasons, HomeTeam == 'QPR' | AwayTeam == 'QPR') %>%
  group_by(Date)

Reading <- filter(Full_Seasons, HomeTeam == 'Reading' | AwayTeam == 'Reading') %>%
  group_by(Date)

Southampton <- filter(Full_Seasons, HomeTeam == 'Southampton' | AwayTeam == 'Southampton') %>%
  group_by(Date)

Wolves <- filter(Full_Seasons, HomeTeam == 'Wolves' | AwayTeam == 'Wolves') %>%
  group_by(Date)

Burnley <- filter(Full_Seasons, HomeTeam == 'Burnley' | AwayTeam == 'Burnley') %>%
  group_by(Date)

Charlton <- filter(Full_Seasons, HomeTeam == 'Charlton' | AwayTeam == 'Charlton') %>%
  group_by(Date)

Crystal_Palace <- filter(Full_Seasons, HomeTeam == 'Crystal Palace' | AwayTeam == 'Crystal Palace') %>%
  group_by(Date)

Blackpool <- filter(Full_Seasons, HomeTeam == 'Blackpool' | AwayTeam == 'Blackpool') %>%
  group_by(Date)

Cardiff <- filter(Full_Seasons, HomeTeam == 'Cardiff' | AwayTeam == 'Cardiff') %>%
  group_by(Date)

Derby <- filter(Full_Seasons, HomeTeam == 'Derby' | AwayTeam == 'Derby') %>%
  group_by(Date)

Leicester <- filter(Full_Seasons, HomeTeam == 'Leicester' | AwayTeam == 'Leicester') %>%
  group_by(Date)

Sheffield_United  <- filter(Full_Seasons, HomeTeam == 'Sheffield United' | AwayTeam == 'Sheffield United') %>%
  group_by(Date)

Watford <- filter(Full_Seasons, HomeTeam == 'Watford' | AwayTeam == 'Watford') %>%
  group_by(Date)
