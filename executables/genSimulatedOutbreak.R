#### SIM 1: RANDOM DIFFUSION ####

## LIBRARY ##
library(MASS)
library(adegenet) # must be the devel version
library(ape)

## PARAMETERS FOR RANDOM DIFFUSION
SEQLENGTH <- 5000
TXMUT <- .008
GENTIME <- 5
GENTIME.SD <- 1
REPRO <- 1.2
REPRO.SD <- .5
TMAX <- 100
MAXNBSEQ <- 2000
DISP <- 0.3
GRID <- matrix(1:25,ncol=5)
GRID
NBSIM <- 10
NBSAMP <- 10
SAMPSIZE <- 800
INI.N <- 10

## SIMULATE DATA ##
for(simIdx in 1:NBSIM){
  mySim <- list(ances=NA) # initialization
  while(sum(!is.na(mySim$ances)) < 500){
    ## MAKE SIMULATION
    mySim <- haploGen(seq.le=SEQLENGTH, Tmax=TMAX, mu=TXMUT,
                      mean.gen=GENTIME, sd.gen=GENTIME.SD,
                      mean.repr=REPRO, sd.repro=REPRO.SD,
                      max.nb=MAXNBSEQ, lambda.xy=DISP, grid.size=5,
                      ini.n=INI.N)
  } # end while
  save(mySim, file=paste("sim.unif", simIdx, "RData", sep="."))
  ## GET SAMPLES
  for(sampIdx in 1:NBSAMP){
    mySamp <- sample.haploGen(mySim, SAMPSIZE, rDate=rpois,
                              arg.rDate=list(lambda=1))
    fileName <- paste("sim.unif", simIdx, sampIdx, "RData", sep=".")
    save(mySamp, file=fileName)
  }
}

#### SIM 2: STRUCTURED DISPERSAL ####
## PARAMETERS, RANDOM DIFFUSION
SEQLENGTH <- 5000
TXMUT <- .008
GENTIME <- 5
GENTIME.SD <- 1
REPRO <- 1.2
REPRO.SD <- .5
TMAX <- 100
MAXNBSEQ <- 2000
DISP <- 0.3
GRID <- matrix(1:25,ncol=5)
GRID
INI.N <- 10
INI.XY <- c(2,2)
DISPMAT <- matrix(0,ncol=25,nrow=25)
diag(DISPMAT) <- 1
## puits
DISPMAT[c(13,14,15,18,20,23,24,25),-19] <- 0
DISPMAT[c(13,14,15,18,20,23,24,25),19] <- 0.7 # apport puits
DISPMAT[c(13,14,15,18,20,23,24,25) , c(13,14,15,18,20,23,24,25)] <- 0.3
DISPMAT[19,] <- 0.01
DISPMAT[19,19] <- 0.96 # diffusion puits = 0
## source
DISPMAT[c(1,6,11,2,12),-7] <- 0 # apport pour la source
DISPMAT[c(1,6,11,2,12),7] <- 0.95
DISPMAT[c(1,6,11,2,12),c(1,6,11,2,12)] <- 0.05
DISPMAT[7, ] <- 0 # diffusion depuis la source
DISPMAT[7, c(4,5,10,15,20,21,22,23,24)] <- 1/9
## misc points with immediate neighbour connectivity
DISPMAT[3, c(2,8,4)] <- DISP/3 # 3
DISPMAT[3,3] <- 1-DISP
DISPMAT[4, c(3,5,9)] <- DISP/3 # 4
DISPMAT[4,4] <- 1-DISP
DISPMAT[5, c(4,9,10)] <- DISP/3 # 5
DISPMAT[5,5] <- 1-DISP
DISPMAT[9, c(4,8,10,14)] <- DISP/4 # 9
DISPMAT[9,9] <- 1-DISP
DISPMAT[10, c(5,9,15)] <- DISP/3 # 10
DISPMAT[10,10] <- 1-DISP
DISPMAT[16, c(11,12,17,21,22)] <- DISP/5 # 16
DISPMAT[16,16] <- 1-DISP
DISPMAT[17, c(18,12)] <- DISP/2 # 17
DISPMAT[17,17] <- 1-DISP
DISPMAT[21, c(16,17,22)] <- DISP/3 # 21
DISPMAT[21,21] <- 1-DISP
DISPMAT[22, c(17,18,23)] <- DISP/3 #
DISPMAT[22,22] <- 1-DISP
## DISPMAT[, c(,,)] <- .2/3 #
## DISPMAT[,] <- 0.8
## DISPMAT[, c(,,)] <- .2/3 #
## DISPMAT[,] <- 0.8
## DISPMAT[, c(,,)] <- .2/3 #
## DISPMAT[,] <- 0.8
## DISPMAT[, c(,,)] <- .2/3 #
## DISPMAT[,] <- 0.8
DISPMAT <- prop.table(DISPMAT,1)
NBSIM <- 10
9
NBSAMP <- 10
SAMPSIZE <- 800
## SIMULATE DATA ##
for(simIdx in 1:NBSIM){
  mySim <- list(ances=NA) # initialization
  while(sum(!is.na(mySim$ances)) < 500){
    ## MAKE SIMULATION
    mySim <- haploGen(seq.le=SEQLENGTH, Tmax=TMAX, mu=TXMUT,
                      mean.gen=GENTIME, sd.gen=GENTIME.SD,
                      mean.repr=REPRO, sd.repro=REPRO.SD,
                      max.nb=MAXNBSEQ, grid.size=5, matConnect=DISPMAT,
                      ini.n=INI.N, ini.xy=INI.XY)
  } # end while
  save(mySim, file=paste("sim.stru", simIdx, "RData", sep="."))
  ## GET SAMPLES
  for(sampIdx in 1:NBSAMP){
    mySamp <- sample.haploGen(mySim, SAMPSIZE, rDate=rpois,
                              arg.rDate=list(lambda=1))
    fileName <- paste("sim.stru", simIdx, sampIdx, "RData", sep=".")
    save(mySamp, file=fileName)
  }
}
## TO VISUALIZE THE LATEST DATASET ##
plotHaploGen(mySamp)
