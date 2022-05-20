#Deliverable 1: linear regression to predict MPG-----
#install packages
library(tidyverse)
#read csv
car_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +ground_clearance + AWD,data=car_table)
#summary stats
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +ground_clearance + AWD,data=car_table))


#Deliverable 2: Create visualizations for the trip analysis-------
#read csv
coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#summary stats of suspension coil's psi column
total_summary <- coil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
#lot summary stats table
lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')


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
