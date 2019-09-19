
  y1 = seq(0, 10, 0.1)
  y2 = seq(0, 10, 0.1)
  
  x1 = (16 - y1 ^ 2) / 6
  x2 = (y2 ^ 2) / 2   

  plot(x1, y1, type = 'l', col = 'black', ylim = c(-4, 4), xlim = c(0, 2.75), xlab = 'x', ylab = 'y')  
  lines(x2, y2, col = 'green')  
  
  y3 = seq(0, -10, -0.1)
  x3 = (16 - y1 ^ 2) / 6
  
  y4 = seq(0, -10, -0.1)
  x4 = (y4 ^ 2) / 2 
  
  lines(x3, y3, col = 'red')  
  lines(x4, y4, col = 'blue')

  abline(v =  8 / 3, lty = 'dashed')  
  abline(v =  0, lty = 'dashed')
  abline(h =  2, lty = 'dashed')
  abline(h = -2, lty = 'dashed')
  