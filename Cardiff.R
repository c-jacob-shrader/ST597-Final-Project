# Cardiff Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Cardiff Home Analysis
Cardiff_Home <- Cardiff %>%
  filter(HomeTeam == 'Cardiff')
CardiffHomeGames <- nrow(Cardiff_Home)
CardiffHomeGames

# Cardiff Home Wins
Cardiff_Home_Wins <- Cardiff %>%
  filter(HomeTeam == 'Cardiff' && FTR == 'H')
CardiffHomeWins <- nrow(Cardiff_Home_Wins)
CardiffHomeWins

CardiffHomeWinPayout <- mean(Cardiff_Home_Wins$BbAvH)
CardiffHomeWinPayout

# Cardiff Home Losses
Cardiff_Home_Losses <- Cardiff %>%
  filter(HomeTeam == 'Cardiff' && FTR == 'A')
CardiffHomeLosses <- nrow(Cardiff_Home_Losses)
CardiffHomeLosses

CardiffHomeLossPayout <- mean(Cardiff_Home_Losses$BbAvH)
CardiffHomeLossPayout

CardiffOpponentHomePayout <- mean(Cardiff_Home_Losses$BbAvA)
CardiffOpponentHomePayout

# Cardiff Away Analysis
Cardiff_Away <- Cardiff %>%
  filter(AwayTeam == 'Cardiff')
CardiffAwayGames <- nrow(Cardiff_Away)
CardiffAwayGames

# Cardiff Away Wins
Cardiff_Away_Wins <- Cardiff %>%
  filter(AwayTeam == 'Cardiff' && FTR == 'A')
CardiffAwayWins <- nrow(Cardiff_Away_Wins)
CardiffAwayWins

CardiffAwayWinPayout <- mean(Cardiff_Away_Wins$BbAvA)
CardiffAwayWinPayout

# Cardiff Away Losses
Cardiff_Away_Losses <- Cardiff %>%
  filter(AwayTeam == 'Cardiff' && FTR == 'H')
CardiffAwayLosses <- nrow(Cardiff_Home_Losses)
CardiffAwayLosses

CardiffAwayLossPayout <- mean(Cardiff_Away_Losses$BbAvA)
CardiffAwayLossPayout

CardiffOpponentAwayPayout <- mean(Cardiff_Away_Wins$BbAvH)
CardiffOpponentAwayPayout

# Cardiff Home Draws
Cardiff_Home_Draws <- Cardiff %>%
  filter(HomeTeam == 'Cardiff' && FTR == 'D')
CardiffHomeDraws <- nrow(Cardiff_Home_Draws)
CardiffHomeDraws

# Cardiff Away Draws
Cardiff_Away_Draws <- Cardiff %>%
  filter(AwayTeam == 'Cardiff' && FTR == 'D')
CardiffAwayDraws <- nrow(Cardiff_Away_Draws)
CardiffAwayDraws

# Cardiff Record
CardiffWins <- CardiffHomeWins + CardiffAwayWins
CardiffWins

CardiffLosses <- CardiffHomeLosses + CardiffAwayLosses
CardiffLosses

CardiffDraws <- CardiffHomeDraws + CardiffAwayDraws
CardiffDraws

#WDL
CardiffOverallRecord <- paste(CardiffWins, CardiffDraws, CardiffLosses, sep = "-")
CardiffHomeRecord <- paste(CardiffHomeWins, CardiffHomeDraws, CardiffHomeLosses, 
                             sep = "-")
CardiffAwayRecord <- paste(CardiffAwayWins, CardiffAwayDraws, CardiffAwayLosses, 
                             sep = "-")
# Overall Record
CardiffOverallRecord

# Home Record + Data
CardiffHomeRecord
CardiffHomeWinPayout
CardiffOpponentHomePayout

# Away Record + Data
CardiffAwayRecord
CardiffAwayWinPayout
CardiffOpponentAwayPayout

# Payout Betting Purely on Cardiff Winning at Home
CardiffHomeBetting <- CardiffHomeWins*(CardiffHomeWinPayout-1) - 
  CardiffHomeDraws - CardiffHomeLosses
CardiffHomeBetting

# Payout Betting Purely on Cardiff Winning Away
CardiffAwayBetting <- CardiffAwayWins*(CardiffAwayWinPayout-1) - 
  CardiffAwayDraws - CardiffAwayLosses
CardiffAwayBetting

CardiffWinnings <- CardiffHomeBetting + CardiffAwayBetting
CardiffWinnings