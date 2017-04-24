# Wolves Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Wolves Home Analysis
Wolves_Home <- Wolves %>%
  filter(HomeTeam == 'Wolves')
WolvesHomeGames <- nrow(Wolves_Home)
WolvesHomeGames

# Wolves Home Wins
Wolves_Home_Wins <- Wolves %>%
  filter(HomeTeam == 'Wolves' && FTR == 'H')
WolvesHomeWins <- nrow(Wolves_Home_Wins)
WolvesHomeWins

WolvesHomeWinPayout <- mean(Wolves_Home_Wins$BbAvH)
WolvesHomeWinPayout

# Wolves Home Losses
Wolves_Home_Losses <- Wolves %>%
  filter(HomeTeam == 'Wolves' && FTR == 'A')
WolvesHomeLosses <- nrow(Wolves_Home_Losses)
WolvesHomeLosses

WolvesHomeLossPayout <- mean(Wolves_Home_Losses$BbAvH)
WolvesHomeLossPayout

WolvesOpponentHomePayout <- mean(Wolves_Home_Losses$BbAvA)
WolvesOpponentHomePayout

# Wolves Away Analysis
Wolves_Away <- Wolves %>%
  filter(AwayTeam == 'Wolves')
WolvesAwayGames <- nrow(Wolves_Away)
WolvesAwayGames

# Wolves Away Wins
Wolves_Away_Wins <- Wolves %>%
  filter(AwayTeam == 'Wolves' && FTR == 'A')
WolvesAwayWins <- nrow(Wolves_Away_Wins)
WolvesAwayWins

WolvesAwayWinPayout <- mean(Wolves_Away_Wins$BbAvA)
WolvesAwayWinPayout

# Wolves Away Losses
Wolves_Away_Losses <- Wolves %>%
  filter(AwayTeam == 'Wolves' && FTR == 'H')
WolvesAwayLosses <- nrow(Wolves_Away_Losses)
WolvesAwayLosses

WolvesAwayLossPayout <- mean(Wolves_Away_Losses$BbAvA)
WolvesAwayLossPayout

WolvesOpponentAwayPayout <- mean(Wolves_Away_Wins$BbAvH)
WolvesOpponentAwayPayout

# Wolves Home Draws
Wolves_Home_Draws <- Wolves %>%
  filter(HomeTeam == 'Wolves' && FTR == 'D')
WolvesHomeDraws <- nrow(Wolves_Home_Draws)
WolvesHomeDraws

# Wolves Away Draws
Wolves_Away_Draws <- Wolves %>%
  filter(AwayTeam == 'Wolves' && FTR == 'D')
WolvesAwayDraws <- nrow(Wolves_Away_Draws)
WolvesAwayDraws

# Wolves Record
WolvesWins <- WolvesHomeWins + WolvesAwayWins
WolvesWins

WolvesLosses <- WolvesHomeLosses + WolvesAwayLosses
WolvesLosses

WolvesDraws <- WolvesHomeDraws + WolvesAwayDraws
WolvesDraws

#WDL
WolvesOverallRecord <- paste(WolvesWins, WolvesDraws, WolvesLosses, sep = "-")
WolvesHomeRecord <- paste(WolvesHomeWins, WolvesHomeDraws, WolvesHomeLosses, 
                           sep = "-")
WolvesAwayRecord <- paste(WolvesAwayWins, WolvesAwayDraws, WolvesAwayLosses, 
                           sep = "-")
# Overall Record
WolvesOverallRecord

# Home Record + Data
WolvesHomeRecord
WolvesHomeWinPayout
WolvesOpponentHomePayout

# Away Record + Data
WolvesAwayRecord
WolvesAwayWinPayout
WolvesOpponentAwayPayout

# Payout Betting Purely on Wolves Winning at Home
WolvesHomeBetting <- WolvesHomeWins*(WolvesHomeWinPayout-1) - 
  WolvesHomeDraws - WolvesHomeLosses
WolvesHomeBetting

# Payout Betting Purely on Wolves Winning Away
WolvesAwayBetting <- WolvesAwayWins*(WolvesAwayWinPayout-1) - 
  WolvesAwayDraws - WolvesAwayLosses
WolvesAwayBetting

WolvesWinnings <- WolvesHomeBetting + WolvesAwayBetting
WolvesWinnings