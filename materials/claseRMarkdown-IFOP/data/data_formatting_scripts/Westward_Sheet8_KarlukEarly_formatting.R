
#Karluk Early Run brood table formatting

library(readxl)

b <- read_excel('data/original/westward brood tables.xlsx', sheet = 8, skip = 5, n_max = 41)



#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 149
b$Species <- 'Sockeye'
b$Stock <- 'Early Karluk'
b$Region <- 'Kodiak'
b$Sub.Region <- 'Kodiak'
b$Use <- 1
b$return <- NULL;
b$`8yo` <- NULL; b$`9yo` <- NULL

colnames(b) <- c("BroodYear", "TotalEscapement","R0.1",'R0.2',"R1.1","R0.3","R1.2","R2.1", 'R0.4', "R1.3","R2.2",'R3.1',
                 "R1.4","R2.3","R3.2",'R4.1',"R2.4", "R3.3",'R4.2',"Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")

#create missing columns and fill with NA
b$R0.5 <- 0
b$R1.5 <- 0
b$R3.4 <- 0


b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4',
           'R4.1', 'R4.2')]

write.csv(b, 'data/reformatted/KarlukEarly_sockeye.csv', row.names = F)
