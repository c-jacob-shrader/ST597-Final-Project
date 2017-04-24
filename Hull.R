# Hull Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Hull Home Analysis
Hull_Home <- Hull %>%
  filter(HomeTeam == 'Hull')
HullHomeGames <- nrow(Hull_Home)
HullHomeGames

# Hull Home Wins
Hull_Home_Wins <- Hull %>%
  filter(HomeTeam == 'Hull' && FTR == 'H')
HullHomeWins <- nrow(Hull_Home_Wins)
HullHomeWins

HullHomeWinPayout <- mean(Hull_Home_Wins$BbAvH)
HullHomeWinPayout

# Hull Home Losses
Hull_Home_Losses <- Hull %>%
  filter(HomeTeam == 'Hull' && FTR == 'A')
HullHomeLosses <- nrow(Hull_Home_Losses)
HullHomeLosses

HullHomeLossPayout <- mean(Hull_Home_Losses$BbAvH)
HullHomeLossPayout

HullOpponentHomePayout <- mean(Hull_Home_Losses$BbAvA)
HullOpponentHomePayout

# Hull Away Analysis
Hull_Away <- Hull %>%
  filter(AwayTeam == 'Hull')
HullAwayGames <- nrow(Hull_Away)
HullAwayGames

# Hull Away Wins
Hull_Away_Wins <- Hull %>%
  filter(AwayTeam == 'Hull' && FTR == 'A')
HullAwayWins <- nrow(Hull_Away_Wins)
HullAwayWins

HullAwayWinPayout <- mean(Hull_Away_Wins$BbAvA)
HullAwayWinPayout

# Hull Away Losses
Hull_Away_Losses <- Hull %>%
  filter(AwayTeam == 'Hull' && FTR == 'H')
HullAwayLosses <- nrow(Hull_Away_Losses)
HullAwayLosses

HullAwayLossPayout <- mean(Hull_Away_Losses$BbAvA)
HullAwayLossPayout

HullOpponentAwayPayout <- mean(Hull_Away_Wins$BbAvH)
HullOpponentAwayPayout

# Hull Home Draws
Hull_Home_Draws <- Hull %>%
  filter(HomeTeam == 'Hull' && FTR == 'D')
HullHomeDraws <- nrow(Hull_Home_Draws)
HullHomeDraws

# Hull Away Draws
Hull_Away_Draws <- Hull %>%
  filter(AwayTeam == 'Hull' && FTR == 'D')
HullAwayDraws <- nrow(Hull_Away_Draws)
HullAwayDraws

# Hull Record
HullWins <- HullHomeWins + HullAwayWins
HullWins

HullLosses <- HullHomeLosses + HullAwayLosses
HullLosses

HullDraws <- HullHomeDraws + HullAwayDraws
HullDraws

#WDL
HullOverallRecord <- paste(HullWins, HullDraws, HullLosses, sep = "-")
HullHomeRecord <- paste(HullHomeWins, HullHomeDraws, HullHomeLosses, 
                           sep = "-")
HullAwayRecord <- paste(HullAwayWins, HullAwayDraws, HullAwayLosses, 
                           sep = "-")
# Overall Record
HullOverallRecord

# Home Record + Data
HullHomeRecord
HullHomeWinPayout
HullOpponentHomePayout

# Away Record + Data
HullAwayRecord
HullAwayWinPayout
HullOpponentAwayPayout

# Payout Betting Purely on Hull Winning at Home
HullHomeBetting <- HullHomeWins*(HullHomeWinPayout-1) - 
  HullHomeDraws - HullHomeLosses
HullHomeBetting

# Payout Betting Purely on Hull Winning Away
HullAwayBetting <- HullAwayWins*(HullAwayWinPayout-1) - 
  HullAwayDraws - HullAwayLosses
HullAwayBetting

HullWinnings <- HullHomeBetting + HullAwayBetting
HullWinnings
