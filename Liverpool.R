# Liverpool Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Liverpool Home Analysis
Liverpool_Home <- Liverpool %>%
  filter(HomeTeam == 'Liverpool')
LiverpoolHomeGames <- nrow(Liverpool_Home)
LiverpoolHomeGames

# Liverpool Home Wins
Liverpool_Home_Wins <- Liverpool %>%
  filter(HomeTeam == 'Liverpool' && FTR == 'H')
LiverpoolHomeWins <- nrow(Liverpool_Home_Wins)
LiverpoolHomeWins

LiverpoolHomeWinPayout <- mean(Liverpool_Home_Wins$BbAvH)
LiverpoolHomeWinPayout

# Liverpool Home Losses
Liverpool_Home_Losses <- Liverpool %>%
  filter(HomeTeam == 'Liverpool' && FTR == 'A')
LiverpoolHomeLosses <- nrow(Liverpool_Home_Losses)
LiverpoolHomeLosses

LiverpoolHomeLossPayout <- mean(Liverpool_Home_Losses$BbAvH)
LiverpoolHomeLossPayout

LiverpoolOpponentHomePayout <- mean(Liverpool_Home_Losses$BbAvA)
LiverpoolOpponentHomePayout

# Liverpool Away Analysis
Liverpool_Away <- Liverpool %>%
  filter(AwayTeam == 'Liverpool')
LiverpoolAwayGames <- nrow(Liverpool_Away)
LiverpoolAwayGames

# Liverpool Away Wins
Liverpool_Away_Wins <- Liverpool %>%
  filter(AwayTeam == 'Liverpool' && FTR == 'A')
LiverpoolAwayWins <- nrow(Liverpool_Away_Wins)
LiverpoolAwayWins

LiverpoolAwayWinPayout <- mean(Liverpool_Away_Wins$BbAvA)
LiverpoolAwayWinPayout

# Liverpool Away Losses
Liverpool_Away_Losses <- Liverpool %>%
  filter(AwayTeam == 'Liverpool' && FTR == 'H')
LiverpoolAwayLosses <- nrow(Liverpool_Home_Losses)
LiverpoolAwayLosses

LiverpoolAwayLossPayout <- mean(Liverpool_Away_Losses$BbAvA)
LiverpoolAwayLossPayout

LiverpoolOpponentAwayPayout <- mean(Liverpool_Away_Wins$BbAvH)
LiverpoolOpponentAwayPayout

# Liverpool Home Draws
Liverpool_Home_Draws <- Liverpool %>%
  filter(HomeTeam == 'Liverpool' && FTR == 'D')
LiverpoolHomeDraws <- nrow(Liverpool_Home_Draws)
LiverpoolHomeDraws

# Liverpool Away Draws
Liverpool_Away_Draws <- Liverpool %>%
  filter(AwayTeam == 'Liverpool' && FTR == 'D')
LiverpoolAwayDraws <- nrow(Liverpool_Away_Draws)
LiverpoolAwayDraws

# Liverpool Record
LiverpoolWins <- LiverpoolHomeWins + LiverpoolAwayWins
LiverpoolWins

LiverpoolLosses <- LiverpoolHomeLosses + LiverpoolAwayLosses
LiverpoolLosses

LiverpoolDraws <- LiverpoolHomeDraws + LiverpoolAwayDraws
LiverpoolDraws

#WDL
LiverpoolOverallRecord <- paste(LiverpoolWins, LiverpoolDraws, LiverpoolLosses, sep = "-")
LiverpoolHomeRecord <- paste(LiverpoolHomeWins, LiverpoolHomeDraws, LiverpoolHomeLosses, 
                           sep = "-")
LiverpoolAwayRecord <- paste(LiverpoolAwayWins, LiverpoolAwayDraws, LiverpoolAwayLosses, 
                           sep = "-")
# Overall Record
LiverpoolOverallRecord

# Home Record + Data
LiverpoolHomeRecord
LiverpoolHomeWinPayout
LiverpoolOpponentHomePayout

# Away Record + Data 
LiverpoolAwayRecord
LiverpoolAwayWinPayout
LiverpoolOpponentAwayPayout

# Payout Betting Purely on Liverpool Winning at Home
LiverpoolHomeBetting <- LiverpoolHomeWins*(LiverpoolHomeWinPayout-1) - 
  LiverpoolHomeDraws - LiverpoolHomeLosses
LiverpoolHomeBetting

# Payout Betting Purely on Liverpool Winning Away
LiverpoolAwayBetting <- LiverpoolAwayWins*(LiverpoolAwayWinPayout-1) - 
  LiverpoolAwayDraws - LiverpoolAwayLosses
LiverpoolAwayBetting

LiverpoolWinnings <- LiverpoolHomeBetting + LiverpoolAwayBetting
LiverpoolWinnings