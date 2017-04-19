# Derby Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Derby Home Analysis
Derby_Home <- Derby %>%
  filter(HomeTeam == 'Derby')
DerbyHomeGames <- nrow(Derby_Home)
DerbyHomeGames

# Derby Home Wins
Derby_Home_Wins <- Derby %>%
  filter(HomeTeam == 'Derby' && FTR == 'H')
DerbyHomeWins <- nrow(Derby_Home_Wins)
DerbyHomeWins

DerbyHomeWinPayout <- mean(Derby_Home_Wins$BbAvH)
DerbyHomeWinPayout

# Derby Home Losses
Derby_Home_Losses <- Derby %>%
  filter(HomeTeam == 'Derby' && FTR == 'A')
DerbyHomeLosses <- nrow(Derby_Home_Losses)
DerbyHomeLosses

DerbyHomeLossPayout <- mean(Derby_Home_Losses$BbAvH)
DerbyHomeLossPayout

DerbyOpponentHomePayout <- mean(Derby_Home_Losses$BbAvA)
DerbyOpponentHomePayout

# Derby Away Analysis
Derby_Away <- Derby %>%
  filter(AwayTeam == 'Derby')
DerbyAwayGames <- nrow(Derby_Away)
DerbyAwayGames

# Derby Away Wins
Derby_Away_Wins <- Derby %>%
  filter(AwayTeam == 'Derby' && FTR == 'A')
DerbyAwayWins <- nrow(Derby_Away_Wins)
DerbyAwayWins

DerbyAwayWinPayout <- mean(Derby_Away_Wins$BbAvA)
DerbyAwayWinPayout

# Derby Away Losses
Derby_Away_Losses <- Derby %>%
  filter(AwayTeam == 'Derby' && FTR == 'H')
DerbyAwayLosses <- nrow(Derby_Home_Losses)
DerbyAwayLosses

DerbyAwayLossPayout <- mean(Derby_Away_Losses$BbAvA)
DerbyAwayLossPayout

DerbyOpponentAwayPayout <- mean(Derby_Away_Wins$BbAvH)
DerbyOpponentAwayPayout

# Derby Home Draws
Derby_Home_Draws <- Derby %>%
  filter(HomeTeam == 'Derby' && FTR == 'D')
DerbyHomeDraws <- nrow(Derby_Home_Draws)
DerbyHomeDraws

# Derby Away Draws
Derby_Away_Draws <- Derby %>%
  filter(AwayTeam == 'Derby' && FTR == 'D')
DerbyAwayDraws <- nrow(Derby_Away_Draws)
DerbyAwayDraws

# Derby Record
DerbyWins <- DerbyHomeWins + DerbyAwayWins
DerbyWins

DerbyLosses <- DerbyHomeLosses + DerbyAwayLosses
DerbyLosses

DerbyDraws <- DerbyHomeDraws + DerbyAwayDraws
DerbyDraws

#WDL
DerbyOverallRecord <- paste(DerbyWins, DerbyDraws, DerbyLosses, sep = "-")
DerbyHomeRecord <- paste(DerbyHomeWins, DerbyHomeDraws, DerbyHomeLosses, 
                           sep = "-")
DerbyAwayRecord <- paste(DerbyAwayWins, DerbyAwayDraws, DerbyAwayLosses, 
                           sep = "-")
# Overall Record
DerbyOverallRecord

# Home Record + Data
DerbyHomeRecord
DerbyHomeWinPayout
DerbyOpponentHomePayout

# Away Record + Data
DerbyAwayRecord
DerbyAwayWinPayout
DerbyOpponentAwayPayout

# Payout Betting Purely on Derby Winning at Home
DerbyHomeBetting <- DerbyHomeWins*(DerbyHomeWinPayout-1) - 
  DerbyHomeDraws - DerbyHomeLosses
DerbyHomeBetting

# Payout Betting Purely on Derby Winning Away
DerbyAwayBetting <- DerbyAwayWins*(DerbyAwayWinPayout-1) - 
  DerbyAwayDraws - DerbyAwayLosses
DerbyAwayBetting

DerbyWinnings <- DerbyHomeBetting
DerbyWinnings