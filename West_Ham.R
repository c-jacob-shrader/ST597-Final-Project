# West_Ham Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# West_Ham Home Analysis
West_Ham_Home <- West_Ham %>%
  filter(HomeTeam == 'West Ham')
West_HamHomeGames <- nrow(West_Ham_Home)
West_HamHomeGames

# West_Ham Home Wins
West_Ham_Home_Wins <- West_Ham %>%
  filter(HomeTeam == 'West Ham' && FTR == 'H')
West_HamHomeWins <- nrow(West_Ham_Home_Wins)
West_HamHomeWins

West_HamHomeWinPayout <- mean(West_Ham_Home_Wins$BbAvH)
West_HamHomeWinPayout

# West_Ham Home Losses
West_Ham_Home_Losses <- West_Ham %>%
  filter(HomeTeam == 'West Ham' && FTR == 'A')
West_HamHomeLosses <- nrow(West_Ham_Home_Losses)
West_HamHomeLosses

West_HamHomeLossPayout <- mean(West_Ham_Home_Losses$BbAvH)
West_HamHomeLossPayout

West_HamOpponentHomePayout <- mean(West_Ham_Home_Losses$BbAvA)
West_HamOpponentHomePayout

# West_Ham Away Analysis
West_Ham_Away <- West_Ham %>%
  filter(AwayTeam == 'West Ham')
West_HamAwayGames <- nrow(West_Ham_Away)
West_HamAwayGames

# West_Ham Away Wins
West_Ham_Away_Wins <- West_Ham %>%
  filter(AwayTeam == 'West Ham' && FTR == 'A')
West_HamAwayWins <- nrow(West_Ham_Away_Wins)
West_HamAwayWins

West_HamAwayWinPayout <- mean(West_Ham_Away_Wins$BbAvA)
West_HamAwayWinPayout

# West_Ham Away Losses
West_Ham_Away_Losses <- West_Ham %>%
  filter(AwayTeam == 'West Ham' && FTR == 'H')
West_HamAwayLosses <- nrow(West_Ham_Home_Losses)
West_HamAwayLosses

West_HamAwayLossPayout <- mean(West_Ham_Away_Losses$BbAvA)
West_HamAwayLossPayout

West_HamOpponentAwayPayout <- mean(West_Ham_Away_Wins$BbAvH)
West_HamOpponentAwayPayout

# West_Ham Home Draws
West_Ham_Home_Draws <- West_Ham %>%
  filter(HomeTeam == 'West Ham' && FTR == 'D')
West_HamHomeDraws <- nrow(West_Ham_Home_Draws)
West_HamHomeDraws

# West_Ham Away Draws
West_Ham_Away_Draws <- West_Ham %>%
  filter(AwayTeam == 'West Ham' && FTR == 'D')
West_HamAwayDraws <- nrow(West_Ham_Away_Draws)
West_HamAwayDraws

# West_Ham Record
West_HamWins <- West_HamHomeWins + West_HamAwayWins
West_HamWins

West_HamLosses <- West_HamHomeLosses + West_HamAwayLosses
West_HamLosses

West_HamDraws <- West_HamHomeDraws + West_HamAwayDraws
West_HamDraws

#WDL
West_HamOverallRecord <- paste(West_HamWins, West_HamDraws, West_HamLosses, sep = "-")
West_HamHomeRecord <- paste(West_HamHomeWins, West_HamHomeDraws, West_HamHomeLosses, 
                           sep = "-")
West_HamAwayRecord <- paste(West_HamAwayWins, West_HamAwayDraws, West_HamAwayLosses, 
                           sep = "-")
# Overall Record
West_HamOverallRecord

# Home Record + Data
West_HamHomeRecord
West_HamHomeWinPayout
West_HamOpponentHomePayout

# Away Record + Data
West_HamAwayRecord
West_HamAwayWinPayout
West_HamOpponentAwayPayout

# Payout Betting Purely on West_Ham Winning at Home
West_HamHomeBetting <- West_HamHomeWins*(West_HamHomeWinPayout-1) - 
  West_HamHomeDraws - West_HamHomeLosses
West_HamHomeBetting

# Payout Betting Purely on West_Ham Winning Away
West_HamAwayBetting <- West_HamAwayWins*(West_HamAwayWinPayout-1) - 
  West_HamAwayDraws - West_HamAwayLosses
West_HamAwayBetting

West_HamWinnings <- West_HamHomeBetting + West_HamAwayBetting
West_HamWinnings