# Birmingham Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Birmingham Home Analysis
Birmingham_Home <- Birmingham %>%
  filter(HomeTeam == 'Birmingham')
BirminghamHomeGames <- nrow(Birmingham_Home)
BirminghamHomeGames

# Birmingham Home Wins
Birmingham_Home_Wins <- Birmingham %>%
  filter(HomeTeam == 'Birmingham' && FTR == 'H')
BirminghamHomeWins <- nrow(Birmingham_Home_Wins)
BirminghamHomeWins

BirminghamHomeWinPayout <- mean(Birmingham_Home_Wins$BbAvH)
BirminghamHomeWinPayout

# Birmingham Home Losses
Birmingham_Home_Losses <- Birmingham %>%
  filter(HomeTeam == 'Birmingham' && FTR == 'A')
BirminghamHomeLosses <- nrow(Birmingham_Home_Losses)
BirminghamHomeLosses

BirminghamHomeLossPayout <- mean(Birmingham_Home_Losses$BbAvH)
BirminghamHomeLossPayout

BirminghamOpponentHomePayout <- mean(Birmingham_Home_Losses$BbAvA)
BirminghamOpponentHomePayout

# Birmingham Away Analysis
Birmingham_Away <- Birmingham %>%
  filter(AwayTeam == 'Birmingham')
BirminghamAwayGames <- nrow(Birmingham_Away)
BirminghamAwayGames

# Birmingham Away Wins
Birmingham_Away_Wins <- Birmingham %>%
  filter(AwayTeam == 'Birmingham' && FTR == 'A')
BirminghamAwayWins <- nrow(Birmingham_Away_Wins)
BirminghamAwayWins

BirminghamAwayWinPayout <- mean(Birmingham_Away_Wins$BbAvA)
BirminghamAwayWinPayout

# Birmingham Away Losses
Birmingham_Away_Losses <- Birmingham %>%
  filter(AwayTeam == 'Birmingham' && FTR == 'H')
BirminghamAwayLosses <- nrow(Birmingham_Away_Losses)
BirminghamAwayLosses

BirminghamAwayLossPayout <- mean(Birmingham_Away_Losses$BbAvA)
BirminghamAwayLossPayout

BirminghamOpponentAwayPayout <- mean(Birmingham_Away_Wins$BbAvH)
BirminghamOpponentAwayPayout

# Birmingham Home Draws
Birmingham_Home_Draws <- Birmingham %>%
  filter(HomeTeam == 'Birmingham' && FTR == 'D')
BirminghamHomeDraws <- nrow(Birmingham_Home_Draws)
BirminghamHomeDraws

# Birmingham Away Draws
Birmingham_Away_Draws <- Birmingham %>%
  filter(AwayTeam == 'Birmingham' && FTR == 'D')
BirminghamAwayDraws <- nrow(Birmingham_Away_Draws)
BirminghamAwayDraws

# Birmingham Record
BirminghamWins <- BirminghamHomeWins + BirminghamAwayWins
BirminghamWins

BirminghamLosses <- BirminghamHomeLosses + BirminghamAwayLosses
BirminghamLosses

BirminghamDraws <- BirminghamHomeDraws + BirminghamAwayDraws
BirminghamDraws

#WDL
BirminghamOverallRecord <- paste(BirminghamWins, BirminghamDraws, BirminghamLosses, sep = "-")
BirminghamHomeRecord <- paste(BirminghamHomeWins, BirminghamHomeDraws, BirminghamHomeLosses, 
                           sep = "-")
BirminghamAwayRecord <- paste(BirminghamAwayWins, BirminghamAwayDraws, BirminghamAwayLosses, 
                           sep = "-")
# Overall Record
BirminghamOverallRecord

# Home Record + Data
BirminghamHomeRecord
BirminghamHomeWinPayout
BirminghamOpponentHomePayout

# Away Record + Data
BirminghamAwayRecord
BirminghamAwayWinPayout
BirminghamOpponentAwayPayout

# Payout Betting Purely on Birmingham Winning at Home
BirminghamHomeBetting <- BirminghamHomeWins*(BirminghamHomeWinPayout-1) - 
  BirminghamHomeDraws - BirminghamHomeLosses
BirminghamHomeBetting

# Payout Betting Purely on Birmingham Winning Away
BirminghamAwayBetting <- BirminghamAwayWins*(BirminghamAwayWinPayout-1) - 
  BirminghamAwayDraws - BirminghamAwayLosses
BirminghamAwayBetting

BirminghamWinnings <- BirminghamHomeBetting + BirminghamAwayBetting
BirminghamWinnings
