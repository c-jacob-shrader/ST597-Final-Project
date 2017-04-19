# Tottenham Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Tottenham Home Analysis
Tottenham_Home <- Tottenham %>%
  filter(HomeTeam == 'Tottenham')
TottenhamHomeGames <- nrow(Tottenham_Home)
TottenhamHomeGames

# Tottenham Home Wins
Tottenham_Home_Wins <- Tottenham %>%
  filter(HomeTeam == 'Tottenham' && FTR == 'H')
TottenhamHomeWins <- nrow(Tottenham_Home_Wins)
TottenhamHomeWins

TottenhamHomeWinPayout <- mean(Tottenham_Home_Wins$BbAvH)
TottenhamHomeWinPayout

# Tottenham Home Losses
Tottenham_Home_Losses <- Tottenham %>%
  filter(HomeTeam == 'Tottenham' && FTR == 'A')
TottenhamHomeLosses <- nrow(Tottenham_Home_Losses)
TottenhamHomeLosses

TottenhamHomeLossPayout <- mean(Tottenham_Home_Losses$BbAvH)
TottenhamHomeLossPayout

TottenhamOpponentHomePayout <- mean(Tottenham_Home_Losses$BbAvA)
TottenhamOpponentHomePayout

# Tottenham Away Analysis
Tottenham_Away <- Tottenham %>%
  filter(AwayTeam == 'Tottenham')
TottenhamAwayGames <- nrow(Tottenham_Away)
TottenhamAwayGames

# Tottenham Away Wins
Tottenham_Away_Wins <- Tottenham %>%
  filter(AwayTeam == 'Tottenham' && FTR == 'A')
TottenhamAwayWins <- nrow(Tottenham_Away_Wins)
TottenhamAwayWins

TottenhamAwayWinPayout <- mean(Tottenham_Away_Wins$BbAvA)
TottenhamAwayWinPayout

# Tottenham Away Losses
Tottenham_Away_Losses <- Tottenham %>%
  filter(AwayTeam == 'Tottenham' && FTR == 'H')
TottenhamAwayLosses <- nrow(Tottenham_Home_Losses)
TottenhamAwayLosses

TottenhamAwayLossPayout <- mean(Tottenham_Away_Losses$BbAvA)
TottenhamAwayLossPayout

TottenhamOpponentAwayPayout <- mean(Tottenham_Away_Wins$BbAvH)
TottenhamOpponentAwayPayout

# Tottenham Home Draws
Tottenham_Home_Draws <- Tottenham %>%
  filter(HomeTeam == 'Tottenham' && FTR == 'D')
TottenhamHomeDraws <- nrow(Tottenham_Home_Draws)
TottenhamHomeDraws

# Tottenham Away Draws
Tottenham_Away_Draws <- Tottenham %>%
  filter(AwayTeam == 'Tottenham' && FTR == 'D')
TottenhamAwayDraws <- nrow(Tottenham_Away_Draws)
TottenhamAwayDraws

# Tottenham Record
TottenhamWins <- TottenhamHomeWins + TottenhamAwayWins
TottenhamWins

TottenhamLosses <- TottenhamHomeLosses + TottenhamAwayLosses
TottenhamLosses

TottenhamDraws <- TottenhamHomeDraws + TottenhamAwayDraws
TottenhamDraws

#WDL
TottenhamOverallRecord <- paste(TottenhamWins, TottenhamDraws, TottenhamLosses, sep = "-")
TottenhamHomeRecord <- paste(TottenhamHomeWins, TottenhamHomeDraws, TottenhamHomeLosses, 
                           sep = "-")
TottenhamAwayRecord <- paste(TottenhamAwayWins, TottenhamAwayDraws, TottenhamAwayLosses, 
                           sep = "-")
# Overall Record
TottenhamOverallRecord

# Home Record + Data
TottenhamHomeRecord
TottenhamHomeWinPayout
TottenhamOpponentHomePayout

# Away Record + Data
TottenhamAwayRecord
TottenhamAwayWinPayout
TottenhamOpponentAwayPayout

# Payout Betting Purely on Tottenham Winning at Home
TottenhamHomeBetting <- TottenhamHomeWins*(TottenhamHomeWinPayout-1) - 
  TottenhamHomeDraws - TottenhamHomeLosses
TottenhamHomeBetting

# Payout Betting Purely on Tottenham Winning Away
TottenhamAwayBetting <- TottenhamAwayWins*(TottenhamAwayWinPayout-1) - 
  TottenhamAwayDraws - TottenhamAwayLosses
TottenhamAwayBetting

TottenhamWinnings <- TottenhamHomeBetting + TottenhamAwayBetting
TottenhamWinnings