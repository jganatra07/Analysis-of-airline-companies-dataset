
str(data)

data_num = data[['Satisfaction','Age','Price.Sensitivity', 
                       'Year.of.First.Flight', 'No.of.Flights.p.a.',                     
                       'X..of.Flight.with.other.Airlines', 
                       'No..of.other.Loyalty.Cards',
                       'Shopping.Amount.at.Airport', 
                       'Eating.and.Drinking.at.Airport', 
                       'Day.of.Month',
                        'Scheduled.Departure.Hour',
                        'Flight.time.in.minutes',
                        'Flight.Distance ']].copy()
data_num.head()
