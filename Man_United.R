# Man_United Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Man_United Home Analysis
Man_United_Home <- ManUnited %>%
  filter(HomeTeam == 'Man United')
Man_UnitedHomeGames <- nrow(Man_United_Home)
Man_UnitedHomeGames

# Man_United Home Wins
Man_United_Home_Wins <- Man_United %>%
  filter(HomeTeam == 'Man United' && FTR == 'H')
Man_UnitedHomeWins <- nrow(Man_United_Home_Wins)
Man_UnitedHomeWins

Man_UnitedHomeWinPayout <- mean(Man_United_Home_Wins$BbAvH)
Man_UnitedHomeWinPayout

# Man_United Home Losses
Man_United_Home_Losses <- Man_United %>%
  filter(HomeTeam == 'Man United' && FTR == 'A')
Man_UnitedHomeLosses <- nrow(Man_United_Home_Losses)
Man_UnitedHomeLosses

Man_UnitedHomeLossPayout <- mean(Man_United_Home_Losses$BbAvH)
Man_UnitedHomeLossPayout

Man_UnitedOpponentHomePayout <- mean(Man_United_Home_Losses$BbAvA)
Man_UnitedOpponentHomePayout

# Man_United Away Analysis
Man_United_Away <- Man_United %>%
  filter(AwayTeam == 'Man United')
Man_UnitedAwayGames <- nrow(Man_United_Away)
Man_UnitedAwayGames

# Man_United Away Wins
Man_United_Away_Wins <- Man_United %>%
  filter(AwayTeam == 'Man United' && FTR == 'A')
Man_UnitedAwayWins <- nrow(Man_United_Away_Wins)
Man_UnitedAwayWins

Man_UnitedAwayWinPayout <- mean(Man_United_Away_Wins$BbAvA)
Man_UnitedAwayWinPayout

# Man_United Away Losses
Man_United_Away_Losses <- Man_United %>%
  filter(AwayTeam == 'Man United' && FTR == 'H')
Man_UnitedAwayLosses <- nrow(Man_United_Home_Losses)
Man_UnitedAwayLosses

Man_UnitedAwayLossPayout <- mean(Man_United_Away_Losses$BbAvA)
Man_UnitedAwayLossPayout

Man_UnitedOpponentAwayPayout <- mean(Man_United_Away_Wins$BbAvH)
Man_UnitedOpponentAwayPayout

# Man_United Home Draws
Man_United_Home_Draws <- Man_United %>%
  filter(HomeTeam == 'Man United' && FTR == 'D')
Man_UnitedHomeDraws <- nrow(Man_United_Home_Draws)
Man_UnitedHomeDraws

# Man_United Away Draws
Man_United_Away_Draws <- Man_United %>%
  filter(AwayTeam == 'Man United' && FTR == 'D')
Man_UnitedAwayDraws <- nrow(Man_United_Away_Draws)
Man_UnitedAwayDraws

# Man_United Record
Man_UnitedWins <- Man_UnitedHomeWins + Man_UnitedAwayWins
Man_UnitedWins

Man_UnitedLosses <- Man_UnitedHomeLosses + Man_UnitedAwayLosses
Man_UnitedLosses

Man_UnitedDraws <- Man_UnitedHomeDraws + Man_UnitedAwayDraws
Man_UnitedDraws

#WDL
Man_UnitedOverallRecord <- paste(Man_UnitedWins, Man_UnitedDraws, Man_UnitedLosses, sep = "-")
Man_UnitedHomeRecord <- paste(Man_UnitedHomeWins, Man_UnitedHomeDraws, Man_UnitedHomeLosses, 
                           sep = "-")
Man_UnitedAwayRecord <- paste(Man_UnitedAwayWins, Man_UnitedAwayDraws, Man_UnitedAwayLosses, 
                           sep = "-")
# Overall Record
Man_UnitedOverallRecord

# Home Record + Data
Man_UnitedHomeRecord
Man_UnitedHomeWinPayout
Man_UnitedOpponentHomePayout

# Away Record + Data
Man_UnitedAwayRecord
Man_UnitedAwayWinPayout
Man_UnitedOpponentAwayPayout

# Payout Betting Purely on Man_United Winning at Home
Man_UnitedHomeBetting <- Man_UnitedHomeWins*(Man_UnitedHomeWinPayout-1) - 
  Man_UnitedHomeDraws - Man_UnitedHomeLosses
Man_UnitedHomeBetting

# Payout Betting Purely on Man_United Winning Away
Man_UnitedAwayBetting <- Man_UnitedAwayWins*(Man_UnitedAwayWinPayout-1) - 
  Man_UnitedAwayDraws - Man_UnitedAwayLosses
Man_UnitedAwayBetting

Man_UnitedWinnings <- Man_UnitedHomeBetting + Man_UnitedAwayBetting
Man_UnitedWinnings