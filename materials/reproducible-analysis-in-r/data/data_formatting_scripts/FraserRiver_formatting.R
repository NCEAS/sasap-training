library(readxl)

b <- read_excel('data/original/Fraser_SX_brood_tables_July2017.xlsx', sheet = 1)
si <- read.csv('Original/StockInfo.csv', stringsAsFactors = F)

#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4

#remove unnecessary columns
b$R.no.jacks <- NULL;
b$R.total.PSC <- NULL;
b$R <- NULL;
b$J<- NULL;
b$Skip<- NULL;
b$StockID<- NULL;

## change Use values
b$Use[!is.na(b$Use)] <- 1
b$Use[is.na(b$Use)] <- 0

b2 <- left_join(b, si)

#rename columns in european convention
colnames(b2) <- c("Stock","BroodYear", "TotalEscapement", "R0.1", "R0.2", "R1.1", "R0.3", "R1.2", "R2.1", "R1.3", "R2.2", "R1.4", "R2.3", "UseFlag", "Stock.ID", "Species", "Region", "Sub.Region")

#create missing columns and fill with 0
b2$R0.4 <- 0; b2$R0.5 <- 0;
b2$R1.5 <- 0;
b2$R2.4<- 0;
b2$R3.1<- 0; b2$R3.2<- 0; b2$R3.3<- 0;  b2$R3.4 <- 0;

b2 <- b2[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
           'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
           'R1.1','R1.2','R1.3','R1.4',    'R1.5',
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]


write.csv(b2, 'Reformatted/Fraser_sockeye_multipleStocks.csv', row.names = F)

