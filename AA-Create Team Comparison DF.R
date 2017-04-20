# Script creates a simple table to compare team winnings

Team <- c('Arsenal', 'Aston_Villa', 'Birmingham', 'Blackburn', 'Blackpool', 'Bolton',
          'Burnley', 'Cardiff', 'Charlton', 'Chelsea', 'Crystal_Palace', 'Derby', 
          'Everton', 'Fulham', 'Hull', 'Leicester', 'Liverpool', 'Man_United', 
          'Man_City', 'Newcastle', 'Norwich', 'Portsmouth', 'QPR', 'Reading', 
          'Sheffield_United', 'Southampton', 'Stoke', 'Sunderland', 'Swansea', 
          'Tottenham', 'Watford', 'West_Brom', 'West_Ham', 'Wigan', 'Wolves')

Wins <- c(ArsenalWins, Aston_VillaWins, BirminghamWins, BlackburnWins,
          BlackpoolWins, BoltonWins, BurnleyWins, CardiffWins, CharltonWins,
          ChelseaWins, Crystal_PalaceWins, DerbyWins, EvertonWins, 
          FulhamWins, HullWins, LeicesterWins, LiverpoolWins, 
          Man_UnitedWins, Manchester_CityWins, NewcastleWins, NorwichWins, 
          PortsmouthWins, QPRWins, ReadingWins, Sheffield_UnitedWins, 
          SouthamptonWins, StokeWins, SunderlandWins, SwanseaWins, 
          TottenhamWins, WatfordWins, West_BromWins, West_HamWins, 
          WiganWins, WolvesWins)

Draws <- c(ArsenalDraws, Aston_VillaDraws, BirminghamDraws, BlackburnDraws,
           BlackpoolDraws, BoltonDraws, BurnleyDraws, CardiffDraws, CharltonDraws,
           ChelseaDraws, Crystal_PalaceDraws, DerbyDraws, EvertonDraws, 
           FulhamDraws, HullDraws, LeicesterDraws, LiverpoolDraws, 
           Man_UnitedDraws, Manchester_CityDraws, NewcastleDraws, NorwichDraws, 
           PortsmouthDraws, QPRDraws, ReadingDraws, Sheffield_UnitedDraws, 
           SouthamptonDraws, StokeDraws, SunderlandDraws, SwanseaDraws, 
           TottenhamDraws, WatfordDraws, West_BromDraws, West_HamDraws, 
           WiganDraws, WolvesDraws)

Losses <- c(ArsenalLosses, Aston_VillaLosses, BirminghamLosses, BlackburnLosses,
            BlackpoolLosses, BoltonLosses, BurnleyLosses, CardiffLosses, CharltonLosses,
            ChelseaLosses, Crystal_PalaceLosses, DerbyLosses, EvertonLosses, 
            FulhamLosses, HullLosses, LeicesterLosses, LiverpoolLosses, 
            Man_UnitedLosses, Manchester_CityLosses, NewcastleLosses, NorwichLosses, 
            PortsmouthLosses, QPRLosses, ReadingLosses, Sheffield_UnitedLosses, 
            SouthamptonLosses, StokeLosses, SunderlandLosses, SwanseaLosses, 
            TottenhamLosses, WatfordLosses, West_BromLosses, West_HamLosses, 
            WiganLosses, WolvesLosses)

Winnings <- c(ArsenalWinnings, Aston_VillaWinnings, BirminghamWinnings, BlackburnWinnings,
              BlackpoolWinnings, BoltonWinnings, BurnleyWinnings, CardiffWinnings, CharltonWinnings,
              ChelseaWinnings, Crystal_PalaceWinnings, DerbyWinnings, EvertonWinnings, 
              FulhamWinnings, HullWinnings, LeicesterWinnings, LiverpoolWinnings, 
              Man_UnitedWinnings, Manchester_CityWinnings, NewcastleWinnings, NorwichWinnings, 
              PortsmouthWinnings, QPRWinnings, ReadingWinnings, Sheffield_UnitedWinnings, 
              SouthamptonWinnings, StokeWinnings, SunderlandWinnings, SwanseaWinnings, 
              TottenhamWinnings, WatfordWinnings, West_BromWinnings, West_HamWinnings, 
              WiganWinnings, WolvesWinnings)

team.comparison <- data.frame(Team, Wins, Draws, Losses, Winnings)%>%
  arrange(desc(Winnings))