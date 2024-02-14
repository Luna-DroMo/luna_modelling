rm(list=ls())
setwd("/Users/dennisperrett/Documents/LUNA/luna_dev_2.0/luna_modelling")

tx = read.table("./data/data_scales/TX/tx_long.csv",sep=",",header = T)      # S

head(tx)

columns <- c("PANP01_state","PANP05_state","PANP08_state", "PANN01_state",
             "PANN05_state", "PANN09_state")
(N <- nrow(unique(tx["studentID"])))
(M <- nrow(unique(tx["meas"])))
(I <- length(columns))

mat.to.use <- array(NA, dim = c(N, M, I))

for (idx in seq_along(unique(tx[["studentID"]]))) {
  for (idy in seq_along(unique(tx[["meas"]]))) {
    st <- unique(tx[["studentID"]][idx])
    meas <- unique(tx[["meas"]][idy])
    print(paste(idx,idy))
    print(tx[tx$studentID==st & tx$meas == meas,columns])
    if (length(as.matrix(tx[tx$studentID==st & tx$meas == meas,columns]))>0){
      mat.to.use[idx,idy,] <- as.matrix(tx[tx$studentID==st & tx$meas == meas,columns])
    }
    
  }
}


dat <- mat.to.use
