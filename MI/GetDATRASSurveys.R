#####
## icesDatras
## Examples of loops for multi-annual data extraction
#####

library(icesDatras)

getSurveyList()


years <- getSurveyYearList("IE-IGFS") # get available years
years_sub <- years[years >2021]

### HH data (via loop structure)
hh_igfs <- list()

#Lines 20-28 Modified after original code from Coilin Minto)
for(y in years_sub){
  print(y)
  tmp <- getHHdata(survey = "IE-IGFS", year = y, quarter = 4)
  hh_igfs[[paste(y)]] <- tmp
  rm(tmp)
}
df_hh_igfs <- do.call(rbind, hh_igfs)
row.names(df_igfs) <- NULL
head(df_hh_igfs)

### CA data w/ subset for whiting
whiting = 126438 # whiting AphiaID

# getDATRAS() allows to retrieve records for several years and surveys any record (HH, HL, CA) type
CA <- getDATRAS(record = "CA", survey = "IE-IGFS", years = years_sub, quarters = 4)
CA <- CA[CA$Valid_Aphia == whiting, ]
head(CA) 









