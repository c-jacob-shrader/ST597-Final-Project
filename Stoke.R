# Stoke Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Stoke Home Analysis
Stoke_Home <- Stoke %>%
  filter(HomeTeam == 'Stoke')
StokeHomeGames <- nrow(Stoke_Home)
StokeHomeGames

# Stoke Home Wins
Stoke_Home_Wins <- Stoke %>%
  filter(HomeTeam == 'Stoke' && FTR == 'H')
StokeHomeWins <- nrow(Stoke_Home_Wins)
StokeHomeWins

StokeHomeWinPayout <- mean(Stoke_Home_Wins$BbAvH)
StokeHomeWinPayout

# Stoke Home Losses
Stoke_Home_Losses <- Stoke %>%
  filter(HomeTeam == 'Stoke' && FTR == 'A')
StokeHomeLosses <- nrow(Stoke_Home_Losses)
StokeHomeLosses

StokeHomeLossPayout <- mean(Stoke_Home_Losses$BbAvH)
StokeHomeLossPayout

StokeOpponentHomePayout <- mean(Stoke_Home_Losses$BbAvA)
StokeOpponentHomePayout

# Stoke Away Analysis
Stoke_Away <- Stoke %>%
  filter(AwayTeam == 'Stoke')
StokeAwayGames <- nrow(Stoke_Away)
StokeAwayGames

# Stoke Away Wins
Stoke_Away_Wins <- Stoke %>%
  filter(AwayTeam == 'Stoke' && FTR == 'A')
StokeAwayWins <- nrow(Stoke_Away_Wins)
StokeAwayWins

StokeAwayWinPayout <- mean(Stoke_Away_Wins$BbAvA)
StokeAwayWinPayout

# Stoke Away Losses
Stoke_Away_Losses <- Stoke %>%
  filter(AwayTeam == 'Stoke' && FTR == 'H')
StokeAwayLosses <- nrow(Stoke_Away_Losses)
StokeAwayLosses

StokeAwayLossPayout <- mean(Stoke_Away_Losses$BbAvA)
StokeAwayLossPayout

StokeOpponentAwayPayout <- mean(Stoke_Away_Wins$BbAvH)
StokeOpponentAwayPayout

# Stoke Home Draws
Stoke_Home_Draws <- Stoke %>%
  filter(HomeTeam == 'Stoke' && FTR == 'D')
StokeHomeDraws <- nrow(Stoke_Home_Draws)
StokeHomeDraws

# Stoke Away Draws
Stoke_Away_Draws <- Stoke %>%
  filter(AwayTeam == 'Stoke' && FTR == 'D')
StokeAwayDraws <- nrow(Stoke_Away_Draws)
StokeAwayDraws

# Stoke Record
StokeWins <- StokeHomeWins + StokeAwayWins
StokeWins

StokeLosses <- StokeHomeLosses + StokeAwayLosses
StokeLosses

StokeDraws <- StokeHomeDraws + StokeAwayDraws
StokeDraws

#WDL
StokeOverallRecord <- paste(StokeWins, StokeDraws, StokeLosses, sep = "-")
StokeHomeRecord <- paste(StokeHomeWins, StokeHomeDraws, StokeHomeLosses, 
                           sep = "-")
StokeAwayRecord <- paste(StokeAwayWins, StokeAwayDraws, StokeAwayLosses, 
                           sep = "-")
# Overall Record
StokeOverallRecord

# Home Record + Data
StokeHomeRecord
StokeHomeWinPayout
StokeOpponentHomePayout

# Away Record + Data
StokeAwayRecord
StokeAwayWinPayout
StokeOpponentAwayPayout

# Payout Betting Purely on Stoke Winning at Home
StokeHomeBetting <- StokeHomeWins*(StokeHomeWinPayout-1) - 
  StokeHomeDraws - StokeHomeLosses
StokeHomeBetting

# Payout Betting Purely on Stoke Winning Away
StokeAwayBetting <- StokeAwayWins*(StokeAwayWinPayout-1) - 
  StokeAwayDraws - StokeAwayLosses
StokeAwayBetting

StokeWinnings <- StokeHomeBetting + StokeAwayBetting
StokeWinnings