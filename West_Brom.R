# West_Brom Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# West_Brom Home Analysis
West_Brom_Home <- West_Brom %>%
  filter(HomeTeam == 'West Brom')
West_BromHomeGames <- nrow(West_Brom_Home)
West_BromHomeGames
 
# West_Brom Home Wins
West_Brom_Home_Wins <- West_Brom %>%
  filter(HomeTeam == 'West Brom' && FTR == 'H')
West_BromHomeWins <- nrow(West_Brom_Home_Wins)
West_BromHomeWins

West_BromHomeWinPayout <- mean(West_Brom_Home_Wins$BbAvH)
West_BromHomeWinPayout

# West_Brom Home Losses
West_Brom_Home_Losses <- West_Brom %>%
  filter(HomeTeam == 'West Brom' && FTR == 'A')
West_BromHomeLosses <- nrow(West_Brom_Home_Losses)
West_BromHomeLosses

West_BromHomeLossPayout <- mean(West_Brom_Home_Losses$BbAvH)
West_BromHomeLossPayout

West_BromOpponentHomePayout <- mean(West_Brom_Home_Losses$BbAvA)
West_BromOpponentHomePayout

# West_Brom Away Analysis
West_Brom_Away <- West_Brom %>%
  filter(AwayTeam == 'West Brom')
West_BromAwayGames <- nrow(West_Brom_Away)
West_BromAwayGames

# West_Brom Away Wins
West_Brom_Away_Wins <- West_Brom %>%
  filter(AwayTeam == 'West Brom' && FTR == 'A')
West_BromAwayWins <- nrow(West_Brom_Away_Wins)
West_BromAwayWins

West_BromAwayWinPayout <- mean(West_Brom_Away_Wins$BbAvA)
West_BromAwayWinPayout

# West_Brom Away Losses
West_Brom_Away_Losses <- West_Brom %>%
  filter(AwayTeam == 'West Brom' && FTR == 'H')
West_BromAwayLosses <- nrow(West_Brom_Home_Losses)
West_BromAwayLosses

West_BromAwayLossPayout <- mean(West_Brom_Away_Losses$BbAvA)
West_BromAwayLossPayout

West_BromOpponentAwayPayout <- mean(West_Brom_Away_Wins$BbAvH)
West_BromOpponentAwayPayout

# West_Brom Home Draws
West_Brom_Home_Draws <- West_Brom %>%
  filter(HomeTeam == 'West Brom' && FTR == 'D')
West_BromHomeDraws <- nrow(West_Brom_Home_Draws)
West_BromHomeDraws

# West_Brom Away Draws
West_Brom_Away_Draws <- West_Brom %>%
  filter(AwayTeam == 'West Brom' && FTR == 'D')
West_BromAwayDraws <- nrow(West_Brom_Away_Draws)
West_BromAwayDraws

# West_Brom Record
West_BromWins <- West_BromHomeWins + West_BromAwayWins
West_BromWins

West_BromLosses <- West_BromHomeLosses + West_BromAwayLosses
West_BromLosses

West_BromDraws <- West_BromHomeDraws + West_BromAwayDraws
West_BromDraws

#WDL
West_BromOverallRecord <- paste(West_BromWins, West_BromDraws, West_BromLosses, sep = "-")
West_BromHomeRecord <- paste(West_BromHomeWins, West_BromHomeDraws, West_BromHomeLosses, 
                           sep = "-")
West_BromAwayRecord <- paste(West_BromAwayWins, West_BromAwayDraws, West_BromAwayLosses, 
                           sep = "-")
# Overall Record
West_BromOverallRecord

# Home Record + Data
West_BromHomeRecord
West_BromHomeWinPayout
West_BromOpponentHomePayout

# Away Record + Data
West_BromAwayRecord
West_BromAwayWinPayout
West_BromOpponentAwayPayout

# Payout Betting Purely on West_Brom Winning at Home
West_BromHomeBetting <- West_BromHomeWins*(West_BromHomeWinPayout-1) - 
  West_BromHomeDraws - West_BromHomeLosses
West_BromHomeBetting

# Payout Betting Purely on West_Brom Winning Away
West_BromAwayBetting <- West_BromAwayWins*(West_BromAwayWinPayout-1) - 
  West_BromAwayDraws - West_BromAwayLosses
West_BromAwayBetting

West_BromWinnings <- West_BromHomeBetting + West_BromAwayBetting
West_BromWinnings