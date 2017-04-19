# Charlton Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Charlton Home Analysis
Charlton_Home <- Charlton %>%
  filter(HomeTeam == 'Charlton')
CharltonHomeGames <- nrow(Charlton_Home)
CharltonHomeGames

# Charlton Home Wins
Charlton_Home_Wins <- Charlton %>%
  filter(HomeTeam == 'Charlton' && FTR == 'H')
CharltonHomeWins <- nrow(Charlton_Home_Wins)
CharltonHomeWins

CharltonHomeWinPayout <- mean(Charlton_Home_Wins$BbAvH)
CharltonHomeWinPayout

# Charlton Home Losses
Charlton_Home_Losses <- Charlton %>%
  filter(HomeTeam == 'Charlton' && FTR == 'A')
CharltonHomeLosses <- nrow(Charlton_Home_Losses)
CharltonHomeLosses

CharltonHomeLossPayout <- mean(Charlton_Home_Losses$BbAvH)
CharltonHomeLossPayout

CharltonOpponentHomePayout <- mean(Charlton_Home_Losses$BbAvA)
CharltonOpponentHomePayout

# Charlton Away Analysis
Charlton_Away <- Charlton %>%
  filter(AwayTeam == 'Charlton')
CharltonAwayGames <- nrow(Charlton_Away)
CharltonAwayGames

# Charlton Away Wins
Charlton_Away_Wins <- Charlton %>%
  filter(AwayTeam == 'Charlton' && FTR == 'A')
CharltonAwayWins <- nrow(Charlton_Away_Wins)
CharltonAwayWins

CharltonAwayWinPayout <- mean(Charlton_Away_Wins$BbAvA)
CharltonAwayWinPayout

# Charlton Away Losses
Charlton_Away_Losses <- Charlton %>%
  filter(AwayTeam == 'Charlton' && FTR == 'H')
CharltonAwayLosses <- nrow(Charlton_Home_Losses)
CharltonAwayLosses

CharltonAwayLossPayout <- mean(Charlton_Away_Losses$BbAvA)
CharltonAwayLossPayout

CharltonOpponentAwayPayout <- mean(Charlton_Away_Wins$BbAvH)
CharltonOpponentAwayPayout

# Charlton Home Draws
Charlton_Home_Draws <- Charlton %>%
  filter(HomeTeam == 'Charlton' && FTR == 'D')
CharltonHomeDraws <- nrow(Charlton_Home_Draws)
CharltonHomeDraws

# Charlton Away Draws
Charlton_Away_Draws <- Charlton %>%
  filter(AwayTeam == 'Charlton' && FTR == 'D')
CharltonAwayDraws <- nrow(Charlton_Away_Draws)
CharltonAwayDraws

# Charlton Record
CharltonWins <- CharltonHomeWins + CharltonAwayWins
CharltonWins

CharltonLosses <- CharltonHomeLosses + CharltonAwayLosses
CharltonLosses

CharltonDraws <- CharltonHomeDraws + CharltonAwayDraws
CharltonDraws

#WDL
CharltonOverallRecord <- paste(CharltonWins, CharltonDraws, CharltonLosses, sep = "-")
CharltonHomeRecord <- paste(CharltonHomeWins, CharltonHomeDraws, CharltonHomeLosses, 
                           sep = "-")
CharltonAwayRecord <- paste(CharltonAwayWins, CharltonAwayDraws, CharltonAwayLosses, 
                           sep = "-")
# Overall Record
CharltonOverallRecord

# Home Record + Data
CharltonHomeRecord
CharltonHomeWinPayout
CharltonOpponentHomePayout

# Away Record + Data
CharltonAwayRecord
CharltonAwayWinPayout
CharltonOpponentAwayPayout

# Payout Betting Purely on Charlton Winning at Home
CharltonHomeBetting <- CharltonHomeWins*(CharltonHomeWinPayout-1) - 
  CharltonHomeDraws - CharltonHomeLosses
CharltonHomeBetting

# Payout Betting Purely on Charlton Winning Away
CharltonAwayBetting <- CharltonAwayWins*(CharltonAwayWinPayout-1) - 
  CharltonAwayDraws - CharltonAwayLosses
CharltonAwayBetting

CharltonWinnings <- CharltonHomeBetting + CharltonAwayBetting
CharltonWinnings