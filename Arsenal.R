# Arsenal Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Arsenal Home Analysis
Arsenal_Home <- Arsenal %>%
  filter(HomeTeam == 'Arsenal')
ArsenalHomeGames <- nrow(Arsenal_Home)
ArsenalHomeGames

# Arsenal Home Wins
Arsenal_Home_Wins <- Arsenal %>%
  filter(HomeTeam == 'Arsenal' && FTR == 'H')
ArsenalHomeWins <- nrow(Arsenal_Home_Wins)
ArsenalHomeWins

ArsenalHomeWinPayout <- mean(Arsenal_Home_Wins$BbAvH)
ArsenalHomeWinPayout

# Arsenal Home Losses
Arsenal_Home_Losses <- Arsenal %>%
  filter(HomeTeam == 'Arsenal' && FTR == 'A')
ArsenalHomeLosses <- nrow(Arsenal_Home_Losses)
ArsenalHomeLosses
  
ArsenalHomeLossPayout <- mean(Arsenal_Home_Losses$BbAvH)
ArsenalHomeLossPayout

ArsenalOpponentHomePayout <- mean(Arsenal_Home_Losses$BbAvA)
ArsenalOpponentHomePayout

# Arsenal Away Analysis
Arsenal_Away <- Arsenal %>%
  filter(AwayTeam == 'Arsenal')
ArsenalAwayGames <- nrow(Arsenal_Away)
ArsenalAwayGames

# Arsenal Away Wins
Arsenal_Away_Wins <- Arsenal %>%
  filter(AwayTeam == 'Arsenal' && FTR == 'A')
ArsenalAwayWins <- nrow(Arsenal_Away_Wins)
ArsenalAwayWins

ArsenalAwayWinPayout <- mean(Arsenal_Away_Wins$BbAvA)
ArsenalAwayWinPayout

# Arsenal Away Losses
Arsenal_Away_Losses <- Arsenal %>%
  filter(AwayTeam == 'Arsenal' && FTR == 'H')
ArsenalAwayLosses <- nrow(Arsenal_Home_Losses)
ArsenalAwayLosses

ArsenalAwayLossPayout <- mean(Arsenal_Away_Losses$BbAvA)
ArsenalAwayLossPayout

ArsenalOpponentAwayPayout <- mean(Arsenal_Away_Wins$BbAvH)
ArsenalOpponentAwayPayout

# Arsenal Home Draws
Arsenal_Home_Draws <- Arsenal %>%
  filter(HomeTeam == 'Arsenal' && FTR == 'D')
ArsenalHomeDraws <- nrow(Arsenal_Home_Draws)
ArsenalHomeDraws

# Arsenal Away Draws
Arsenal_Away_Draws <- Arsenal %>%
  filter(AwayTeam == 'Arsenal' && FTR == 'D')
ArsenalAwayDraws <- nrow(Arsenal_Away_Draws)
ArsenalAwayDraws
  
# Arsenal Record
ArsenalWins <- ArsenalHomeWins + ArsenalAwayWins
ArsenalWins

ArsenalLosses <- ArsenalHomeLosses + ArsenalAwayLosses
ArsenalLosses

ArsenalDraws <- ArsenalHomeDraws + ArsenalAwayDraws
ArsenalDraws

#WDL
ArsenalOverallRecord <- paste(ArsenalWins, ArsenalDraws, ArsenalLosses, sep = "-")
ArsenalHomeRecord <- paste(ArsenalHomeWins, ArsenalHomeDraws, ArsenalHomeLosses, 
                           sep = "-")
ArsenalAwayRecord <- paste(ArsenalAwayWins, ArsenalAwayDraws, ArsenalAwayLosses, 
                           sep = "-")
# Overall Record
ArsenalOverallRecord

# Home Record + Data
ArsenalHomeRecord
ArsenalHomeWinPayout
ArsenalOpponentHomePayout

# Away Record + Data
ArsenalAwayRecord
ArsenalAwayWinPayout
ArsenalOpponentAwayPayout

# Payout Betting Purely on Arsenal Winning at Home
ArsenalHomeBetting <- ArsenalHomeWins*(ArsenalHomeWinPayout-1) - 
  ArsenalHomeDraws - ArsenalHomeLosses
ArsenalHomeBetting

# Payout Betting Purely on Arsenal Winning Away
ArsenalAwayBetting <- ArsenalAwayWins*(ArsenalAwayWinPayout-1) - 
  ArsenalAwayDraws - ArsenalAwayLosses
ArsenalAwayBetting

ArsenalWinnings <- ArsenalHomeBetting + ArsenalAwayBetting
ArsenalWinnings
