# Calculates the mean of the pollutant concentration across
# the directory of CSV files

pollutantmean <- function ( directory, 
                            pollutant, 
                            id = 1:332 ) {
    
    # variable that will reset working directory to the current
    # before the function runs
    
    oriWD <- getwd ()
    pollutes <- c ()
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the 'specdata' folder that contains .CSV files

    setwd ( directory )
    
    fileList <- list.files ( directory )
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    for ( i in id ) {
        
        data <- read.csv ( fileList[i], 
                           header = TRUE )
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the mean;
        ## either "sulfate" or "nitrate"
        
        pollutes <- c( pollutes, 
                      data[, pollutant] )
    } 
    
    ## resetting wd back to the original wd
    
    setwd ( oriWD )
    
    ## mean function, removing NA's
    
    pollutesMean <- mean ( pollutes, na.rm = TRUE )
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round result!
    
    pollutesMean
  
}