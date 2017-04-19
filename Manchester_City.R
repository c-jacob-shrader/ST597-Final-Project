# Manchester_City Data Analysis Calculations and Visualization
library(tidyverse)
library(ggplot2)
wd(ST597 Final Project)
load('DataSet.RData')

# Manchester_City Home Analysis
Manchester_City_Home <- Manchester_City %>%
  filter(HomeTeam == 'Man City')
Manchester_CityHomeGames <- nrow(Manchester_City_Home)
Manchester_CityHomeGames

# Manchester_City Home Wins
Manchester_City_Home_Wins <- Manchester_City %>%
  filter(HomeTeam == 'Man City' && FTR == 'H')
Manchester_CityHomeWins <- nrow(Manchester_City_Home_Wins)
Manchester_CityHomeWins

Manchester_CityHomeWinPayout <- mean(Manchester_City_Home_Wins$BbAvH)
Manchester_CityHomeWinPayout

# Manchester_City Home Losses
Manchester_City_Home_Losses <- Manchester_City %>%
  filter(HomeTeam == 'Man City' && FTR == 'A')
Manchester_CityHomeLosses <- nrow(Manchester_City_Home_Losses)
Manchester_CityHomeLosses

Manchester_CityHomeLossPayout <- mean(Manchester_City_Home_Losses$BbAvH)
Manchester_CityHomeLossPayout

Manchester_CityOpponentHomePayout <- mean(Manchester_City_Home_Losses$BbAvA)
Manchester_CityOpponentHomePayout

# Manchester_City Away Analysis
Manchester_City_Away <- Manchester_City %>%
  filter(AwayTeam == 'Man City')
Manchester_CityAwayGames <- nrow(Manchester_City_Away)
Manchester_CityAwayGames

# Manchester_City Away Wins
Manchester_City_Away_Wins <- Manchester_City %>%
  filter(AwayTeam == 'Man City' && FTR == 'A')
Manchester_CityAwayWins <- nrow(Manchester_City_Away_Wins)
Manchester_CityAwayWins

Manchester_CityAwayWinPayout <- mean(Manchester_City_Away_Wins$BbAvA)
Manchester_CityAwayWinPayout

# Manchester_City Away Losses
Manchester_City_Away_Losses <- Manchester_City %>%
  filter(AwayTeam == 'Man City' && FTR == 'H')
Manchester_CityAwayLosses <- nrow(Manchester_City_Home_Losses)
Manchester_CityAwayLosses

Manchester_CityAwayLossPayout <- mean(Manchester_City_Away_Losses$BbAvA)
Manchester_CityAwayLossPayout

Manchester_CityOpponentAwayPayout <- mean(Manchester_City_Away_Wins$BbAvH)
Manchester_CityOpponentAwayPayout

# Manchester_City Home Draws
Manchester_City_Home_Draws <- Manchester_City %>%
  filter(HomeTeam == 'Man City' && FTR == 'D')
Manchester_CityHomeDraws <- nrow(Manchester_City_Home_Draws)
Manchester_CityHomeDraws

# Manchester_City Away Draws
Manchester_City_Away_Draws <- Manchester_City %>%
  filter(AwayTeam == 'Man City' && FTR == 'D')
Manchester_CityAwayDraws <- nrow(Manchester_City_Away_Draws)
Manchester_CityAwayDraws

# Manchester_City Record
Manchester_CityWins <- Manchester_CityHomeWins + Manchester_CityAwayWins
Manchester_CityWins

Manchester_CityLosses <- Manchester_CityHomeLosses + Manchester_CityAwayLosses
Manchester_CityLosses

Manchester_CityDraws <- Manchester_CityHomeDraws + Manchester_CityAwayDraws
Manchester_CityDraws

#WDL
Manchester_CityOverallRecord <- paste(Manchester_CityWins, Manchester_CityDraws, Manchester_CityLosses, sep = "-")
Manchester_CityHomeRecord <- paste(Manchester_CityHomeWins, Manchester_CityHomeDraws, Manchester_CityHomeLosses, 
                           sep = "-")
Manchester_CityAwayRecord <- paste(Manchester_CityAwayWins, Manchester_CityAwayDraws, Manchester_CityAwayLosses, 
                           sep = "-")
# Overall Record
Manchester_CityOverallRecord

# Home Record + Data
Manchester_CityHomeRecord
Manchester_CityHomeWinPayout
Manchester_CityOpponentHomePayout

# Away Record + Data
Manchester_CityAwayRecord
Manchester_CityAwayWinPayout
Manchester_CityOpponentAwayPayout

# Payout Betting Purely on Manchester_City Winning at Home
Manchester_CityHomeBetting <- Manchester_CityHomeWins*(Manchester_CityHomeWinPayout-1) - 
  Manchester_CityHomeDraws - Manchester_CityHomeLosses
Manchester_CityHomeBetting

# Payout Betting Purely on Manchester_City Winning Away
Manchester_CityAwayBetting <- Manchester_CityAwayWins*(Manchester_CityAwayWinPayout-1) - 
  Manchester_CityAwayDraws - Manchester_CityAwayLosses
Manchester_CityAwayBetting

Manchester_CityWinnings <- Manchester_CityHomeBetting + Manchester_CityAwayBetting
Manchester_CityWinnings