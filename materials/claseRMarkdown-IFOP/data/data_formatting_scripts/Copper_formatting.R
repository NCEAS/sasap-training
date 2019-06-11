#copper river formatting
library(readxl)

b <- read_excel('data/original/Copper_River_Catch_byAge_SOCKEYE.xls.xlsx', skip = 6, sheet = 17)

b <- b[2:57, -c(20:39)]

b$X__10 <- NULL
b$Brood__1 <- NULL


#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 138
b$Species <- 'Sockeye'
b$Stock <- 'Copper'
b$Region <- 'PWS'
b$Sub.Region <- 'PWS'
b$Use <- 1


colnames(b) <- c("BroodYear","R0.1","R0.2","R1.1","R0.3",'R1.2',"R2.1",'R0.4',"R1.3","R2.2",'R1.4',  
                 "R2.3","R3.2",'R1.5','R2.4','R3.3','TotalEscapement',"Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")




#create missing columns and fill with NA
#age classes
#R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4


b$R0.5 <- 0
b$R3.1 <- 0; b$R3.4 <- 0

#put columns in the correct order for the sheet
b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]


write.csv(b, 'data/reformatted/Copper_sockeye.csv', row.names = F)

