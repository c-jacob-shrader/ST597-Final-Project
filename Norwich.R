# Norwich Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Norwich Home Analysis
Norwich_Home <- Norwich %>%
  filter(HomeTeam == 'Norwich')
NorwichHomeGames <- nrow(Norwich_Home)
NorwichHomeGames

# Norwich Home Wins
Norwich_Home_Wins <- Norwich %>%
  filter(HomeTeam == 'Norwich' && FTR == 'H')
NorwichHomeWins <- nrow(Norwich_Home_Wins)
NorwichHomeWins

NorwichHomeWinPayout <- mean(Norwich_Home_Wins$BbAvH)
NorwichHomeWinPayout

# Norwich Home Losses
Norwich_Home_Losses <- Norwich %>%
  filter(HomeTeam == 'Norwich' && FTR == 'A')
NorwichHomeLosses <- nrow(Norwich_Home_Losses)
NorwichHomeLosses

NorwichHomeLossPayout <- mean(Norwich_Home_Losses$BbAvH)
NorwichHomeLossPayout

NorwichOpponentHomePayout <- mean(Norwich_Home_Losses$BbAvA)
NorwichOpponentHomePayout

# Norwich Away Analysis
Norwich_Away <- Norwich %>%
  filter(AwayTeam == 'Norwich')
NorwichAwayGames <- nrow(Norwich_Away)
NorwichAwayGames

# Norwich Away Wins
Norwich_Away_Wins <- Norwich %>%
  filter(AwayTeam == 'Norwich' && FTR == 'A')
NorwichAwayWins <- nrow(Norwich_Away_Wins)
NorwichAwayWins

NorwichAwayWinPayout <- mean(Norwich_Away_Wins$BbAvA)
NorwichAwayWinPayout

# Norwich Away Losses
Norwich_Away_Losses <- Norwich %>%
  filter(AwayTeam == 'Norwich' && FTR == 'H')
NorwichAwayLosses <- nrow(Norwich_Home_Losses)
NorwichAwayLosses

NorwichAwayLossPayout <- mean(Norwich_Away_Losses$BbAvA)
NorwichAwayLossPayout

NorwichOpponentAwayPayout <- mean(Norwich_Away_Wins$BbAvH)
NorwichOpponentAwayPayout

# Norwich Home Draws
Norwich_Home_Draws <- Norwich %>%
  filter(HomeTeam == 'Norwich' && FTR == 'D')
NorwichHomeDraws <- nrow(Norwich_Home_Draws)
NorwichHomeDraws

# Norwich Away Draws
Norwich_Away_Draws <- Norwich %>%
  filter(AwayTeam == 'Norwich' && FTR == 'D')
NorwichAwayDraws <- nrow(Norwich_Away_Draws)
NorwichAwayDraws

# Norwich Record
NorwichWins <- NorwichHomeWins + NorwichAwayWins
NorwichWins

NorwichLosses <- NorwichHomeLosses + NorwichAwayLosses
NorwichLosses

NorwichDraws <- NorwichHomeDraws + NorwichAwayDraws
NorwichDraws

#WDL
NorwichOverallRecord <- paste(NorwichWins, NorwichDraws, NorwichLosses, sep = "-")
NorwichHomeRecord <- paste(NorwichHomeWins, NorwichHomeDraws, NorwichHomeLosses, 
                           sep = "-")
NorwichAwayRecord <- paste(NorwichAwayWins, NorwichAwayDraws, NorwichAwayLosses, 
                           sep = "-")
# Overall Record
NorwichOverallRecord

# Home Record + Data
NorwichHomeRecord
NorwichHomeWinPayout
NorwichOpponentHomePayout

# Away Record + Data
NorwichAwayRecord
NorwichAwayWinPayout
NorwichOpponentAwayPayout

# Payout Betting Purely on Norwich Winning at Home
NorwichHomeBetting <- NorwichHomeWins*(NorwichHomeWinPayout-1) - 
  NorwichHomeDraws - NorwichHomeLosses
NorwichHomeBetting

# Payout Betting Purely on Norwich Winning Away
NorwichAwayBetting <- NorwichAwayWins*(NorwichAwayWinPayout-1) - 
  NorwichAwayDraws - NorwichAwayLosses
NorwichAwayBetting

NorwichWinnings <- NorwichHomeBetting + NorwichAwayBetting
NorwichWinnings