seasonhomepayout <- function(season, teamname, resulthome){
  Home_Wins <- season %>%
    filter(HomeTeam == teamname) %>%
    filter(FTR == resulthome)
  
  HomeWinPayout <- mean(Home_Wins$BbAvH)
  HomeWinPayout
}

seasonawaypayout <- function(season, teamname, resultaway){
  Away_Wins <- season %>%
    filter(AwayTeam == teamname) %>%
    filter(FTR == resultaway)
  
  AwayWinPayout <- mean(Away_Wins$BbAvA)
  AwayWinPayout
}

visualizehome <- function(data){
  
  ggplot(data) +
    geom_point(aes(x = Season, y = HomePayouts)) 
  
}

visualizeaway <- function(data){
 
   ggplot(data) +
    geom_point(aes(x = Season, y = AwayPayouts)) 
  
}

hometrend <- function(teamname, resulthome, resultaway){
  
  a <- seasonhomepayout(OO5_OO6_adjusted, teamname, resulthome)
  aa <- seasonawaypayout(OO5_OO6_adjusted, teamname, resultaway)
  
  b <- seasonhomepayout(OO6_OO7_adjusted, teamname, resulthome)
  bb<- seasonawaypayout(OO6_OO7_adjusted, teamname, resultaway)
  
  c <- seasonhomepayout(OO7_OO8_adjusted, teamname, resulthome)
  cc <- seasonawaypayout(OO7_OO8_adjusted, teamname, resultaway)
  
  d <- seasonhomepayout(OO8_OO9_adjusted, teamname, resulthome)
  dd <- seasonawaypayout(OO8_OO9_adjusted, teamname, resultaway)
  
  e <- seasonhomepayout(OO9_O10_adjusted, teamname, resulthome) 
  ee <- seasonawaypayout(OO9_O10_adjusted, teamname, resultaway)
  
  f <- seasonhomepayout(O10_O11_adjusted, teamname, resulthome)
  ff <-seasonawaypayout(O10_O11_adjusted, teamname, resultaway)
  
  g <- seasonhomepayout(O11_O12_adjusted, teamname, resulthome)
  gg <-seasonawaypayout(O11_O12_adjusted, teamname, resultaway)
  
  h <- seasonhomepayout(O12_O13_adjusted, teamname, resulthome)
  hh <- seasonawaypayout(O12_O13_adjusted, teamname, resultaway)
  
  i <- seasonhomepayout(O13_O14_adjusted, teamname, resulthome)
  ii <- seasonawaypayout(O13_O14_adjusted, teamname, resultaway)
  
  j <- seasonhomepayout(O14_O15_adjusted, teamname, resulthome)
  jj <-seasonawaypayout(O14_O15_adjusted, teamname, resultaway)
    
  Season <- c('005-006', '006-007', '007-008','008-009', '009-010', '010-011', 
               '011-012','012-013', '013-014', '014-015')
  
  HomePayouts <- c(a, b, c, d, e, f, g, h, i, j)
  
  AwayPayouts <- c(aa, bb, cc, dd, ee, ff, gg, hh, ii, jj)
  
  seasonspayouts <- data.frame(Season, HomePayouts, AwayPayouts)
  
  visualizehome(seasonspayouts) 
  
}

awaytrend <- function(teamname, resulthome, resultaway){
  
  a <- seasonhomepayout(OO5_OO6_adjusted, teamname, resulthome)
  aa <- seasonawaypayout(OO5_OO6_adjusted, teamname, resultaway)
  
  b <- seasonhomepayout(OO6_OO7_adjusted, teamname, resulthome)
  bb<- seasonawaypayout(OO6_OO7_adjusted, teamname, resultaway)
  
  c <- seasonhomepayout(OO7_OO8_adjusted, teamname, resulthome)
  cc <- seasonawaypayout(OO7_OO8_adjusted, teamname, resultaway)
  
  d <- seasonhomepayout(OO8_OO9_adjusted, teamname, resulthome)
  dd <- seasonawaypayout(OO8_OO9_adjusted, teamname, resultaway)
  
  e <- seasonhomepayout(OO9_O10_adjusted, teamname, resulthome) 
  ee <- seasonawaypayout(OO9_O10_adjusted, teamname, resultaway)
  
  f <- seasonhomepayout(O10_O11_adjusted, teamname, resulthome)
  ff <-seasonawaypayout(O10_O11_adjusted, teamname, resultaway)
  
  g <- seasonhomepayout(O11_O12_adjusted, teamname, resulthome)
  gg <-seasonawaypayout(O11_O12_adjusted, teamname, resultaway)
  
  h <- seasonhomepayout(O12_O13_adjusted, teamname, resulthome)
  hh <- seasonawaypayout(O12_O13_adjusted, teamname, resultaway)
  
  i <- seasonhomepayout(O13_O14_adjusted, teamname, resulthome)
  ii <- seasonawaypayout(O13_O14_adjusted, teamname, resultaway)
  
  j <- seasonhomepayout(O14_O15_adjusted, teamname, resulthome)
  jj <-seasonawaypayout(O14_O15_adjusted, teamname, resultaway)
  
  Season <- c('005-006', '006-007', '007-008','008-009', '009-010', '010-011', 
              '011-012','012-013', '013-014', '014-015')
  
  HomePayouts <- c(a, b, c, d, e, f, g, h, i, j)
  
  AwayPayouts <- c(aa, bb, cc, dd, ee, ff, gg, hh, ii, jj)
  
  seasonspayouts <- data.frame(Season, HomePayouts, AwayPayouts)
  
  visualizeaway(seasonspayouts)
  
}

