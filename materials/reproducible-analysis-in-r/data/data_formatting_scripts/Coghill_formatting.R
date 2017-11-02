#Reformatting Coghill brood table data
library(readxl)
b <- read_excel('original/112_COGHILL_BROOD_TABLE.xls', skip = 6)

b <- b[1:53, ]
#get rid of the return year, total return, return/spawner columns, and two stray columns

b$Year__1 <- NULL
b$Year__2 <- NULL
b$Year__3 <- NULL
b$Year__4 <- NULL
b$Year__5 <- NULL
b$Year__6 <- NULL
b$Return <- NULL
b$Return__1 <- NULL
b$`Return/spawner` <- NULL


#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 139
b$Species <- 'Sockeye'
b$Stock <- 'Coghill'
b$Region <- 'PWS'
b$Sub.Region <- 'PWS'
b$Use <- 1

colnames(b) <- c("BroodYear", "TotalEscapement","R1.1","R0.2","R0.3","R1.2","R2.1","R1.3","R2.2",
"R1.4","R2.3","R2.4","Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")

#create missing columns and fill with NA
b$R0.1 <- 0; b$R0.4 <- 0; b$R0.5 <- 0
b$R1.5 <- 0
b$R3.1 <- 0; b$R3.2 <- 0; b$R3.3<- 0; b$R3.4 <- 0


b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5',
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]



write.csv(b, 'data/reformatted/Coghill_sockeye.csv', row.names = F)


