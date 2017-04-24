# Sunderland Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Sunderland Home Analysis
Sunderland_Home <- Sunderland %>%
  filter(HomeTeam == 'Sunderland')
SunderlandHomeGames <- nrow(Sunderland_Home)
SunderlandHomeGames

# Sunderland Home Wins
Sunderland_Home_Wins <- Sunderland %>%
  filter(HomeTeam == 'Sunderland' && FTR == 'H')
SunderlandHomeWins <- nrow(Sunderland_Home_Wins)
SunderlandHomeWins

SunderlandHomeWinPayout <- mean(Sunderland_Home_Wins$BbAvH)
SunderlandHomeWinPayout

# Sunderland Home Losses
Sunderland_Home_Losses <- Sunderland %>%
  filter(HomeTeam == 'Sunderland' && FTR == 'A')
SunderlandHomeLosses <- nrow(Sunderland_Home_Losses)
SunderlandHomeLosses

SunderlandHomeLossPayout <- mean(Sunderland_Home_Losses$BbAvH)
SunderlandHomeLossPayout

SunderlandOpponentHomePayout <- mean(Sunderland_Home_Losses$BbAvA)
SunderlandOpponentHomePayout

# Sunderland Away Analysis
Sunderland_Away <- Sunderland %>%
  filter(AwayTeam == 'Sunderland')
SunderlandAwayGames <- nrow(Sunderland_Away)
SunderlandAwayGames

# Sunderland Away Wins
Sunderland_Away_Wins <- Sunderland %>%
  filter(AwayTeam == 'Sunderland' && FTR == 'A')
SunderlandAwayWins <- nrow(Sunderland_Away_Wins)
SunderlandAwayWins

SunderlandAwayWinPayout <- mean(Sunderland_Away_Wins$BbAvA)
SunderlandAwayWinPayout

# Sunderland Away Losses
Sunderland_Away_Losses <- Sunderland %>%
  filter(AwayTeam == 'Sunderland' && FTR == 'H')
SunderlandAwayLosses <- nrow(Sunderland_Away_Losses)
SunderlandAwayLosses

SunderlandAwayLossPayout <- mean(Sunderland_Away_Losses$BbAvA)
SunderlandAwayLossPayout

SunderlandOpponentAwayPayout <- mean(Sunderland_Away_Wins$BbAvH)
SunderlandOpponentAwayPayout

# Sunderland Home Draws
Sunderland_Home_Draws <- Sunderland %>%
  filter(HomeTeam == 'Sunderland' && FTR == 'D')
SunderlandHomeDraws <- nrow(Sunderland_Home_Draws)
SunderlandHomeDraws

# Sunderland Away Draws
Sunderland_Away_Draws <- Sunderland %>%
  filter(AwayTeam == 'Sunderland' && FTR == 'D')
SunderlandAwayDraws <- nrow(Sunderland_Away_Draws)
SunderlandAwayDraws

# Sunderland Record
SunderlandWins <- SunderlandHomeWins + SunderlandAwayWins
SunderlandWins

SunderlandLosses <- SunderlandHomeLosses + SunderlandAwayLosses
SunderlandLosses

SunderlandDraws <- SunderlandHomeDraws + SunderlandAwayDraws
SunderlandDraws

#WDL
SunderlandOverallRecord <- paste(SunderlandWins, SunderlandDraws, SunderlandLosses, sep = "-")
SunderlandHomeRecord <- paste(SunderlandHomeWins, SunderlandHomeDraws, SunderlandHomeLosses, 
                           sep = "-")
SunderlandAwayRecord <- paste(SunderlandAwayWins, SunderlandAwayDraws, SunderlandAwayLosses, 
                           sep = "-")
# Overall Record
SunderlandOverallRecord

# Home Record + Data
SunderlandHomeRecord
SunderlandHomeWinPayout
SunderlandOpponentHomePayout

# Away Record + Data
SunderlandAwayRecord
SunderlandAwayWinPayout
SunderlandOpponentAwayPayout

# Payout Betting Purely on Sunderland Winning at Home
SunderlandHomeBetting <- SunderlandHomeWins*(SunderlandHomeWinPayout-1) - 
  SunderlandHomeDraws - SunderlandHomeLosses
SunderlandHomeBetting

# Payout Betting Purely on Sunderland Winning Away
SunderlandAwayBetting <- SunderlandAwayWins*(SunderlandAwayWinPayout-1) - 
  SunderlandAwayDraws - SunderlandAwayLosses
SunderlandAwayBetting

SunderlandWinnings <- SunderlandHomeBetting + SunderlandAwayBetting
SunderlandWinnings