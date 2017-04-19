# Chelsea Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Chelsea Home Analysis
Chelsea_Home <- Chelsea %>%
  filter(HomeTeam == 'Chelsea')
ChelseaHomeGames <- nrow(Chelsea_Home)
ChelseaHomeGames

# Chelsea Home Wins
Chelsea_Home_Wins <- Chelsea %>%
  filter(HomeTeam == 'Chelsea' && FTR == 'H')
ChelseaHomeWins <- nrow(Chelsea_Home_Wins)
ChelseaHomeWins

ChelseaHomeWinPayout <- mean(Chelsea_Home_Wins$BbAvH)
ChelseaHomeWinPayout

# Chelsea Home Losses
Chelsea_Home_Losses <- Chelsea %>%
  filter(HomeTeam == 'Chelsea' && FTR == 'A')
ChelseaHomeLosses <- nrow(Chelsea_Home_Losses)
ChelseaHomeLosses

ChelseaHomeLossPayout <- mean(Chelsea_Home_Losses$BbAvH)
ChelseaHomeLossPayout

ChelseaOpponentHomePayout <- mean(Chelsea_Home_Losses$BbAvA)
ChelseaOpponentHomePayout

# Chelsea Away Analysis
Chelsea_Away <- Chelsea %>%
  filter(AwayTeam == 'Chelsea')
ChelseaAwayGames <- nrow(Chelsea_Away)
ChelseaAwayGames

# Chelsea Away Wins
Chelsea_Away_Wins <- Chelsea %>%
  filter(AwayTeam == 'Chelsea' && FTR == 'A')
ChelseaAwayWins <- nrow(Chelsea_Away_Wins)
ChelseaAwayWins

ChelseaAwayWinPayout <- mean(Chelsea_Away_Wins$BbAvA)
ChelseaAwayWinPayout

# Chelsea Away Losses
Chelsea_Away_Losses <- Chelsea %>%
  filter(AwayTeam == 'Chelsea' && FTR == 'H')
ChelseaAwayLosses <- nrow(Chelsea_Home_Losses)
ChelseaAwayLosses

ChelseaAwayLossPayout <- mean(Chelsea_Away_Losses$BbAvA)
ChelseaAwayLossPayout

ChelseaOpponentAwayPayout <- mean(Chelsea_Away_Wins$BbAvH)
ChelseaOpponentAwayPayout

# Chelsea Home Draws
Chelsea_Home_Draws <- Chelsea %>%
  filter(HomeTeam == 'Chelsea' && FTR == 'D')
ChelseaHomeDraws <- nrow(Chelsea_Home_Draws)
ChelseaHomeDraws

# Chelsea Away Draws
Chelsea_Away_Draws <- Chelsea %>%
  filter(AwayTeam == 'Chelsea' && FTR == 'D')
ChelseaAwayDraws <- nrow(Chelsea_Away_Draws)
ChelseaAwayDraws

# Chelsea Record
ChelseaWins <- ChelseaHomeWins + ChelseaAwayWins
ChelseaWins

ChelseaLosses <- ChelseaHomeLosses + ChelseaAwayLosses
ChelseaLosses

ChelseaDraws <- ChelseaHomeDraws + ChelseaAwayDraws
ChelseaDraws

#WDL
ChelseaOverallRecord <- paste(ChelseaWins, ChelseaDraws, ChelseaLosses, sep = "-")
ChelseaHomeRecord <- paste(ChelseaHomeWins, ChelseaHomeDraws, ChelseaHomeLosses, 
                           sep = "-")
ChelseaAwayRecord <- paste(ChelseaAwayWins, ChelseaAwayDraws, ChelseaAwayLosses, 
                           sep = "-")
# Overall Record
ChelseaOverallRecord

# Home Record + Data
ChelseaHomeRecord
ChelseaHomeWinPayout
ChelseaOpponentHomePayout

# Away Record + Data
ChelseaAwayRecord
ChelseaAwayWinPayout
ChelseaOpponentAwayPayout

# Payout Betting Purely on Chelsea Winning at Home
ChelseaHomeBetting <- ChelseaHomeWins*(ChelseaHomeWinPayout-1) - 
  ChelseaHomeDraws - ChelseaHomeLosses
ChelseaHomeBetting

# Payout Betting Purely on Chelsea Winning Away
ChelseaAwayBetting <- ChelseaAwayWins*(ChelseaAwayWinPayout-1) - 
  ChelseaAwayDraws - ChelseaAwayLosses
ChelseaAwayBetting

ChelseaWinnings <- ChelseaHomeBetting + ChelseaAwayBetting
ChelseaWinnings