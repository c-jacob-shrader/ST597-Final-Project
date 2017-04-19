# Blackburn Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Blackburn Home Analysis
Blackburn_Home <- Blackbrun %>%
  filter(HomeTeam == 'Blackburn')
BlackburnHomeGames <- nrow(Blackburn_Home)
BlackburnHomeGames

# Blackburn Home Wins
Blackburn_Home_Wins <- Blackbrun %>%
  filter(HomeTeam == 'Blackburn' && FTR == 'H')
BlackburnHomeWins <- nrow(Blackburn_Home_Wins)
BlackburnHomeWins

BlackburnHomeWinPayout <- mean(Blackburn_Home_Wins$BbAvH)
BlackburnHomeWinPayout

# Blackburn Home Losses
Blackburn_Home_Losses <- Blackbrun %>%
  filter(HomeTeam == 'Blackburn' && FTR == 'A')
BlackburnHomeLosses <- nrow(Blackburn_Home_Losses)
BlackburnHomeLosses

BlackburnHomeLossPayout <- mean(Blackburn_Home_Losses$BbAvH)
BlackburnHomeLossPayout

BlackburnOpponentHomePayout <- mean(Blackburn_Home_Losses$BbAvA)
BlackburnOpponentHomePayout

# Blackburn Away Analysis
Blackburn_Away <- Blackbrun %>%
  filter(AwayTeam == 'Blackburn')
BlackburnAwayGames <- nrow(Blackburn_Away)
BlackburnAwayGames

# Blackburn Away Wins
Blackburn_Away_Wins <- Blackbrun %>%
  filter(AwayTeam == 'Blackburn' && FTR == 'A')
BlackburnAwayWins <- nrow(Blackburn_Away_Wins)
BlackburnAwayWins

BlackburnAwayWinPayout <- mean(Blackburn_Away_Wins$BbAvA)
BlackburnAwayWinPayout

# Blackburn Away Losses
Blackburn_Away_Losses <- Blackbrun %>%
  filter(AwayTeam == 'Blackburn' && FTR == 'H')
BlackburnAwayLosses <- nrow(Blackburn_Home_Losses)
BlackburnAwayLosses

BlackburnAwayLossPayout <- mean(Blackburn_Away_Losses$BbAvA)
BlackburnAwayLossPayout

BlackburnOpponentAwayPayout <- mean(Blackburn_Away_Wins$BbAvH)
BlackburnOpponentAwayPayout

# Blackburn Home Draws
Blackburn_Home_Draws <- Blackbrun %>%
  filter(HomeTeam == 'Blackburn' && FTR == 'D')
BlackburnHomeDraws <- nrow(Blackburn_Home_Draws)
BlackburnHomeDraws

# Blackburn Away Draws
Blackburn_Away_Draws <- Blackbrun %>%
  filter(AwayTeam == 'Blackburn' && FTR == 'D')
BlackburnAwayDraws <- nrow(Blackburn_Away_Draws)
BlackburnAwayDraws

# Blackburn Record
BlackburnWins <- BlackburnHomeWins + BlackburnAwayWins
BlackburnWins

BlackburnLosses <- BlackburnHomeLosses + BlackburnAwayLosses
BlackburnLosses

BlackburnDraws <- BlackburnHomeDraws + BlackburnAwayDraws
BlackburnDraws

#WDL
BlackburnOverallRecord <- paste(BlackburnWins, BlackburnDraws, BlackburnLosses, sep = "-")
BlackburnHomeRecord <- paste(BlackburnHomeWins, BlackburnHomeDraws, BlackburnHomeLosses, 
                             sep = "-")
BlackburnAwayRecord <- paste(BlackburnAwayWins, BlackburnAwayDraws, BlackburnAwayLosses, 
                             sep = "-")
# Overall Record
BlackburnOverallRecord

# Home Record + Data
BlackburnHomeRecord
BlackburnHomeWinPayout
BlackburnOpponentHomePayout

# Away Record + Data
BlackburnAwayRecord
BlackburnAwayWinPayout
BlackburnOpponentAwayPayout

# Payout Betting Purely on Blackburn Winning at Home
BlackburnHomeBetting <- BlackburnHomeWins*(BlackburnHomeWinPayout-1) - 
  BlackburnHomeDraws - BlackburnHomeLosses
BlackburnHomeBetting

# Payout Betting Purely on Blackburn Winning Away
BlackburnAwayBetting <- BlackburnAwayWins*(BlackburnAwayWinPayout-1) - 
  BlackburnAwayDraws - BlackburnAwayLosses
BlackburnAwayBetting

BlackburnWinnings <- BlackburnHomeBetting + BlackburnAwayBetting
BlackburnWinnings