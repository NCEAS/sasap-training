#Reformatting Eshamy brood table data

b <- read.csv('Original/Eshamy_Sockeye.csv', stringsAsFactors = F)
#convert to numeric

b <- lapply(b, as.numeric)
b <- as.data.frame(b)


#colnames: Stock.ID	Species	Stock	Region	Sub.Region	Use	BY	Escapement	R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4

b$Stock.ID <- 140
b$Species <- 'Sockeye'
b$Stock <- 'Eshamy'
b$Region <- 'PWS'
b$Sub.Region <- 'PWS'
b$Use <- 1

colnames(b) <- c("BroodYear", "TotalEscapement","R0.1","R0.2","R1.1","R1.2","R2.1","R1.3","R2.2",  
                 "R2.3","R3.2","Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")
#find where there are no real escapement values and write Use == 0 for these rows
#most of these will be no weir data
i <- which(is.na(b$Escapement) == TRUE)
b$Use[i] <- 0

#create missing columns and fill with NA
#age classes
#R0.1	R0.2	R0.3	R0.4	R0.5	R1.1	R1.2	R1.3	R1.4	R1.5	R2.1	R2.2	R2.3	R2.4	R3.1	R3.2	R3.3	R3.4


b$R0.3 <- 0; b$R0.4 <- 0; b$R0.5 <- 0
b$R1.4 <- 0; b$R1.5 <- 0
b$R2.4 <- 0
b$R3.1 <- 0; b$R3.3<- 0; b$R3.4 <- 0

#put columns in the correct order for the sheet
b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',	'R0.4',	'R0.5',
           'R1.1','R1.2','R1.3','R1.4',	'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]


write.csv(b, 'data/reformatted/Eshamy_sockeye.csv', row.names = F)



