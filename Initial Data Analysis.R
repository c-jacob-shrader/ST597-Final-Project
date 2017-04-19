# Arsenal Data Analysis Calculations and Visualization

# Arsenal Home Analysis
Arsenal_Home <- Arsenal %>%
  filter(HomeTeam == 'Arsenal')
ArsenalHomeGames <- nrow(Arsenal_Home)
ArsenalHomeGames

# Arsenal Home Wins
Arsenal_Home_Wins <- Arsenal %>%
  filter(HomeTeam == 'Arsenal' && FTR == 'H')
ArsenalHomeWins <- nrow(Arsenal_Home_Wins)
ArsenalHomeWins

ArsenalHomeWinPayout <- mean(Arsenal_Home_Wins$BbAvH)
ArsenalHomeWinPayout

# Arsenal Home Losses
Arsenal_Home_Losses <- Arsenal %>%
  filter(HomeTeam == 'Arsenal' && FTR == 'A')
ArsenalHomeLosses <- nrow(Arsenal_Home_Losses)
ArsenalHomeLosses
  
ArsenalHomeLossPayout <- mean(Arsenal_Home_Losses$BbAvH)
ArsenalOpponentHomePayout <- mean(Arsenal_Home_Losses$BbAvA)
ArsenalHomeLossPayout

# Arsenal Away Analysis
Arsenal_Away <- Arsenal %>%
  filter(AwayTeam == 'Arsenal')
ArsenalAwayGames <- nrow(Arsenal_Away)
ArsenalAwayGames

# Arsenal Away Wins
Arsenal_Away_Wins <- Arsenal %>%
  filter(AwayTeam == 'Arsenal' && FTR == 'A')
ArsenalAwayWins <- nrow(Arsenal_Away_Wins)
ArsenalAwayWins

ArsenalAwayWinPayout <- mean(Arsenal_Away_Wins$BbAvA)
ArsenalAwayWinPayout

# Arsenal Away Losses
Arsenal_Away_Losses <- Arsenal %>%
  filter(AwayTeam == 'Arsenal' && FTR == 'H')
ArsenalAwayLosses <- nrow(Arsenal_Home_Losses)
ArsenalAwayLosses

ArsenalAwayLossPayout <- mean(Arsenal_Away_Losses$BbAvA)
ArsenalOpponentAwayPayout <- mean(Arsenal_Away_Wins$BbAvH)
ArsenalAwayLossPayout
  
# Arsenal Record
ArsenalWins <- ArsenalHomeWins + ArsenalAwayWins
ArsenalWins

ArsenalLosses <- ArsenalHomeLosses + ArsenalAwayLosses
ArsenalLosses

ArsenalHomeDraws <- ArsenalHomeGames - ArsenalHomeWins - ArsenalHomeLosses
ArsenalAwayDraws <- ArsenalAwayGames - ArsenalAwayWins - ArsenalAwayLosses
ArsenalDraws <- ArsenalHomeDraws + ArsenalAwayDraws

#WDL
ArsenalOverallRecord <- paste(ArsenalWins, ArsenalDraws, ArsenalLosses, sep = "-")
ArsenalHomeRecord <- paste(ArsenalHomeWins, ArsenalHomeDraws, ArsenalHomeLosses, 
                           sep = "-")
ArsenalAwayRecord <- paste(ArsenalAwayWins, ArsenalAwayDraws, ArsenalAwayLosses, 
                           sep = "-")
# Overall Record
ArsenalOverallRecord

# Home Data
ArsenalHomeRecord
ArsenalHomeWinPayout
ArsenalOpponentHomePayout

# Away Data
ArsenalAwayRecord
ArsenalAwayWinPayout
ArsenalOpponentAwayPayout
