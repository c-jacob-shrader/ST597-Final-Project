# Bolton Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Bolton Home Analysis
Bolton_Home <- Bolton %>%
  filter(HomeTeam == 'Bolton')
BoltonHomeGames <- nrow(Bolton_Home)
BoltonHomeGames

# Bolton Home Wins
Bolton_Home_Wins <- Bolton %>%
  filter(HomeTeam == 'Bolton' && FTR == 'H')
BoltonHomeWins <- nrow(Bolton_Home_Wins)
BoltonHomeWins

BoltonHomeWinPayout <- mean(Bolton_Home_Wins$BbAvH)
BoltonHomeWinPayout

# Bolton Home Losses
Bolton_Home_Losses <- Bolton %>%
  filter(HomeTeam == 'Bolton' && FTR == 'A')
BoltonHomeLosses <- nrow(Bolton_Home_Losses)
BoltonHomeLosses

BoltonHomeLossPayout <- mean(Bolton_Home_Losses$BbAvH)
BoltonHomeLossPayout

BoltonOpponentHomePayout <- mean(Bolton_Home_Losses$BbAvA)
BoltonOpponentHomePayout

# Bolton Away Analysis
Bolton_Away <- Bolton %>%
  filter(AwayTeam == 'Bolton')
BoltonAwayGames <- nrow(Bolton_Away)
BoltonAwayGames

# Bolton Away Wins
Bolton_Away_Wins <- Bolton %>%
  filter(AwayTeam == 'Bolton' && FTR == 'A')
BoltonAwayWins <- nrow(Bolton_Away_Wins)
BoltonAwayWins

BoltonAwayWinPayout <- mean(Bolton_Away_Wins$BbAvA)
BoltonAwayWinPayout

# Bolton Away Losses
Bolton_Away_Losses <- Bolton %>%
  filter(AwayTeam == 'Bolton' && FTR == 'H')
BoltonAwayLosses <- nrow(Bolton_Home_Losses)
BoltonAwayLosses

BoltonAwayLossPayout <- mean(Bolton_Away_Losses$BbAvA)
BoltonAwayLossPayout

BoltonOpponentAwayPayout <- mean(Bolton_Away_Wins$BbAvH)
BoltonOpponentAwayPayout

# Bolton Home Draws
Bolton_Home_Draws <- Bolton %>%
  filter(HomeTeam == 'Bolton' && FTR == 'D')
BoltonHomeDraws <- nrow(Bolton_Home_Draws)
BoltonHomeDraws

# Bolton Away Draws
Bolton_Away_Draws <- Bolton %>%
  filter(AwayTeam == 'Bolton' && FTR == 'D')
BoltonAwayDraws <- nrow(Bolton_Away_Draws)
BoltonAwayDraws

# Bolton Record
BoltonWins <- BoltonHomeWins + BoltonAwayWins
BoltonWins

BoltonLosses <- BoltonHomeLosses + BoltonAwayLosses
BoltonLosses

BoltonDraws <- BoltonHomeDraws + BoltonAwayDraws
BoltonDraws

#WDL
BoltonOverallRecord <- paste(BoltonWins, BoltonDraws, BoltonLosses, sep = "-")
BoltonHomeRecord <- paste(BoltonHomeWins, BoltonHomeDraws, BoltonHomeLosses, 
                             sep = "-")
BoltonAwayRecord <- paste(BoltonAwayWins, BoltonAwayDraws, BoltonAwayLosses, 
                             sep = "-")
# Overall Record
BoltonOverallRecord

# Home Record + Data
BoltonHomeRecord
BoltonHomeWinPayout
BoltonOpponentHomePayout

# Away Record + Data
BoltonAwayRecord
BoltonAwayWinPayout
BoltonOpponentAwayPayout

# Payout Betting Purely on Bolton Winning at Home
BoltonHomeBetting <- BoltonHomeWins*(BoltonHomeWinPayout-1) - 
  BoltonHomeDraws - BoltonHomeLosses
BoltonHomeBetting

# Payout Betting Purely on Bolton Winning Away
BoltonAwayBetting <- BoltonAwayWins*(BoltonAwayWinPayout-1) - 
  BoltonAwayDraws - BoltonAwayLosses
BoltonAwayBetting

BoltonWinnings <- BoltonHomeBetting + BoltonAwayBetting
BoltonWinnings