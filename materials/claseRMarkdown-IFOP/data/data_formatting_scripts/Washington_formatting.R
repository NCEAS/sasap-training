library(readxl)

b <- read_excel('data/original/Lake WA Brood Table 2015.xlsx', sheet = 1, skip = 2)
colnames(b) <- c('Brood year', 'Parent Escapement', 'R1.1', 'R1.2', 'R1.3', 'Total', 'R/S', 'Ln R/S', 'Residual')
b <- b[-1,]

#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4

#remove unnecessary columns
b$Total <- NULL;
b$'R/S'<- NULL;
b$'Ln R/S'<- NULL;
b$Residual<- NULL;

# add columns
b$Stock <- 'Washington'
b$Stock.ID <- 101
b$Species <- 'Sockeye'
b$Region <- 'WA'
b$Sub.Region <- 'WA'
b$Use<- 1

colnames(b) <- c("BroodYear", "TotalEscapement", "R1.1", "R1.2", "R1.3", "Stock", "Stock.ID", "Species", "Region", "Sub.Region", "UseFlag")

#create missing columns and fill with NA
b$R0.1<- 0; b$R0.2<- 0; b$R0.3<- 0; b$R0.4<- 0; b$R0.5 <- 0
b$R1.4<- 0; b$R1.5<- 0
b$R2.1<- 0; b$R2.2<- 0; b$R2.3<- 0; b$R2.4<- 0
b$R3.1<- 0; b$R3.2<- 0; b$R3.3<- 0; b$R3.4<- 0

b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
           'R1.1','R1.2','R1.3','R1.4',    'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]

write.csv(b, 'data/reformatted/Washington_sockeye.csv', row.names = F)


