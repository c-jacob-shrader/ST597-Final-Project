# Burnley Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Burnley Home Analysis
Burnley_Home <- Burnley %>%
  filter(HomeTeam == 'Burnley')
BurnleyHomeGames <- nrow(Burnley_Home)
BurnleyHomeGames

# Burnley Home Wins
Burnley_Home_Wins <- Burnley %>%
  filter(HomeTeam == 'Burnley' && FTR == 'H')
BurnleyHomeWins <- nrow(Burnley_Home_Wins)
BurnleyHomeWins

BurnleyHomeWinPayout <- mean(Burnley_Home_Wins$BbAvH)
BurnleyHomeWinPayout

# Burnley Home Losses
Burnley_Home_Losses <- Burnley %>%
  filter(HomeTeam == 'Burnley' && FTR == 'A')
BurnleyHomeLosses <- nrow(Burnley_Home_Losses)
BurnleyHomeLosses

BurnleyHomeLossPayout <- mean(Burnley_Home_Losses$BbAvH)
BurnleyHomeLossPayout

BurnleyOpponentHomePayout <- mean(Burnley_Home_Losses$BbAvA)
BurnleyOpponentHomePayout

# Burnley Away Analysis
Burnley_Away <- Burnley %>%
  filter(AwayTeam == 'Burnley')
BurnleyAwayGames <- nrow(Burnley_Away)
BurnleyAwayGames

# Burnley Away Wins
Burnley_Away_Wins <- Burnley %>%
  filter(AwayTeam == 'Burnley' && FTR == 'A')
BurnleyAwayWins <- nrow(Burnley_Away_Wins)
BurnleyAwayWins

BurnleyAwayWinPayout <- mean(Burnley_Away_Wins$BbAvA)
BurnleyAwayWinPayout

# Burnley Away Losses
Burnley_Away_Losses <- Burnley %>%
  filter(AwayTeam == 'Burnley' && FTR == 'H')
BurnleyAwayLosses <- nrow(Burnley_Home_Losses)
BurnleyAwayLosses

BurnleyAwayLossPayout <- mean(Burnley_Away_Losses$BbAvA)
BurnleyAwayLossPayout

BurnleyOpponentAwayPayout <- mean(Burnley_Away_Wins$BbAvH)
BurnleyOpponentAwayPayout

# Burnley Home Draws
Burnley_Home_Draws <- Burnley %>%
  filter(HomeTeam == 'Burnley' && FTR == 'D')
BurnleyHomeDraws <- nrow(Burnley_Home_Draws)
BurnleyHomeDraws

# Burnley Away Draws
Burnley_Away_Draws <- Burnley %>%
  filter(AwayTeam == 'Burnley' && FTR == 'D')
BurnleyAwayDraws <- nrow(Burnley_Away_Draws)
BurnleyAwayDraws

# Burnley Record
BurnleyWins <- BurnleyHomeWins + BurnleyAwayWins
BurnleyWins

BurnleyLosses <- BurnleyHomeLosses + BurnleyAwayLosses
BurnleyLosses

BurnleyDraws <- BurnleyHomeDraws + BurnleyAwayDraws
BurnleyDraws

#WDL
BurnleyOverallRecord <- paste(BurnleyWins, BurnleyDraws, BurnleyLosses, sep = "-")
BurnleyHomeRecord <- paste(BurnleyHomeWins, BurnleyHomeDraws, BurnleyHomeLosses, 
                             sep = "-")
BurnleyAwayRecord <- paste(BurnleyAwayWins, BurnleyAwayDraws, BurnleyAwayLosses, 
                             sep = "-")
# Overall Record
BurnleyOverallRecord

# Home Record + Data
BurnleyHomeRecord
BurnleyHomeWinPayout
BurnleyOpponentHomePayout

# Away Record + Data
BurnleyAwayRecord
BurnleyAwayWinPayout
BurnleyOpponentAwayPayout

# Payout Betting Purely on Burnley Winning at Home
BurnleyHomeBetting <- BurnleyHomeWins*(BurnleyHomeWinPayout-1) - 
  BurnleyHomeDraws - BurnleyHomeLosses
BurnleyHomeBetting

# Payout Betting Purely on Burnley Winning Away
BurnleyAwayBetting <- BurnleyAwayWins*(BurnleyAwayWinPayout-1) - 
  BurnleyAwayDraws - BurnleyAwayLosses
BurnleyAwayBetting

BurnleyWinnings <- BurnleyHomeBetting + BurnleyAwayBetting
BurnleyWinnings