# Aston_Villa Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Aston_Villa Home Analysis
Aston_Villa_Home <- Aston_Villa %>%
  filter(HomeTeam == 'Aston Villa')
Aston_VillaHomeGames <- nrow(Aston_Villa_Home)
Aston_VillaHomeGames

# Aston_Villa Home Wins
Aston_Villa_Home_Wins <- Aston_Villa %>%
  filter(HomeTeam == 'Aston Villa' && FTR == 'H')
Aston_VillaHomeWins <- nrow(Aston_Villa_Home_Wins)
Aston_VillaHomeWins

Aston_VillaHomeWinPayout <- mean(Aston_Villa_Home_Wins$BbAvH)
Aston_VillaHomeWinPayout

# Aston_Villa Home Losses
Aston_Villa_Home_Losses <- Aston_Villa %>%
  filter(HomeTeam == 'Aston Villa' && FTR == 'A')
Aston_VillaHomeLosses <- nrow(Aston_Villa_Home_Losses)
Aston_VillaHomeLosses

Aston_VillaHomeLossPayout <- mean(Aston_Villa_Home_Losses$BbAvH)
Aston_VillaHomeLossPayout

Aston_VillaOpponentHomePayout <- mean(Aston_Villa_Home_Losses$BbAvA)
Aston_VillaOpponentHomePayout

# Aston_Villa Away Analysis
Aston_Villa_Away <- Aston_Villa %>%
  filter(AwayTeam == 'Aston Villa')
Aston_VillaAwayGames <- nrow(Aston_Villa_Away)
Aston_VillaAwayGames

# Aston_Villa Away Wins
Aston_Villa_Away_Wins <- Aston_Villa %>%
  filter(AwayTeam == 'Aston Villa' && FTR == 'A')
Aston_VillaAwayWins <- nrow(Aston_Villa_Away_Wins)
Aston_VillaAwayWins

Aston_VillaAwayWinPayout <- mean(Aston_Villa_Away_Wins$BbAvA)
Aston_VillaAwayWinPayout

# Aston_Villa Away Losses
Aston_Villa_Away_Losses <- Aston_Villa %>%
  filter(AwayTeam == 'Aston Villa' && FTR == 'H')
Aston_VillaAwayLosses <- nrow(Aston_Villa_Home_Losses)
Aston_VillaAwayLosses

Aston_VillaAwayLossPayout <- mean(Aston_Villa_Away_Losses$BbAvA)
Aston_VillaAwayLossPayout

Aston_VillaOpponentAwayPayout <- mean(Aston_Villa_Away_Wins$BbAvH)
Aston_VillaOpponentAwayPayout

# Aston_Villa Home Draws
Aston_Villa_Home_Draws <- Aston_Villa %>%
  filter(HomeTeam == 'Aston Villa' && FTR == 'D')
Aston_VillaHomeDraws <- nrow(Aston_Villa_Home_Draws)
Aston_VillaHomeDraws

# Aston_Villa Away Draws
Aston_Villa_Away_Draws <- Aston_Villa %>%
  filter(AwayTeam == 'Aston Villa' && FTR == 'D')
Aston_VillaAwayDraws <- nrow(Aston_Villa_Away_Draws)
Aston_VillaAwayDraws

# Aston_Villa Record
Aston_VillaWins <- Aston_VillaHomeWins + Aston_VillaAwayWins
Aston_VillaWins

Aston_VillaLosses <- Aston_VillaHomeLosses + Aston_VillaAwayLosses
Aston_VillaLosses

Aston_VillaDraws <- Aston_VillaHomeDraws + Aston_VillaAwayDraws
Aston_VillaDraws

#WDL
Aston_VillaOverallRecord <- paste(Aston_VillaWins, Aston_VillaDraws, Aston_VillaLosses, sep = "-")
Aston_VillaHomeRecord <- paste(Aston_VillaHomeWins, Aston_VillaHomeDraws, Aston_VillaHomeLosses, 
                           sep = "-")
Aston_VillaAwayRecord <- paste(Aston_VillaAwayWins, Aston_VillaAwayDraws, Aston_VillaAwayLosses, 
                           sep = "-")
# Overall Record
Aston_VillaOverallRecord

# Home Record + Data
Aston_VillaHomeRecord
Aston_VillaHomeWinPayout
Aston_VillaOpponentHomePayout

# Away Record + Data
Aston_VillaAwayRecord
Aston_VillaAwayWinPayout
Aston_VillaOpponentAwayPayout

# Payout Betting Purely on Aston_Villa Winning at Home
Aston_VillaHomeBetting <- Aston_VillaHomeWins*(Aston_VillaHomeWinPayout-1) - 
  Aston_VillaHomeDraws - Aston_VillaHomeLosses
Aston_VillaHomeBetting

# Payout Betting Purely on Aston_Villa Winning Away
Aston_VillaAwayBetting <- Aston_VillaAwayWins*(Aston_VillaAwayWinPayout-1) - 
  Aston_VillaAwayDraws - Aston_VillaAwayLosses
Aston_VillaAwayBetting

Aston_VillaWinnings <- Aston_VillaHomeBetting + Aston_VillaAwayBetting
Aston_VillaWinnings
