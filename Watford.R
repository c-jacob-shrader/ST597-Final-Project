# Watford Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Watford Home Analysis
Watford_Home <- Watford %>%
  filter(HomeTeam == 'Watford')
WatfordHomeGames <- nrow(Watford_Home)
WatfordHomeGames

# Watford Home Wins
Watford_Home_Wins <- Watford %>%
  filter(HomeTeam == 'Watford' && FTR == 'H')
WatfordHomeWins <- nrow(Watford_Home_Wins)
WatfordHomeWins

WatfordHomeWinPayout <- mean(Watford_Home_Wins$BbAvH)
WatfordHomeWinPayout

# Watford Home Losses
Watford_Home_Losses <- Watford %>%
  filter(HomeTeam == 'Watford' && FTR == 'A')
WatfordHomeLosses <- nrow(Watford_Home_Losses)
WatfordHomeLosses

WatfordHomeLossPayout <- mean(Watford_Home_Losses$BbAvH)
WatfordHomeLossPayout

WatfordOpponentHomePayout <- mean(Watford_Home_Losses$BbAvA)
WatfordOpponentHomePayout

# Watford Away Analysis
Watford_Away <- Watford %>%
  filter(AwayTeam == 'Watford')
WatfordAwayGames <- nrow(Watford_Away)
WatfordAwayGames

# Watford Away Wins
Watford_Away_Wins <- Watford %>%
  filter(AwayTeam == 'Watford' && FTR == 'A')
WatfordAwayWins <- nrow(Watford_Away_Wins)
WatfordAwayWins

WatfordAwayWinPayout <- mean(Watford_Away_Wins$BbAvA)
WatfordAwayWinPayout

# Watford Away Losses
Watford_Away_Losses <- Watford %>%
  filter(AwayTeam == 'Watford' && FTR == 'H')
WatfordAwayLosses <- nrow(Watford_Away_Losses)
WatfordAwayLosses

WatfordAwayLossPayout <- mean(Watford_Away_Losses$BbAvA)
WatfordAwayLossPayout

WatfordOpponentAwayPayout <- mean(Watford_Away_Wins$BbAvH)
WatfordOpponentAwayPayout

# Watford Home Draws
Watford_Home_Draws <- Watford %>%
  filter(HomeTeam == 'Watford' && FTR == 'D')
WatfordHomeDraws <- nrow(Watford_Home_Draws)
WatfordHomeDraws

# Watford Away Draws
Watford_Away_Draws <- Watford %>%
  filter(AwayTeam == 'Watford' && FTR == 'D')
WatfordAwayDraws <- nrow(Watford_Away_Draws)
WatfordAwayDraws

# Watford Record
WatfordWins <- WatfordHomeWins + WatfordAwayWins
WatfordWins

WatfordLosses <- WatfordHomeLosses + WatfordAwayLosses
WatfordLosses

WatfordDraws <- WatfordHomeDraws + WatfordAwayDraws
WatfordDraws

#WDL
WatfordOverallRecord <- paste(WatfordWins, WatfordDraws, WatfordLosses, sep = "-")
WatfordHomeRecord <- paste(WatfordHomeWins, WatfordHomeDraws, WatfordHomeLosses, 
                           sep = "-")
WatfordAwayRecord <- paste(WatfordAwayWins, WatfordAwayDraws, WatfordAwayLosses, 
                           sep = "-")
# Overall Record
WatfordOverallRecord

# Home Record + Data
WatfordHomeRecord
WatfordHomeWinPayout
WatfordOpponentHomePayout

# Away Record + Data
WatfordAwayRecord
WatfordAwayWinPayout
WatfordOpponentAwayPayout

# Payout Betting Purely on Watford Winning at Home
WatfordHomeBetting <- WatfordHomeWins*(WatfordHomeWinPayout-1) - 
  WatfordHomeDraws - WatfordHomeLosses
WatfordHomeBetting

# Payout Betting Purely on Watford Winning Away
WatfordAwayBetting <- WatfordAwayWins*(WatfordAwayWinPayout-1) - 
  WatfordAwayDraws - WatfordAwayLosses
WatfordAwayBetting

WatfordWinnings <- WatfordHomeBetting + WatfordAwayBetting
WatfordWinnings