# Everton Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Everton Home Analysis
Everton_Home <- Everton %>%
  filter(HomeTeam == 'Everton')
EvertonHomeGames <- nrow(Everton_Home)
EvertonHomeGames

# Everton Home Wins
Everton_Home_Wins <- Everton %>%
  filter(HomeTeam == 'Everton' && FTR == 'H')
EvertonHomeWins <- nrow(Everton_Home_Wins)
EvertonHomeWins

EvertonHomeWinPayout <- mean(Everton_Home_Wins$BbAvH)
EvertonHomeWinPayout

# Everton Home Losses
Everton_Home_Losses <- Everton %>%
  filter(HomeTeam == 'Everton' && FTR == 'A')
EvertonHomeLosses <- nrow(Everton_Home_Losses)
EvertonHomeLosses

EvertonHomeLossPayout <- mean(Everton_Home_Losses$BbAvH)
EvertonHomeLossPayout

EvertonOpponentHomePayout <- mean(Everton_Home_Losses$BbAvA)
EvertonOpponentHomePayout

# Everton Away Analysis
Everton_Away <- Everton %>%
  filter(AwayTeam == 'Everton')
EvertonAwayGames <- nrow(Everton_Away)
EvertonAwayGames

# Everton Away Wins
Everton_Away_Wins <- Everton %>%
  filter(AwayTeam == 'Everton' && FTR == 'A')
EvertonAwayWins <- nrow(Everton_Away_Wins)
EvertonAwayWins

EvertonAwayWinPayout <- mean(Everton_Away_Wins$BbAvA)
EvertonAwayWinPayout

# Everton Away Losses
Everton_Away_Losses <- Everton %>%
  filter(AwayTeam == 'Everton' && FTR == 'H')
EvertonAwayLosses <- nrow(Everton_Away_Losses)
EvertonAwayLosses

EvertonAwayLossPayout <- mean(Everton_Away_Losses$BbAvA)
EvertonAwayLossPayout

EvertonOpponentAwayPayout <- mean(Everton_Away_Wins$BbAvH)
EvertonOpponentAwayPayout

# Everton Home Draws
Everton_Home_Draws <- Everton %>%
  filter(HomeTeam == 'Everton' && FTR == 'D')
EvertonHomeDraws <- nrow(Everton_Home_Draws)
EvertonHomeDraws

# Everton Away Draws
Everton_Away_Draws <- Everton %>%
  filter(AwayTeam == 'Everton' && FTR == 'D')
EvertonAwayDraws <- nrow(Everton_Away_Draws)
EvertonAwayDraws

# Everton Record
EvertonWins <- EvertonHomeWins + EvertonAwayWins
EvertonWins

EvertonLosses <- EvertonHomeLosses + EvertonAwayLosses
EvertonLosses

EvertonDraws <- EvertonHomeDraws + EvertonAwayDraws
EvertonDraws

#WDL
EvertonOverallRecord <- paste(EvertonWins, EvertonDraws, EvertonLosses, sep = "-")
EvertonHomeRecord <- paste(EvertonHomeWins, EvertonHomeDraws, EvertonHomeLosses, 
                           sep = "-")
EvertonAwayRecord <- paste(EvertonAwayWins, EvertonAwayDraws, EvertonAwayLosses, 
                           sep = "-")
# Overall Record
EvertonOverallRecord

# Home Record + Data
EvertonHomeRecord
EvertonHomeWinPayout
EvertonOpponentHomePayout

# Away Record + Data
EvertonAwayRecord
EvertonAwayWinPayout
EvertonOpponentAwayPayout

# Payout Betting Purely on Everton Winning at Home
EvertonHomeBetting <- EvertonHomeWins*(EvertonHomeWinPayout-1) - 
  EvertonHomeDraws - EvertonHomeLosses
EvertonHomeBetting

# Payout Betting Purely on Everton Winning Away
EvertonAwayBetting <- EvertonAwayWins*(EvertonAwayWinPayout-1) - 
  EvertonAwayDraws - EvertonAwayLosses
EvertonAwayBetting

EvertonWinnings <- EvertonHomeBetting + EvertonAwayBetting
EvertonWinnings