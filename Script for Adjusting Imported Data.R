library(tidyverse)
library(ggplot2)

summary(X2005_2006)
str(X2012_2013)

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

