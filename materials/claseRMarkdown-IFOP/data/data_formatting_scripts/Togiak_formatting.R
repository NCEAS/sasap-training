library(readxl)

b <- read_excel('data/original/TogiakSockeye.xlsx', sheet = 1, skip = 8)


#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4


#remove unnecessary columns
b <- b[c(3:69),]
b <- b[, -c(3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37:40)]


# add columns
b$Stock <- 'Togiak'
b$Stock.ID <- 163
b$Region <- "Bristol Bay"
b$Sub.Region <- "Bristol Bay North"
b$Species <- 'Sockeye'
b$Use<- 1

colnames(b) <- c("BroodYear", "TotalEscapement", "R0.2", "R1.1", "R0.3", "R1.2", "R2.1", "R0.4", "R1.3", "R2.2", "R3.1", "R0.5", "R1.4", "R2.3", "R3.2", "R1.5", "R2.4", "R3.3", "R3.4", "Stock", "Stock.ID", "Region", "Sub.Region", "Species", "UseFlag")

#create missing columns and fill with NA
b$R0.1<- 0; 


b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
           'R1.1','R1.2','R1.3','R1.4',    'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]


write.csv(b, 'data/reformatted/Togiak_sockeye.csv', row.names = F)
