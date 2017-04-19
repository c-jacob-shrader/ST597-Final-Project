# Leicester Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Leicester Home Analysis
Leicester_Home <- Leicester %>%
  filter(HomeTeam == 'Leicester')
LeicesterHomeGames <- nrow(Leicester_Home)
LeicesterHomeGames

# Leicester Home Wins
Leicester_Home_Wins <- Leicester %>%
  filter(HomeTeam == 'Leicester' && FTR == 'H')
LeicesterHomeWins <- nrow(Leicester_Home_Wins)
LeicesterHomeWins

LeicesterHomeWinPayout <- mean(Leicester_Home_Wins$BbAvH)
LeicesterHomeWinPayout

# Leicester Home Losses
Leicester_Home_Losses <- Leicester %>%
  filter(HomeTeam == 'Leicester' && FTR == 'A')
LeicesterHomeLosses <- nrow(Leicester_Home_Losses)
LeicesterHomeLosses

LeicesterHomeLossPayout <- mean(Leicester_Home_Losses$BbAvH)
LeicesterHomeLossPayout

LeicesterOpponentHomePayout <- mean(Leicester_Home_Losses$BbAvA)
LeicesterOpponentHomePayout

# Leicester Away Analysis
Leicester_Away <- Leicester %>%
  filter(AwayTeam == 'Leicester')
LeicesterAwayGames <- nrow(Leicester_Away)
LeicesterAwayGames

# Leicester Away Wins
Leicester_Away_Wins <- Leicester %>%
  filter(AwayTeam == 'Leicester' && FTR == 'A')
LeicesterAwayWins <- nrow(Leicester_Away_Wins)
LeicesterAwayWins

LeicesterAwayWinPayout <- mean(Leicester_Away_Wins$BbAvA)
LeicesterAwayWinPayout

# Leicester Away Losses
Leicester_Away_Losses <- Leicester %>%
  filter(AwayTeam == 'Leicester' && FTR == 'H')
LeicesterAwayLosses <- nrow(Leicester_Home_Losses)
LeicesterAwayLosses

LeicesterAwayLossPayout <- mean(Leicester_Away_Losses$BbAvA)
LeicesterAwayLossPayout

LeicesterOpponentAwayPayout <- mean(Leicester_Away_Wins$BbAvH)
LeicesterOpponentAwayPayout

# Leicester Home Draws
Leicester_Home_Draws <- Leicester %>%
  filter(HomeTeam == 'Leicester' && FTR == 'D')
LeicesterHomeDraws <- nrow(Leicester_Home_Draws)
LeicesterHomeDraws

# Leicester Away Draws
Leicester_Away_Draws <- Leicester %>%
  filter(AwayTeam == 'Leicester' && FTR == 'D')
LeicesterAwayDraws <- nrow(Leicester_Away_Draws)
LeicesterAwayDraws

# Leicester Record
LeicesterWins <- LeicesterHomeWins + LeicesterAwayWins
LeicesterWins

LeicesterLosses <- LeicesterHomeLosses + LeicesterAwayLosses
LeicesterLosses

LeicesterDraws <- LeicesterHomeDraws + LeicesterAwayDraws
LeicesterDraws

#WDL
LeicesterOverallRecord <- paste(LeicesterWins, LeicesterDraws, LeicesterLosses, sep = "-")
LeicesterHomeRecord <- paste(LeicesterHomeWins, LeicesterHomeDraws, LeicesterHomeLosses, 
                           sep = "-")
LeicesterAwayRecord <- paste(LeicesterAwayWins, LeicesterAwayDraws, LeicesterAwayLosses, 
                           sep = "-")
# Overall Record
LeicesterOverallRecord

# Home Record + Data
LeicesterHomeRecord
LeicesterHomeWinPayout
LeicesterOpponentHomePayout

# Away Record + Data
LeicesterAwayRecord
LeicesterAwayWinPayout
LeicesterOpponentAwayPayout

# Payout Betting Purely on Leicester Winning at Home
LeicesterHomeBetting <- LeicesterHomeWins*(LeicesterHomeWinPayout-1) - 
  LeicesterHomeDraws - LeicesterHomeLosses
LeicesterHomeBetting

# Payout Betting Purely on Leicester Winning Away
LeicesterAwayBetting <- LeicesterAwayWins*(LeicesterAwayWinPayout-1) - 
  LeicesterAwayDraws - LeicesterAwayLosses
LeicesterAwayBetting

LeicesterWinnings <- LeicesterHomeBetting + LeicesterAwayBetting
LeicesterWinnings