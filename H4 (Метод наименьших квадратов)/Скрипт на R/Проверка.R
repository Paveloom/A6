
  # Ввод данных
  data = data.frame(x = c(0.3, 0.5, 0.7, 0.9, 1.1, 1.3, 1.5, 1.7, 1.9, 2.1), y = c(4.32, 4.312, 4.252, 4.19, 4.24, 4.328, 4.498, 4.599, 4.831, 4.92))
  
  # Вспомогательные параметры для вывода
  x_extra = 0.2
  seq_min = min(data$x) - x_extra
  seq_max = max(data$x) + x_extra
  
  # Линейная функция
  
    ## Оценка модели
    model = lm(data=data, formula = y ~ x)
  
    ## Вывод результата
    model
    
    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(seq_min, seq_max, 0.01)  
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
    
    x = seq(seq_min, seq_max, 0.01)  
    y = coef(model)[2] / x + coef(model)[1]
    
    title('Гиперболическая функция')
    lines(x, y, col = 'blue')
    
  # Логарифмическая функция
    
    ## Оценка модели
    model = lm(data=data, formula = y ~ log(x))
    
    ## Вывод результата
    model
    
    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(seq_min, seq_max, 0.01)  
    y = coef(model)[2] * log(x) + coef(model)[1]
    
    title('Логарифмическая функция')
    lines(x, y, col = 'blue')
    
  # Экспоненциальная функция
    
    ## Оценка модели (здесь: y = b * exp(x) + a, поэтому расходится с программой)
    model = lm(data=data, formula = y ~ exp(x)) 
    
    ## Вывод результата
    model
    
    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(seq_min, seq_max, 0.01)  
    y = coef(model)[2] * exp(x) + coef(model)[1]
    
    title('Экспоненциальная функция')
    lines(x, y, col = 'red', lty = 'dashed')
    
    ## Сравнение с результатом, полученным программой
    
    y = 4.04298820405654 * exp(x * 0.0785341057422060)
    lines(x, y, col = 'blue')
    
  # Квадратичная функция
    
    ## Оценка модели (здесь: y = b * exp(x) + a, поэтому расходится с программой)
    model = lm(data=data, formula = y ~ x + I(x^2)) 
    
    ## Вывод результата
    model
    
    ## Построение графика по полученному результату
    
    plot(data)
    
    x = seq(seq_min, seq_max, 0.01)  
    y = coef(model)[3] * x ** 2 + coef(model)[2] * x + coef(model)[1]
    
    title('Квадратичная функция')
    lines(x, y, col = 'blue')

