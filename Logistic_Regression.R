
unclean_data$EffectiveDelay<-abs(unclean_data$Departure.Delay.in.Minutes-unclean_data$Arrival.Delay.in.Minutes)
unclean_data$Departure.Delay.in.Minutes<-NULL
unclean_data$Arrival.Delay.in.Minutes<-NULL

