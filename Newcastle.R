# Newcastle Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Newcastle Home Analysis
Newcastle_Home <- Newcastle %>%
  filter(HomeTeam == 'Newcastle')
NewcastleHomeGames <- nrow(Newcastle_Home)
NewcastleHomeGames

# Newcastle Home Wins
Newcastle_Home_Wins <- Newcastle %>%
  filter(HomeTeam == 'Newcastle' && FTR == 'H')
NewcastleHomeWins <- nrow(Newcastle_Home_Wins)
NewcastleHomeWins

NewcastleHomeWinPayout <- mean(Newcastle_Home_Wins$BbAvH)
NewcastleHomeWinPayout

# Newcastle Home Losses
Newcastle_Home_Losses <- Newcastle %>%
  filter(HomeTeam == 'Newcastle' && FTR == 'A')
NewcastleHomeLosses <- nrow(Newcastle_Home_Losses)
NewcastleHomeLosses

NewcastleHomeLossPayout <- mean(Newcastle_Home_Losses$BbAvH)
NewcastleHomeLossPayout

NewcastleOpponentHomePayout <- mean(Newcastle_Home_Losses$BbAvA)
NewcastleOpponentHomePayout

# Newcastle Away Analysis
Newcastle_Away <- Newcastle %>%
  filter(AwayTeam == 'Newcastle')
NewcastleAwayGames <- nrow(Newcastle_Away)
NewcastleAwayGames

# Newcastle Away Wins
Newcastle_Away_Wins <- Newcastle %>%
  filter(AwayTeam == 'Newcastle' && FTR == 'A')
NewcastleAwayWins <- nrow(Newcastle_Away_Wins)
NewcastleAwayWins

NewcastleAwayWinPayout <- mean(Newcastle_Away_Wins$BbAvA)
NewcastleAwayWinPayout

# Newcastle Away Losses
Newcastle_Away_Losses <- Newcastle %>%
  filter(AwayTeam == 'Newcastle' && FTR == 'H')
NewcastleAwayLosses <- nrow(Newcastle_Away_Losses)
NewcastleAwayLosses

NewcastleAwayLossPayout <- mean(Newcastle_Away_Losses$BbAvA)
NewcastleAwayLossPayout

NewcastleOpponentAwayPayout <- mean(Newcastle_Away_Wins$BbAvH)
NewcastleOpponentAwayPayout

# Newcastle Home Draws
Newcastle_Home_Draws <- Newcastle %>%
  filter(HomeTeam == 'Newcastle' && FTR == 'D')
NewcastleHomeDraws <- nrow(Newcastle_Home_Draws)
NewcastleHomeDraws

# Newcastle Away Draws
Newcastle_Away_Draws <- Newcastle %>%
  filter(AwayTeam == 'Newcastle' && FTR == 'D')
NewcastleAwayDraws <- nrow(Newcastle_Away_Draws)
NewcastleAwayDraws

# Newcastle Record
NewcastleWins <- NewcastleHomeWins + NewcastleAwayWins
NewcastleWins

NewcastleLosses <- NewcastleHomeLosses + NewcastleAwayLosses
NewcastleLosses

NewcastleDraws <- NewcastleHomeDraws + NewcastleAwayDraws
NewcastleDraws

#WDL
NewcastleOverallRecord <- paste(NewcastleWins, NewcastleDraws, NewcastleLosses, sep = "-")
NewcastleHomeRecord <- paste(NewcastleHomeWins, NewcastleHomeDraws, NewcastleHomeLosses, 
                           sep = "-")
NewcastleAwayRecord <- paste(NewcastleAwayWins, NewcastleAwayDraws, NewcastleAwayLosses, 
                           sep = "-")
# Overall Record
NewcastleOverallRecord

# Home Record + Data
NewcastleHomeRecord
NewcastleHomeWinPayout
NewcastleOpponentHomePayout

# Away Record + Data
NewcastleAwayRecord
NewcastleAwayWinPayout
NewcastleOpponentAwayPayout

# Payout Betting Purely on Newcastle Winning at Home
NewcastleHomeBetting <- NewcastleHomeWins*(NewcastleHomeWinPayout-1) - 
  NewcastleHomeDraws - NewcastleHomeLosses
NewcastleHomeBetting

# Payout Betting Purely on Newcastle Winning Away
NewcastleAwayBetting <- NewcastleAwayWins*(NewcastleAwayWinPayout-1) - 
  NewcastleAwayDraws - NewcastleAwayLosses
NewcastleAwayBetting

NewcastleWinnings <- NewcastleHomeBetting + NewcastleAwayBetting
NewcastleWinnings