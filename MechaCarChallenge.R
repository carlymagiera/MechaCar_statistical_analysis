#Deliverable 1: linear regression to predict MPG-----

#install packages
library(tidyverse)

#read csv
car_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +ground_clearance + AWD,data=car_table)
#summary stats
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +ground_clearance + AWD,data=car_table))

## Linear Regression to Predict MPG
###Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
  #vehicle_weight, ground_clearance

###Is the slope of the linear model considered to be zero? Why or why not?
  #no, reject null hypothesis 

###Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
  #yes -> r-squared value
#Deliverable 2: Create visualizations for the trip analysis-------
#read csv
coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#summary stats of suspension coil's psi column
total_summary <- coil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
#lot summary stats table
lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

## Summary Statistics on Suspension Coils
###The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?
  #?do we look at sd because the units are psi or do we look at var-would the units be psi^2?
  #if sd -> all lots pass
  #if var -> lots 1 and 2 pass

#Deliverable 3: T-tests on suspension coils-----
#t.test to determine if psi across manufacturing lots is statistically different from pop. mean of 1,500 psi.
# h0 <- mu = 1500, ha <- mu /= 1500
t.test(coil_table$PSI, mu = 1500)
#t.tests to determine if each lot is statistically different from pop. mean 1500.
#lot 1
lot_1 <- subset(coil_table, Manufacturing_Lot == 'Lot1' )
t.test(lot_1$PSI, mu = 1500)
#lot 2
lot_2 <- subset(coil_table, Manufacturing_Lot == 'Lot2' )
t.test(lot_2$PSI, mu = 1500)
#lot 3
lot_3 <- subset(coil_table, Manufacturing_Lot == 'Lot3' )
t.test(lot_3$PSI, mu = 1500)

## T-Tests on Suspension Coils
###summarize t.test results 
  # all -> fail to reject null
  # lot1 -> fail to reject null 
  # lot2 -> fail to reject null
  # lot3 -> reject null