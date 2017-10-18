library(readxl)

b <- read_excel('/home/sjclark/Brood Tables/Original/Canadian non-Fraser sox prod data 1 Sept 2017 from data portal.xlsx', sheet = 2, col_types = c("skip", "text", "skip", "text", "text", "skip", "numeric", "skip", "numeric", "skip", "skip", "skip", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip", "skip"))
si <- read.csv('/home/sjclark/Brood Tables/Original/StockInfo.csv', stringsAsFactors = F)

b <- b[-c(1,2),]

#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4

colnames(b)[1] <- 'Species'
colnames(b)[2] <- 'Stock'
colnames(b)[4] <- 'BY'
colnames(b)[5] <- 'Escapement'


b$X__3 <- NULL #remove names of mixed stock data, the data wont be matched with the StockID table and will be removed later

b2 <- left_join(b, si)
b2$Use<- 1

b2 <- subset(b2, !is.na(Stock.ID))

colnames(b2) <- c("Species", "BY", "Escapement", "R1.1", "R1.2", "R2.1", "R1.3", "R2.2", "R1.4", "R2.3", "R2.4", "Stock", "Stock.ID", "Region", "Sub.Region", "Use")

#create missing columns and fill with NA
b2$R0.1<- NA; b2$R0.2<- NA; b2$R0.3<- NA; b2$R0.4<- NA; b2$R0.5 <- NA
b2$R1.5<- NA
b2$R3.1<- NA; b2$R3.2<- NA; b2$R3.3<- NA; b2$R3.4<- NA

b2 <- b2[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'Use',
           'BY','Escapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
           'R1.1','R1.2','R1.3','R1.4',    'R1.5', 
           'R2.1','R2.2','R2.3','R2.4',
           'R3.1','R3.2','R3.3','R3.4')]

write.csv(b2, '/home/sjclark/Brood Tables/Reformatted/CanadianNonFraser_sockeye_multipleStocks.csv', row.names = F)



