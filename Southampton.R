# Southampton Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Southampton Home Analysis
Southampton_Home <- Southampton %>%
  filter(HomeTeam == 'Southampton')
SouthamptonHomeGames <- nrow(Southampton_Home)
SouthamptonHomeGames

# Southampton Home Wins
Southampton_Home_Wins <- Southampton %>%
  filter(HomeTeam == 'Southampton' && FTR == 'H')
SouthamptonHomeWins <- nrow(Southampton_Home_Wins)
SouthamptonHomeWins

SouthamptonHomeWinPayout <- mean(Southampton_Home_Wins$BbAvH)
SouthamptonHomeWinPayout

# Southampton Home Losses
Southampton_Home_Losses <- Southampton %>%
  filter(HomeTeam == 'Southampton' && FTR == 'A')
SouthamptonHomeLosses <- nrow(Southampton_Home_Losses)
SouthamptonHomeLosses

SouthamptonHomeLossPayout <- mean(Southampton_Home_Losses$BbAvH)
SouthamptonHomeLossPayout

SouthamptonOpponentHomePayout <- mean(Southampton_Home_Losses$BbAvA)
SouthamptonOpponentHomePayout

# Southampton Away Analysis
Southampton_Away <- Southampton %>%
  filter(AwayTeam == 'Southampton')
SouthamptonAwayGames <- nrow(Southampton_Away)
SouthamptonAwayGames

# Southampton Away Wins
Southampton_Away_Wins <- Southampton %>%
  filter(AwayTeam == 'Southampton' && FTR == 'A')
SouthamptonAwayWins <- nrow(Southampton_Away_Wins)
SouthamptonAwayWins

SouthamptonAwayWinPayout <- mean(Southampton_Away_Wins$BbAvA)
SouthamptonAwayWinPayout

# Southampton Away Losses
Southampton_Away_Losses <- Southampton %>%
  filter(AwayTeam == 'Southampton' && FTR == 'H')
SouthamptonAwayLosses <- nrow(Southampton_Home_Losses)
SouthamptonAwayLosses

SouthamptonAwayLossPayout <- mean(Southampton_Away_Losses$BbAvA)
SouthamptonAwayLossPayout

SouthamptonOpponentAwayPayout <- mean(Southampton_Away_Wins$BbAvH)
SouthamptonOpponentAwayPayout

# Southampton Home Draws
Southampton_Home_Draws <- Southampton %>%
  filter(HomeTeam == 'Southampton' && FTR == 'D')
SouthamptonHomeDraws <- nrow(Southampton_Home_Draws)
SouthamptonHomeDraws

# Southampton Away Draws
Southampton_Away_Draws <- Southampton %>%
  filter(AwayTeam == 'Southampton' && FTR == 'D')
SouthamptonAwayDraws <- nrow(Southampton_Away_Draws)
SouthamptonAwayDraws

# Southampton Record
SouthamptonWins <- SouthamptonHomeWins + SouthamptonAwayWins
SouthamptonWins

SouthamptonLosses <- SouthamptonHomeLosses + SouthamptonAwayLosses
SouthamptonLosses

SouthamptonDraws <- SouthamptonHomeDraws + SouthamptonAwayDraws
SouthamptonDraws

#WDL
SouthamptonOverallRecord <- paste(SouthamptonWins, SouthamptonDraws, SouthamptonLosses, sep = "-")
SouthamptonHomeRecord <- paste(SouthamptonHomeWins, SouthamptonHomeDraws, SouthamptonHomeLosses, 
                           sep = "-")
SouthamptonAwayRecord <- paste(SouthamptonAwayWins, SouthamptonAwayDraws, SouthamptonAwayLosses, 
                           sep = "-")
# Overall Record
SouthamptonOverallRecord

# Home Record + Data
SouthamptonHomeRecord
SouthamptonHomeWinPayout
SouthamptonOpponentHomePayout

# Away Record + Data
SouthamptonAwayRecord
SouthamptonAwayWinPayout
SouthamptonOpponentAwayPayout

# Payout Betting Purely on Southampton Winning at Home
SouthamptonHomeBetting <- SouthamptonHomeWins*(SouthamptonHomeWinPayout-1) - 
  SouthamptonHomeDraws - SouthamptonHomeLosses
SouthamptonHomeBetting

# Payout Betting Purely on Southampton Winning Away
SouthamptonAwayBetting <- SouthamptonAwayWins*(SouthamptonAwayWinPayout-1) - 
  SouthamptonAwayDraws - SouthamptonAwayLosses
SouthamptonAwayBetting

SouthamptonWinnings <- SouthamptonHomeBetting + SouthamptonAwayBetting
SouthamptonWinnings