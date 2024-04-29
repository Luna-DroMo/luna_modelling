library(R2jags)

setwd("/Users/dennisperrett/Documents/LUNA/luna_dev_2.0/luna_modelling")

# Load TX data
tx <- read.csv('data/data_scales/TX/tx_long.csv')

# Fill missing values with 2 (for now)
tx[is.na(tx)] <- 2

# Make sure everything is ok
head(tx)

# Define model path
model <- "luna_ssm_simple.txt"

# Set some data for the model to test on
test.data <- tx[,3:28]


# MAX OBS (T) IS 50
# Num Vars = 26
# Num students is 117
data <- array(NA, c(117, 50, 26 ))
students <- unique(tx$studentID)
meas <- unique(tx$meas)

# Create matrix/array/tensor for data of (i, t, k)
for (i in 1:117){
  for (t in 1:50){
    row <- as.numeric(tx[(tx$studentID==students[i]) & (tx$meas==meas[t]),3:28])
    if (length(row) > 4){
      data[i,t,] <- row
    }
  }
}

data[is.na(data)] <- 2

# Define with parameters we want
params <- c("state","H", "precision_observation")

data_shape <- dim(test.data)
precision_observation <- diag(K)


# Define which data gets input into the JAGS function
data.jags <- list(y=test.data, N= K = data_shape[2], T = data_shape[1],
                  precision_observation = precision_observation)


# Run the model
model1 <- jags.parallel(data=data.jags, 
                        parameters.to.save=params,
                        n.iter=5000, n.chains=8,n.thin=1,n.burnin = 2500,
                        model.file=model)
traceplot(model1)
model1

model1$BUGSoutput$mean$H
