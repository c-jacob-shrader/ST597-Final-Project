# Portsmouth Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Portsmouth Home Analysis
Portsmouth_Home <- Portsmouth %>%
  filter(HomeTeam == 'Portsmouth')
PortsmouthHomeGames <- nrow(Portsmouth_Home)
PortsmouthHomeGames

# Portsmouth Home Wins
Portsmouth_Home_Wins <- Portsmouth %>%
  filter(HomeTeam == 'Portsmouth' && FTR == 'H')
PortsmouthHomeWins <- nrow(Portsmouth_Home_Wins)
PortsmouthHomeWins

PortsmouthHomeWinPayout <- mean(Portsmouth_Home_Wins$BbAvH)
PortsmouthHomeWinPayout

# Portsmouth Home Losses
Portsmouth_Home_Losses <- Portsmouth %>%
  filter(HomeTeam == 'Portsmouth' && FTR == 'A')
PortsmouthHomeLosses <- nrow(Portsmouth_Home_Losses)
PortsmouthHomeLosses

PortsmouthHomeLossPayout <- mean(Portsmouth_Home_Losses$BbAvH)
PortsmouthHomeLossPayout

PortsmouthOpponentHomePayout <- mean(Portsmouth_Home_Losses$BbAvA)
PortsmouthOpponentHomePayout

# Portsmouth Away Analysis
Portsmouth_Away <- Portsmouth %>%
  filter(AwayTeam == 'Portsmouth')
PortsmouthAwayGames <- nrow(Portsmouth_Away)
PortsmouthAwayGames

# Portsmouth Away Wins
Portsmouth_Away_Wins <- Portsmouth %>%
  filter(AwayTeam == 'Portsmouth' && FTR == 'A')
PortsmouthAwayWins <- nrow(Portsmouth_Away_Wins)
PortsmouthAwayWins

PortsmouthAwayWinPayout <- mean(Portsmouth_Away_Wins$BbAvA)
PortsmouthAwayWinPayout

# Portsmouth Away Losses
Portsmouth_Away_Losses <- Portsmouth %>%
  filter(AwayTeam == 'Portsmouth' && FTR == 'H')
PortsmouthAwayLosses <- nrow(Portsmouth_Away_Losses)
PortsmouthAwayLosses

PortsmouthAwayLossPayout <- mean(Portsmouth_Away_Losses$BbAvA)
PortsmouthAwayLossPayout

PortsmouthOpponentAwayPayout <- mean(Portsmouth_Away_Wins$BbAvH)
PortsmouthOpponentAwayPayout

# Portsmouth Home Draws
Portsmouth_Home_Draws <- Portsmouth %>%
  filter(HomeTeam == 'Portsmouth' && FTR == 'D')
PortsmouthHomeDraws <- nrow(Portsmouth_Home_Draws)
PortsmouthHomeDraws

# Portsmouth Away Draws
Portsmouth_Away_Draws <- Portsmouth %>%
  filter(AwayTeam == 'Portsmouth' && FTR == 'D')
PortsmouthAwayDraws <- nrow(Portsmouth_Away_Draws)
PortsmouthAwayDraws

# Portsmouth Record
PortsmouthWins <- PortsmouthHomeWins + PortsmouthAwayWins
PortsmouthWins

PortsmouthLosses <- PortsmouthHomeLosses + PortsmouthAwayLosses
PortsmouthLosses

PortsmouthDraws <- PortsmouthHomeDraws + PortsmouthAwayDraws
PortsmouthDraws

#WDL
PortsmouthOverallRecord <- paste(PortsmouthWins, PortsmouthDraws, PortsmouthLosses, sep = "-")
PortsmouthHomeRecord <- paste(PortsmouthHomeWins, PortsmouthHomeDraws, PortsmouthHomeLosses, 
                           sep = "-")
PortsmouthAwayRecord <- paste(PortsmouthAwayWins, PortsmouthAwayDraws, PortsmouthAwayLosses, 
                           sep = "-")
# Overall Record
PortsmouthOverallRecord

# Home Record + Data
PortsmouthHomeRecord
PortsmouthHomeWinPayout
PortsmouthOpponentHomePayout

# Away Record + Data
PortsmouthAwayRecord
PortsmouthAwayWinPayout
PortsmouthOpponentAwayPayout

# Payout Betting Purely on Portsmouth Winning at Home
PortsmouthHomeBetting <- PortsmouthHomeWins*(PortsmouthHomeWinPayout-1) - 
  PortsmouthHomeDraws - PortsmouthHomeLosses
PortsmouthHomeBetting

# Payout Betting Purely on Portsmouth Winning Away
PortsmouthAwayBetting <- PortsmouthAwayWins*(PortsmouthAwayWinPayout-1) - 
  PortsmouthAwayDraws - PortsmouthAwayLosses
PortsmouthAwayBetting

PortsmouthWinnings <- PortsmouthHomeBetting + PortsmouthAwayBetting
PortsmouthWinnings