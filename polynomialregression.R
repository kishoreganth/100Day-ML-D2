# importing the dataset 
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# fitting the linear regression in the dataset 
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

# fitting the polynomial regression in the dataset 
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# visualising the linear regression model 
library('ggplot2')
ggplot() +
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff (linear regression)') +
  xlab('Level') +
  ylab('Salary')

# visualising the polynomial regression

ggplot() +
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff (Polynomial regression)') +
  xlab('Level') +
  ylab('Salary')

# predicting the new result for the linear regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# predicting the new result for polynomial regression 
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))



    