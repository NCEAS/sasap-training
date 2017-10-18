#Reformatting Goodnews brood table data
library(readxl)

b <- read_excel('data/original/Middle Fork Goodnews River Sockeye Brood Table.xlsx', sheet = 1, skip = 2)


#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 164
b$Species <- 'Sockeye'
b$Stock <- 'Goodnews'
b$Region <- 'AYK'
b$Sub.Region <- 'AYK'
b$Use <- 1
b$Return <- NULL; b$`R/S` <- NULL

colnames(b) <- c("BroodYear", "TotalEscapement","R0.2","R1.1","R0.3","R1.2","R0.4","R1.3","R2.2",  
                 "R1.4","R2.3","R3.2", "R2.4","R3.3","R3.4","Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")

#create missing columns and fill with NA
b$R0.1 <- 0; b$R0.4 <- 0; b$R0.5 <- 0
b$R1.5 <- 0
b$R2.1 <- 0
b$R3.1 <- 0; 


b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]

write.csv(b, 'data/reformatted/Goodnews_sockeye.csv', row.names = F)
