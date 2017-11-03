#Nelson River brood table formatting

library(readxl)

b <- read_excel('data/original/westward brood tables.xlsx', sheet = 3, skip = 5, n_max = 96)


#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 152
b$Species <- 'Sockeye'
b$Stock <- 'Chignik Lake'
b$Region <- 'Chignik'
b$Sub.Region <- 'Chignik'
b$Use <- 1
b$Total<- NULL;

colnames(b) <- c("BroodYear", "TotalEscapement","R0.1",'R0.2',"R1.1","R0.3","R1.2","R2.1","R1.3","R2.2",'R3.1', 'R0.4',
                 "R1.4","R2.3","R3.2", 'R1.5',"R2.4","R3.3","R4.2", 'R2.5', 'R3.4', 'R4.3',"Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")

#create missing columns and fill with NA
b$R0.5 <- 0



b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5',
           'R2.1','R2.2','R2.3','R2.4','R2.5',
           'R3.1','R3.2','R3.3','R3.4',
           'R4.2','R4.3')]

write.csv(b, 'data/reformatted/ChignikLake_sockeye.csv', row.names = F)
