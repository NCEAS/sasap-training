library(readxl)





#colnames: Stock.ID    Species    Stock    Region    Sub.Region    Use    BY    Escapement    R0.1    R0.2    R0.3    R0.4    R0.5    R1.1    R1.2    R1.3    R1.4    R1.5    R2.1    R2.2    R2.3    R2.4    R3.1    R3.2    R3.3    R3.4
reformat_bristolbay <- function(sheetnumber, stock.ID, stock, Sub.Region){
    b <- read_excel('data/original/2016 Bristol Bay Updated Brood Table 11.4.16.xlsx', sheet = sheetnumber, skip = 1)

    #remove unnecessary columns
    b$Recruits <- NULL;
    b$'R/S' <- NULL;

    # add columns
    b$Stock.ID <- stock.ID
    b$Species <- 'Sockeye'
    b$Stock <- stock
    b$Region <- 'Bristol Bay'
    b$Sub.Region <- Sub.Region
    b$UseFlag <- 1 #placeholder column for WG to evaluate later


    colnames(b) <- c("BroodYear", 'R0.1',"R0.2","R0.3","R0.4","R0.5", "R1.1","R1.2",'R1.3',"R1.4","R1.5","R2.1",
                     'R2.2',"R2.3", 'R2.4',"R3.1", "R3.2", "R3.3","R3.4", "TotalEscapement", "Stock.ID","Species",'Stock',"Region","Sub.Region","UseFlag")



    b <- b[, c('Stock.ID', 'Species', 'Stock','Region','Sub.Region', 'UseFlag',
               'BroodYear','TotalEscapement','R0.1','R0.2', 'R0.3',    'R0.4',    'R0.5',
               'R1.1','R1.2','R1.3','R1.4',    'R1.5',
               'R2.1','R2.2','R2.3','R2.4',
               'R3.1','R3.2','R3.3','R3.4')]

    path_base <- ('reformatted/')
    path_end <- ('_sockeye.csv')

    write.csv(b, paste(path_base, stock, path_end, sep = ''), row.names = F)
}
#reformat_bristolbay <- function(sheetnumber, stock.ID, stock, Sub.Region)
reformat_bristolbay(1, 162 ,'Igushik', 'Bristol Bay North')
reformat_bristolbay(2, 161 ,'Wood', 'Bristol Bay North')
reformat_bristolbay(3, 160 ,'Nushagak', 'Bristol Bay North')
reformat_bristolbay(4, 159 ,'Kvichak', 'Bristol Bay South')
reformat_bristolbay(5, 158 ,'Alagnak', 'Bristol Bay South')
reformat_bristolbay(6, 157 ,'Naknek', 'Bristol Bay South')
reformat_bristolbay(7, 156 ,'Egegik', 'Bristol Bay South')
reformat_bristolbay(8, 155 ,'Ugashik', 'Bristol Bay South')



