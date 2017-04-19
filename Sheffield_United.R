# Sheffield_United Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Sheffield_United Home Analysis
Sheffield_United_Home <- Sheffield_United %>%
  filter(HomeTeam == 'Sheffield United')
Sheffield_UnitedHomeGames <- nrow(Sheffield_United_Home)
Sheffield_UnitedHomeGames

# Sheffield_United Home Wins
Sheffield_United_Home_Wins <- Sheffield_United %>%
  filter(HomeTeam == 'Sheffield United' && FTR == 'H')
Sheffield_UnitedHomeWins <- nrow(Sheffield_United_Home_Wins)
Sheffield_UnitedHomeWins

Sheffield_UnitedHomeWinPayout <- mean(Sheffield_United_Home_Wins$BbAvH)
Sheffield_UnitedHomeWinPayout

# Sheffield_United Home Losses
Sheffield_United_Home_Losses <- Sheffield_United %>%
  filter(HomeTeam == 'Sheffield United' && FTR == 'A')
Sheffield_UnitedHomeLosses <- nrow(Sheffield_United_Home_Losses)
Sheffield_UnitedHomeLosses

Sheffield_UnitedHomeLossPayout <- mean(Sheffield_United_Home_Losses$BbAvH)
Sheffield_UnitedHomeLossPayout

Sheffield_UnitedOpponentHomePayout <- mean(Sheffield_United_Home_Losses$BbAvA)
Sheffield_UnitedOpponentHomePayout

# Sheffield_United Away Analysis
Sheffield_United_Away <- Sheffield_United %>%
  filter(AwayTeam == 'Sheffield United')
Sheffield_UnitedAwayGames <- nrow(Sheffield_United_Away)
Sheffield_UnitedAwayGames

# Sheffield_United Away Wins
Sheffield_United_Away_Wins <- Sheffield_United %>%
  filter(AwayTeam == 'Sheffield United' && FTR == 'A')
Sheffield_UnitedAwayWins <- nrow(Sheffield_United_Away_Wins)
Sheffield_UnitedAwayWins

Sheffield_UnitedAwayWinPayout <- mean(Sheffield_United_Away_Wins$BbAvA)
Sheffield_UnitedAwayWinPayout

# Sheffield_United Away Losses
Sheffield_United_Away_Losses <- Sheffield_United %>%
  filter(AwayTeam == 'Sheffield United' && FTR == 'H')
Sheffield_UnitedAwayLosses <- nrow(Sheffield_United_Home_Losses)
Sheffield_UnitedAwayLosses

Sheffield_UnitedAwayLossPayout <- mean(Sheffield_United_Away_Losses$BbAvA)
Sheffield_UnitedAwayLossPayout

Sheffield_UnitedOpponentAwayPayout <- mean(Sheffield_United_Away_Wins$BbAvH)
Sheffield_UnitedOpponentAwayPayout

# Sheffield_United Home Draws
Sheffield_United_Home_Draws <- Sheffield_United %>%
  filter(HomeTeam == 'Sheffield United' && FTR == 'D')
Sheffield_UnitedHomeDraws <- nrow(Sheffield_United_Home_Draws)
Sheffield_UnitedHomeDraws

# Sheffield_United Away Draws
Sheffield_United_Away_Draws <- Sheffield_United %>%
  filter(AwayTeam == 'Sheffield United' && FTR == 'D')
Sheffield_UnitedAwayDraws <- nrow(Sheffield_United_Away_Draws)
Sheffield_UnitedAwayDraws

# Sheffield_United Record
Sheffield_UnitedWins <- Sheffield_UnitedHomeWins + Sheffield_UnitedAwayWins
Sheffield_UnitedWins

Sheffield_UnitedLosses <- Sheffield_UnitedHomeLosses + Sheffield_UnitedAwayLosses
Sheffield_UnitedLosses

Sheffield_UnitedDraws <- Sheffield_UnitedHomeDraws + Sheffield_UnitedAwayDraws
Sheffield_UnitedDraws

#WDL
Sheffield_UnitedOverallRecord <- paste(Sheffield_UnitedWins, Sheffield_UnitedDraws, Sheffield_UnitedLosses, sep = "-")
Sheffield_UnitedHomeRecord <- paste(Sheffield_UnitedHomeWins, Sheffield_UnitedHomeDraws, Sheffield_UnitedHomeLosses, 
                           sep = "-")
Sheffield_UnitedAwayRecord <- paste(Sheffield_UnitedAwayWins, Sheffield_UnitedAwayDraws, Sheffield_UnitedAwayLosses, 
                           sep = "-")
# Overall Record
Sheffield_UnitedOverallRecord

# Home Record + Data
Sheffield_UnitedHomeRecord
Sheffield_UnitedHomeWinPayout
Sheffield_UnitedOpponentHomePayout

# Away Record + Data
Sheffield_UnitedAwayRecord
Sheffield_UnitedAwayWinPayout
Sheffield_UnitedOpponentAwayPayout

# Payout Betting Purely on Sheffield_United Winning at Home
Sheffield_UnitedHomeBetting <- Sheffield_UnitedHomeWins*(Sheffield_UnitedHomeWinPayout-1) - 
  Sheffield_UnitedHomeDraws - Sheffield_UnitedHomeLosses
Sheffield_UnitedHomeBetting

# Payout Betting Purely on Sheffield_United Winning Away
Sheffield_UnitedAwayBetting <- Sheffield_UnitedAwayWins*(Sheffield_UnitedAwayWinPayout-1) - 
  Sheffield_UnitedAwayDraws - Sheffield_UnitedAwayLosses
Sheffield_UnitedAwayBetting

Sheffield_UnitedWinnings <- Sheffield_UnitedHomeBetting + Sheffield_UnitedAwayBetting
Sheffield_UnitedWinnings