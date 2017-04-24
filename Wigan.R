# Wigan Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Wigan Home Analysis
Wigan_Home <- Wigan %>%
  filter(HomeTeam == 'Wigan')
WiganHomeGames <- nrow(Wigan_Home)
WiganHomeGames

# Wigan Home Wins
Wigan_Home_Wins <- Wigan %>%
  filter(HomeTeam == 'Wigan' && FTR == 'H')
WiganHomeWins <- nrow(Wigan_Home_Wins)
WiganHomeWins

WiganHomeWinPayout <- mean(Wigan_Home_Wins$BbAvH)
WiganHomeWinPayout

# Wigan Home Losses
Wigan_Home_Losses <- Wigan %>%
  filter(HomeTeam == 'Wigan' && FTR == 'A')
WiganHomeLosses <- nrow(Wigan_Home_Losses)
WiganHomeLosses

WiganHomeLossPayout <- mean(Wigan_Home_Losses$BbAvH)
WiganHomeLossPayout

WiganOpponentHomePayout <- mean(Wigan_Home_Losses$BbAvA)
WiganOpponentHomePayout

# Wigan Away Analysis
Wigan_Away <- Wigan %>%
  filter(AwayTeam == 'Wigan')
WiganAwayGames <- nrow(Wigan_Away)
WiganAwayGames

# Wigan Away Wins
Wigan_Away_Wins <- Wigan %>%
  filter(AwayTeam == 'Wigan' && FTR == 'A')
WiganAwayWins <- nrow(Wigan_Away_Wins)
WiganAwayWins

WiganAwayWinPayout <- mean(Wigan_Away_Wins$BbAvA)
WiganAwayWinPayout

# Wigan Away Losses
Wigan_Away_Losses <- Wigan %>%
  filter(AwayTeam == 'Wigan' && FTR == 'H')
WiganAwayLosses <- nrow(Wigan_Away_Losses)
WiganAwayLosses

WiganAwayLossPayout <- mean(Wigan_Away_Losses$BbAvA)
WiganAwayLossPayout

WiganOpponentAwayPayout <- mean(Wigan_Away_Wins$BbAvH)
WiganOpponentAwayPayout

# Wigan Home Draws
Wigan_Home_Draws <- Wigan %>%
  filter(HomeTeam == 'Wigan' && FTR == 'D')
WiganHomeDraws <- nrow(Wigan_Home_Draws)
WiganHomeDraws

# Wigan Away Draws
Wigan_Away_Draws <- Wigan %>%
  filter(AwayTeam == 'Wigan' && FTR == 'D')
WiganAwayDraws <- nrow(Wigan_Away_Draws)
WiganAwayDraws

# Wigan Record
WiganWins <- WiganHomeWins + WiganAwayWins
WiganWins

WiganLosses <- WiganHomeLosses + WiganAwayLosses
WiganLosses

WiganDraws <- WiganHomeDraws + WiganAwayDraws
WiganDraws

#WDL
WiganOverallRecord <- paste(WiganWins, WiganDraws, WiganLosses, sep = "-")
WiganHomeRecord <- paste(WiganHomeWins, WiganHomeDraws, WiganHomeLosses, 
                           sep = "-")
WiganAwayRecord <- paste(WiganAwayWins, WiganAwayDraws, WiganAwayLosses, 
                           sep = "-")
# Overall Record
WiganOverallRecord

# Home Record + Data
WiganHomeRecord
WiganHomeWinPayout
WiganOpponentHomePayout

# Away Record + Data
WiganAwayRecord
WiganAwayWinPayout
WiganOpponentAwayPayout

# Payout Betting Purely on Wigan Winning at Home
WiganHomeBetting <- WiganHomeWins*(WiganHomeWinPayout-1) - 
  WiganHomeDraws - WiganHomeLosses
WiganHomeBetting

# Payout Betting Purely on Wigan Winning Away
WiganAwayBetting <- WiganAwayWins*(WiganAwayWinPayout-1) - 
  WiganAwayDraws - WiganAwayLosses
WiganAwayBetting

WiganWinnings <- WiganHomeBetting + WiganAwayBetting
WiganWinnings