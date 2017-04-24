# QPR Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# QPR Home Analysis
QPR_Home <- QPR %>%
  filter(HomeTeam == 'QPR')
QPRHomeGames <- nrow(QPR_Home)
QPRHomeGames

# QPR Home Wins
QPR_Home_Wins <- QPR %>%
  filter(HomeTeam == 'QPR' && FTR == 'H')
QPRHomeWins <- nrow(QPR_Home_Wins)
QPRHomeWins

QPRHomeWinPayout <- mean(QPR_Home_Wins$BbAvH)
QPRHomeWinPayout

# QPR Home Losses
QPR_Home_Losses <- QPR %>%
  filter(HomeTeam == 'QPR' && FTR == 'A')
QPRHomeLosses <- nrow(QPR_Home_Losses)
QPRHomeLosses

QPRHomeLossPayout <- mean(QPR_Home_Losses$BbAvH)
QPRHomeLossPayout

QPROpponentHomePayout <- mean(QPR_Home_Losses$BbAvA)
QPROpponentHomePayout

# QPR Away Analysis
QPR_Away <- QPR %>%
  filter(AwayTeam == 'QPR')
QPRAwayGames <- nrow(QPR_Away)
QPRAwayGames

# QPR Away Wins
QPR_Away_Wins <- QPR %>%
  filter(AwayTeam == 'QPR' && FTR == 'A')
QPRAwayWins <- nrow(QPR_Away_Wins)
QPRAwayWins

QPRAwayWinPayout <- mean(QPR_Away_Wins$BbAvA)
QPRAwayWinPayout

# QPR Away Losses
QPR_Away_Losses <- QPR %>%
  filter(AwayTeam == 'QPR' && FTR == 'H')
QPRAwayLosses <- nrow(QPR_Away_Losses)
QPRAwayLosses

QPRAwayLossPayout <- mean(QPR_Away_Losses$BbAvA)
QPRAwayLossPayout

QPROpponentAwayPayout <- mean(QPR_Away_Wins$BbAvH)
QPROpponentAwayPayout

# QPR Home Draws
QPR_Home_Draws <- QPR %>%
  filter(HomeTeam == 'QPR' && FTR == 'D')
QPRHomeDraws <- nrow(QPR_Home_Draws)
QPRHomeDraws

# QPR Away Draws
QPR_Away_Draws <- QPR %>%
  filter(AwayTeam == 'QPR' && FTR == 'D')
QPRAwayDraws <- nrow(QPR_Away_Draws)
QPRAwayDraws

# QPR Record
QPRWins <- QPRHomeWins + QPRAwayWins
QPRWins

QPRLosses <- QPRHomeLosses + QPRAwayLosses
QPRLosses

QPRDraws <- QPRHomeDraws + QPRAwayDraws
QPRDraws

#WDL
QPROverallRecord <- paste(QPRWins, QPRDraws, QPRLosses, sep = "-")
QPRHomeRecord <- paste(QPRHomeWins, QPRHomeDraws, QPRHomeLosses, 
                           sep = "-")
QPRAwayRecord <- paste(QPRAwayWins, QPRAwayDraws, QPRAwayLosses, 
                           sep = "-")
# Overall Record
QPROverallRecord

# Home Record + Data
QPRHomeRecord
QPRHomeWinPayout
QPROpponentHomePayout

# Away Record + Data
QPRAwayRecord
QPRAwayWinPayout
QPROpponentAwayPayout

# Payout Betting Purely on QPR Winning at Home
QPRHomeBetting <- QPRHomeWins*(QPRHomeWinPayout-1) - 
  QPRHomeDraws - QPRHomeLosses
QPRHomeBetting

# Payout Betting Purely on QPR Winning Away
QPRAwayBetting <- QPRAwayWins*(QPRAwayWinPayout-1) - 
  QPRAwayDraws - QPRAwayLosses
QPRAwayBetting

QPRWinnings <- QPRHomeBetting + QPRAwayBetting
QPRWinnings