library("flowCore")
args <- commandArgs(trailingOnly=TRUE)
data <- read.FCS(args[1])
cols <- colnames(data)
cols <- cols[cols != 'CellID'] # do not logicle transform cell IDs
logicleTrans <- estimateLogicle(data, cols) # automatically estimate the logicle transformation based on the data
data <- transform(data, logicleTrans) # apply logicle transformation
write.table(exprs(data),file=paste('logicle', args[1], sep='-'), row.names=FALSE, quote=FALSE, sep=',') # write data to csv