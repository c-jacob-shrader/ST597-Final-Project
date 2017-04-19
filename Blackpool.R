# Blackpool Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Blackpool Home Analysis
Blackpool_Home <- Blackpool %>%
  filter(HomeTeam == 'Blackpool')
BlackpoolHomeGames <- nrow(Blackpool_Home)
BlackpoolHomeGames

# Blackpool Home Wins
Blackpool_Home_Wins <- Blackpool %>%
  filter(HomeTeam == 'Blackpool' && FTR == 'H')
BlackpoolHomeWins <- nrow(Blackpool_Home_Wins)
BlackpoolHomeWins

BlackpoolHomeWinPayout <- mean(Blackpool_Home_Wins$BbAvH)
BlackpoolHomeWinPayout

# Blackpool Home Losses
Blackpool_Home_Losses <- Blackpool %>%
  filter(HomeTeam == 'Blackpool' && FTR == 'A')
BlackpoolHomeLosses <- nrow(Blackpool_Home_Losses)
BlackpoolHomeLosses

BlackpoolHomeLossPayout <- mean(Blackpool_Home_Losses$BbAvH)
BlackpoolHomeLossPayout

BlackpoolOpponentHomePayout <- mean(Blackpool_Home_Losses$BbAvA)
BlackpoolOpponentHomePayout

# Blackpool Away Analysis
Blackpool_Away <- Blackpool %>%
  filter(AwayTeam == 'Blackpool')
BlackpoolAwayGames <- nrow(Blackpool_Away)
BlackpoolAwayGames

# Blackpool Away Wins
Blackpool_Away_Wins <- Blackpool %>%
  filter(AwayTeam == 'Blackpool' && FTR == 'A')
BlackpoolAwayWins <- nrow(Blackpool_Away_Wins)
BlackpoolAwayWins

BlackpoolAwayWinPayout <- mean(Blackpool_Away_Wins$BbAvA)
BlackpoolAwayWinPayout

# Blackpool Away Losses
Blackpool_Away_Losses <- Blackpool %>%
  filter(AwayTeam == 'Blackpool' && FTR == 'H')
BlackpoolAwayLosses <- nrow(Blackpool_Home_Losses)
BlackpoolAwayLosses

BlackpoolAwayLossPayout <- mean(Blackpool_Away_Losses$BbAvA)
BlackpoolAwayLossPayout

BlackpoolOpponentAwayPayout <- mean(Blackpool_Away_Wins$BbAvH)
BlackpoolOpponentAwayPayout

# Blackpool Home Draws
Blackpool_Home_Draws <- Blackpool %>%
  filter(HomeTeam == 'Blackpool' && FTR == 'D')
BlackpoolHomeDraws <- nrow(Blackpool_Home_Draws)
BlackpoolHomeDraws

# Blackpool Away Draws
Blackpool_Away_Draws <- Blackpool %>%
  filter(AwayTeam == 'Blackpool' && FTR == 'D')
BlackpoolAwayDraws <- nrow(Blackpool_Away_Draws)
BlackpoolAwayDraws

# Blackpool Record
BlackpoolWins <- BlackpoolHomeWins + BlackpoolAwayWins
BlackpoolWins

BlackpoolLosses <- BlackpoolHomeLosses + BlackpoolAwayLosses
BlackpoolLosses

BlackpoolDraws <- BlackpoolHomeDraws + BlackpoolAwayDraws
BlackpoolDraws

#WDL
BlackpoolOverallRecord <- paste(BlackpoolWins, BlackpoolDraws, BlackpoolLosses, sep = "-")
BlackpoolHomeRecord <- paste(BlackpoolHomeWins, BlackpoolHomeDraws, BlackpoolHomeLosses, 
                             sep = "-")
BlackpoolAwayRecord <- paste(BlackpoolAwayWins, BlackpoolAwayDraws, BlackpoolAwayLosses, 
                             sep = "-")
# Overall Record
BlackpoolOverallRecord

# Home Record + Data
BlackpoolHomeRecord
BlackpoolHomeWinPayout
BlackpoolOpponentHomePayout

# Away Record + Data
BlackpoolAwayRecord
BlackpoolAwayWinPayout
BlackpoolOpponentAwayPayout

# Payout Betting Purely on Blackpool Winning at Home
BlackpoolHomeBetting <- BlackpoolHomeWins*(BlackpoolHomeWinPayout-1) - 
  BlackpoolHomeDraws - BlackpoolHomeLosses
BlackpoolHomeBetting

# Payout Betting Purely on Blackpool Winning Away
BlackpoolAwayBetting <- BlackpoolAwayWins*(BlackpoolAwayWinPayout-1) - 
  BlackpoolAwayDraws - BlackpoolAwayLosses
BlackpoolAwayBetting

BlackpoolWinnings <- BlackpoolHomeBetting + BlackpoolAwayBetting
BlackpoolWinnings