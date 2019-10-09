
  # Ввод данных
  data = data.frame(x = c(0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9, 2.1), y = c(4.32, 4.312, 4.252, 4.19, 4.24, 4.328, 4.498, 4.599, 4.831, 4.92))
  
  # Вспомогательный параметр для вывода
  x_extra = 0.5
  
  # Линейная функция
  
    ## Оценка модели
    model = lm(data=data, formula = y ~ x)
  
    ## Вывод результата
    model
    
    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(min(data$x) - x_extra, max(data$x) + x_extra, 0.01)  
    y = coef(model)[2] * x + coef(model)[1]
  
    title('Линейная функция')
    lines(x, y, col = 'blue')
  
  # Гиперболическая функция
    
    ## Оценка модели
    model = lm(data=data, formula = y ~ I(1/x))

    ## Вывод результата
    model

    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(min(data$x) - x_extra, max(data$x) + x_extra, 0.01)  
    y = coef(model)[2] / x + coef(model)[1]
    
    title('Гиперболическая функция')
    lines(x, y, col = 'blue')
    