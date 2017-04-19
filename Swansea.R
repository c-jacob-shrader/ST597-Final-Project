# Swansea Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Swansea Home Analysis
Swansea_Home <- Swansea %>%
  filter(HomeTeam == 'Swansea')
SwanseaHomeGames <- nrow(Swansea_Home)
SwanseaHomeGames

# Swansea Home Wins
Swansea_Home_Wins <- Swansea %>%
  filter(HomeTeam == 'Swansea' && FTR == 'H')
SwanseaHomeWins <- nrow(Swansea_Home_Wins)
SwanseaHomeWins

SwanseaHomeWinPayout <- mean(Swansea_Home_Wins$BbAvH)
SwanseaHomeWinPayout

# Swansea Home Losses
Swansea_Home_Losses <- Swansea %>%
  filter(HomeTeam == 'Swansea' && FTR == 'A')
SwanseaHomeLosses <- nrow(Swansea_Home_Losses)
SwanseaHomeLosses

SwanseaHomeLossPayout <- mean(Swansea_Home_Losses$BbAvH)
SwanseaHomeLossPayout

SwanseaOpponentHomePayout <- mean(Swansea_Home_Losses$BbAvA)
SwanseaOpponentHomePayout

# Swansea Away Analysis
Swansea_Away <- Swansea %>%
  filter(AwayTeam == 'Swansea')
SwanseaAwayGames <- nrow(Swansea_Away)
SwanseaAwayGames

# Swansea Away Wins
Swansea_Away_Wins <- Swansea %>%
  filter(AwayTeam == 'Swansea' && FTR == 'A')
SwanseaAwayWins <- nrow(Swansea_Away_Wins)
SwanseaAwayWins

SwanseaAwayWinPayout <- mean(Swansea_Away_Wins$BbAvA)
SwanseaAwayWinPayout

# Swansea Away Losses
Swansea_Away_Losses <- Swansea %>%
  filter(AwayTeam == 'Swansea' && FTR == 'H')
SwanseaAwayLosses <- nrow(Swansea_Home_Losses)
SwanseaAwayLosses

SwanseaAwayLossPayout <- mean(Swansea_Away_Losses$BbAvA)
SwanseaAwayLossPayout

SwanseaOpponentAwayPayout <- mean(Swansea_Away_Wins$BbAvH)
SwanseaOpponentAwayPayout

# Swansea Home Draws
Swansea_Home_Draws <- Swansea %>%
  filter(HomeTeam == 'Swansea' && FTR == 'D')
SwanseaHomeDraws <- nrow(Swansea_Home_Draws)
SwanseaHomeDraws

# Swansea Away Draws
Swansea_Away_Draws <- Swansea %>%
  filter(AwayTeam == 'Swansea' && FTR == 'D')
SwanseaAwayDraws <- nrow(Swansea_Away_Draws)
SwanseaAwayDraws

# Swansea Record
SwanseaWins <- SwanseaHomeWins + SwanseaAwayWins
SwanseaWins

SwanseaLosses <- SwanseaHomeLosses + SwanseaAwayLosses
SwanseaLosses

SwanseaDraws <- SwanseaHomeDraws + SwanseaAwayDraws
SwanseaDraws

#WDL
SwanseaOverallRecord <- paste(SwanseaWins, SwanseaDraws, SwanseaLosses, sep = "-")
SwanseaHomeRecord <- paste(SwanseaHomeWins, SwanseaHomeDraws, SwanseaHomeLosses, 
                           sep = "-")
SwanseaAwayRecord <- paste(SwanseaAwayWins, SwanseaAwayDraws, SwanseaAwayLosses, 
                           sep = "-")
# Overall Record
SwanseaOverallRecord

# Home Record + Data
SwanseaHomeRecord
SwanseaHomeWinPayout
SwanseaOpponentHomePayout

# Away Record + Data
SwanseaAwayRecord
SwanseaAwayWinPayout
SwanseaOpponentAwayPayout

# Payout Betting Purely on Swansea Winning at Home
SwanseaHomeBetting <- SwanseaHomeWins*(SwanseaHomeWinPayout-1) - 
  SwanseaHomeDraws - SwanseaHomeLosses
SwanseaHomeBetting

# Payout Betting Purely on Swansea Winning Away
SwanseaAwayBetting <- SwanseaAwayWins*(SwanseaAwayWinPayout-1) - 
  SwanseaAwayDraws - SwanseaAwayLosses
SwanseaAwayBetting

SwanseaWinnings <- SwanseaHomeBetting + SwanseaAwayBetting
SwanseaWinnings