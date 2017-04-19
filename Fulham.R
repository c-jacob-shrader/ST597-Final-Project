# Fulham Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Fulham Home Analysis
Fulham_Home <- Fulham %>%
  filter(HomeTeam == 'Fulham')
FulhamHomeGames <- nrow(Fulham_Home)
FulhamHomeGames

# Fulham Home Wins
Fulham_Home_Wins <- Fulham %>%
  filter(HomeTeam == 'Fulham' && FTR == 'H')
FulhamHomeWins <- nrow(Fulham_Home_Wins)
FulhamHomeWins

FulhamHomeWinPayout <- mean(Fulham_Home_Wins$BbAvH)
FulhamHomeWinPayout

# Fulham Home Losses
Fulham_Home_Losses <- Fulham %>%
  filter(HomeTeam == 'Fulham' && FTR == 'A')
FulhamHomeLosses <- nrow(Fulham_Home_Losses)
FulhamHomeLosses

FulhamHomeLossPayout <- mean(Fulham_Home_Losses$BbAvH)
FulhamHomeLossPayout

FulhamOpponentHomePayout <- mean(Fulham_Home_Losses$BbAvA)
FulhamOpponentHomePayout

# Fulham Away Analysis
Fulham_Away <- Fulham %>%
  filter(AwayTeam == 'Fulham')
FulhamAwayGames <- nrow(Fulham_Away)
FulhamAwayGames

# Fulham Away Wins
Fulham_Away_Wins <- Fulham %>%
  filter(AwayTeam == 'Fulham' && FTR == 'A')
FulhamAwayWins <- nrow(Fulham_Away_Wins)
FulhamAwayWins

FulhamAwayWinPayout <- mean(Fulham_Away_Wins$BbAvA)
FulhamAwayWinPayout

# Fulham Away Losses
Fulham_Away_Losses <- Fulham %>%
  filter(AwayTeam == 'Fulham' && FTR == 'H')
FulhamAwayLosses <- nrow(Fulham_Home_Losses)
FulhamAwayLosses

FulhamAwayLossPayout <- mean(Fulham_Away_Losses$BbAvA)
FulhamAwayLossPayout

FulhamOpponentAwayPayout <- mean(Fulham_Away_Wins$BbAvH)
FulhamOpponentAwayPayout

# Fulham Home Draws
Fulham_Home_Draws <- Fulham %>%
  filter(HomeTeam == 'Fulham' && FTR == 'D')
FulhamHomeDraws <- nrow(Fulham_Home_Draws)
FulhamHomeDraws

# Fulham Away Draws
Fulham_Away_Draws <- Fulham %>%
  filter(AwayTeam == 'Fulham' && FTR == 'D')
FulhamAwayDraws <- nrow(Fulham_Away_Draws)
FulhamAwayDraws

# Fulham Record
FulhamWins <- FulhamHomeWins + FulhamAwayWins
FulhamWins

FulhamLosses <- FulhamHomeLosses + FulhamAwayLosses
FulhamLosses

FulhamDraws <- FulhamHomeDraws + FulhamAwayDraws
FulhamDraws

#WDL
FulhamOverallRecord <- paste(FulhamWins, FulhamDraws, FulhamLosses, sep = "-")
FulhamHomeRecord <- paste(FulhamHomeWins, FulhamHomeDraws, FulhamHomeLosses, 
                           sep = "-")
FulhamAwayRecord <- paste(FulhamAwayWins, FulhamAwayDraws, FulhamAwayLosses, 
                           sep = "-")
# Overall Record
FulhamOverallRecord

# Home Record + Data
FulhamHomeRecord
FulhamHomeWinPayout
FulhamOpponentHomePayout

# Away Record + Data
FulhamAwayRecord
FulhamAwayWinPayout
FulhamOpponentAwayPayout

# Payout Betting Purely on Fulham Winning at Home
FulhamHomeBetting <- FulhamHomeWins*(FulhamHomeWinPayout-1) - 
  FulhamHomeDraws - FulhamHomeLosses
FulhamHomeBetting

# Payout Betting Purely on Fulham Winning Away
FulhamAwayBetting <- FulhamAwayWins*(FulhamAwayWinPayout-1) - 
  FulhamAwayDraws - FulhamAwayLosses
FulhamAwayBetting

FulhamWinnings <- FulhamHomeBetting + FulhamAwayBetting
FulhamWinnings