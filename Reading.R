# Reading Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Reading Home Analysis
Reading_Home <- Reading %>%
  filter(HomeTeam == 'Reading')
ReadingHomeGames <- nrow(Reading_Home)
ReadingHomeGames

# Reading Home Wins
Reading_Home_Wins <- Reading %>%
  filter(HomeTeam == 'Reading' && FTR == 'H')
ReadingHomeWins <- nrow(Reading_Home_Wins)
ReadingHomeWins

ReadingHomeWinPayout <- mean(Reading_Home_Wins$BbAvH)
ReadingHomeWinPayout

# Reading Home Losses
Reading_Home_Losses <- Reading %>%
  filter(HomeTeam == 'Reading' && FTR == 'A')
ReadingHomeLosses <- nrow(Reading_Home_Losses)
ReadingHomeLosses

ReadingHomeLossPayout <- mean(Reading_Home_Losses$BbAvH)
ReadingHomeLossPayout

ReadingOpponentHomePayout <- mean(Reading_Home_Losses$BbAvA)
ReadingOpponentHomePayout

# Reading Away Analysis
Reading_Away <- Reading %>%
  filter(AwayTeam == 'Reading')
ReadingAwayGames <- nrow(Reading_Away)
ReadingAwayGames

# Reading Away Wins
Reading_Away_Wins <- Reading %>%
  filter(AwayTeam == 'Reading' && FTR == 'A')
ReadingAwayWins <- nrow(Reading_Away_Wins)
ReadingAwayWins

ReadingAwayWinPayout <- mean(Reading_Away_Wins$BbAvA)
ReadingAwayWinPayout

# Reading Away Losses
Reading_Away_Losses <- Reading %>%
  filter(AwayTeam == 'Reading' && FTR == 'H')
ReadingAwayLosses <- nrow(Reading_Away_Losses)
ReadingAwayLosses

ReadingAwayLossPayout <- mean(Reading_Away_Losses$BbAvA)
ReadingAwayLossPayout

ReadingOpponentAwayPayout <- mean(Reading_Away_Wins$BbAvH)
ReadingOpponentAwayPayout

# Reading Home Draws
Reading_Home_Draws <- Reading %>%
  filter(HomeTeam == 'Reading' && FTR == 'D')
ReadingHomeDraws <- nrow(Reading_Home_Draws)
ReadingHomeDraws

# Reading Away Draws
Reading_Away_Draws <- Reading %>%
  filter(AwayTeam == 'Reading' && FTR == 'D')
ReadingAwayDraws <- nrow(Reading_Away_Draws)
ReadingAwayDraws

# Reading Record
ReadingWins <- ReadingHomeWins + ReadingAwayWins
ReadingWins

ReadingLosses <- ReadingHomeLosses + ReadingAwayLosses
ReadingLosses

ReadingDraws <- ReadingHomeDraws + ReadingAwayDraws
ReadingDraws

#WDL
ReadingOverallRecord <- paste(ReadingWins, ReadingDraws, ReadingLosses, sep = "-")
ReadingHomeRecord <- paste(ReadingHomeWins, ReadingHomeDraws, ReadingHomeLosses, 
                           sep = "-")
ReadingAwayRecord <- paste(ReadingAwayWins, ReadingAwayDraws, ReadingAwayLosses, 
                           sep = "-")
# Overall Record
ReadingOverallRecord

# Home Record + Data
ReadingHomeRecord
ReadingHomeWinPayout
ReadingOpponentHomePayout

# Away Record + Data
ReadingAwayRecord
ReadingAwayWinPayout
ReadingOpponentAwayPayout

# Payout Betting Purely on Reading Winning at Home
ReadingHomeBetting <- ReadingHomeWins*(ReadingHomeWinPayout-1) - 
  ReadingHomeDraws - ReadingHomeLosses
ReadingHomeBetting

# Payout Betting Purely on Reading Winning Away
ReadingAwayBetting <- ReadingAwayWins*(ReadingAwayWinPayout-1) - 
  ReadingAwayDraws - ReadingAwayLosses
ReadingAwayBetting

ReadingWinnings <- ReadingHomeBetting + ReadingAwayBetting
ReadingWinnings