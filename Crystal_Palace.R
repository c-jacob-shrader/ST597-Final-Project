# Crystal_Palace Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Crystal_Palace Home Analysis
Crystal_Palace_Home <- Crystal_Palace %>%
  filter(HomeTeam == 'Crystal Palace')
Crystal_PalaceHomeGames <- nrow(Crystal_Palace_Home)
Crystal_PalaceHomeGames

# Crystal_Palace Home Wins
Crystal_Palace_Home_Wins <- Crystal_Palace %>%
  filter(HomeTeam == 'Crystal Palace' && FTR == 'H')
Crystal_PalaceHomeWins <- nrow(Crystal_Palace_Home_Wins)
Crystal_PalaceHomeWins

Crystal_PalaceHomeWinPayout <- mean(Crystal_Palace_Home_Wins$BbAvH)
Crystal_PalaceHomeWinPayout

# Crystal_Palace Home Losses
Crystal_Palace_Home_Losses <- Crystal_Palace %>%
  filter(HomeTeam == 'Crystal Palace' && FTR == 'A')
Crystal_PalaceHomeLosses <- nrow(Crystal_Palace_Home_Losses)
Crystal_PalaceHomeLosses

Crystal_PalaceHomeLossPayout <- mean(Crystal_Palace_Home_Losses$BbAvH)
Crystal_PalaceHomeLossPayout

Crystal_PalaceOpponentHomePayout <- mean(Crystal_Palace_Home_Losses$BbAvA)
Crystal_PalaceOpponentHomePayout

# Crystal_Palace Away Analysis
Crystal_Palace_Away <- Crystal_Palace %>%
  filter(AwayTeam == 'Crystal Palace')
Crystal_PalaceAwayGames <- nrow(Crystal_Palace_Away)
Crystal_PalaceAwayGames

# Crystal_Palace Away Wins
Crystal_Palace_Away_Wins <- Crystal_Palace %>%
  filter(AwayTeam == 'Crystal Palace' && FTR == 'A')
Crystal_PalaceAwayWins <- nrow(Crystal_Palace_Away_Wins)
Crystal_PalaceAwayWins

Crystal_PalaceAwayWinPayout <- mean(Crystal_Palace_Away_Wins$BbAvA)
Crystal_PalaceAwayWinPayout

# Crystal_Palace Away Losses
Crystal_Palace_Away_Losses <- Crystal_Palace %>%
  filter(AwayTeam == 'Crystal Palace' && FTR == 'H')
Crystal_PalaceAwayLosses <- nrow(Crystal_Palace_Away_Losses)
Crystal_PalaceAwayLosses

Crystal_PalaceAwayLossPayout <- mean(Crystal_Palace_Away_Losses$BbAvA)
Crystal_PalaceAwayLossPayout

Crystal_PalaceOpponentAwayPayout <- mean(Crystal_Palace_Away_Wins$BbAvH)
Crystal_PalaceOpponentAwayPayout

# Crystal_Palace Home Draws
Crystal_Palace_Home_Draws <- Crystal_Palace %>%
  filter(HomeTeam == 'Crystal Palace' && FTR == 'D')
Crystal_PalaceHomeDraws <- nrow(Crystal_Palace_Home_Draws)
Crystal_PalaceHomeDraws

# Crystal_Palace Away Draws
Crystal_Palace_Away_Draws <- Crystal_Palace %>%
  filter(AwayTeam == 'Crystal Palace' && FTR == 'D')
Crystal_PalaceAwayDraws <- nrow(Crystal_Palace_Away_Draws)
Crystal_PalaceAwayDraws

# Crystal_Palace Record
Crystal_PalaceWins <- Crystal_PalaceHomeWins + Crystal_PalaceAwayWins
Crystal_PalaceWins

Crystal_PalaceLosses <- Crystal_PalaceHomeLosses + Crystal_PalaceAwayLosses
Crystal_PalaceLosses

Crystal_PalaceDraws <- Crystal_PalaceHomeDraws + Crystal_PalaceAwayDraws
Crystal_PalaceDraws

#WDL
Crystal_PalaceOverallRecord <- paste(Crystal_PalaceWins, Crystal_PalaceDraws, Crystal_PalaceLosses, sep = "-")
Crystal_PalaceHomeRecord <- paste(Crystal_PalaceHomeWins, Crystal_PalaceHomeDraws, Crystal_PalaceHomeLosses, 
                           sep = "-")
Crystal_PalaceAwayRecord <- paste(Crystal_PalaceAwayWins, Crystal_PalaceAwayDraws, Crystal_PalaceAwayLosses, 
                           sep = "-")
# Overall Record
Crystal_PalaceOverallRecord

# Home Record + Data
Crystal_PalaceHomeRecord
Crystal_PalaceHomeWinPayout
Crystal_PalaceOpponentHomePayout

# Away Record + Data
Crystal_PalaceAwayRecord
Crystal_PalaceAwayWinPayout
Crystal_PalaceOpponentAwayPayout

# Payout Betting Purely on Crystal_Palace Winning at Home
Crystal_PalaceHomeBetting <- Crystal_PalaceHomeWins*(Crystal_PalaceHomeWinPayout-1) - 
  Crystal_PalaceHomeDraws - Crystal_PalaceHomeLosses
Crystal_PalaceHomeBetting

# Payout Betting Purely on Crystal_Palace Winning Away
Crystal_PalaceAwayBetting <- Crystal_PalaceAwayWins*(Crystal_PalaceAwayWinPayout-1) - 
  Crystal_PalaceAwayDraws - Crystal_PalaceAwayLosses
Crystal_PalaceAwayBetting

Crystal_PalaceWinnings <- Crystal_PalaceHomeBetting + Crystal_PalaceAwayBetting
Crystal_PalaceWinnings