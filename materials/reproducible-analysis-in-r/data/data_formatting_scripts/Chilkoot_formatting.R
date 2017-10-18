library(readxl)

b <- read_excel('data/original/Chilkoot Lake brood table 2016.xlsx', sheet = 4, skip = 5)


#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4


#remove unnecessary columns
b <- b[, -c(19:39)]
b <- b[c(1:46),]


# add columns
b$Stock <- 'Chilkoot'
b$Stock.ID <- 131
b$Region <- "SEAK"
b$Sub.Region <- "SEAK"
b$Species <- 'Sockeye'
b$Use<- 1

colnames(b) <- c("BroodYear", "TotalEscapement", "R0.1", "R0.2", "R1.1", "R0.3", "R1.2", "R2.1", "R0.4", "R1.3", "R2.2", "R3.1", "R1.4", "R2.3", "R3.2", "R1.5", "R2.4", "R3.3", "Stock", "Stock.ID", "Region", "Sub.Region", "Species", "UseFlag")

#create missing columns and fill with NA
b$R0.5 <- 0
b$R3.4<- 0

b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
           'R1.1','R1.2','R1.3','R1.4',    'R1.5',
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]

write.csv(b, 'data/reformatted/Chilkoot_sockeye.csv', row.names = F)


