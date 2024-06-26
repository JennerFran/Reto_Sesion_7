library(DBI)
library(RMySQL)

# Una vez que se tengan las librerias necesarias 
# se procede a la lectura (podría ser que necesites 
# otras, si te las solicita instalalas y cargalas), 
# de la base de datos de Shiny la cual es un demo y 
# nos permite interactuar con este tipo de objetos. 
# El comando dbConnect es el indicado para realizar 
# la lectura, los demás parametros son los que nos 
# dan acceso a la BDD.

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

# Si no se arrojaron errores por parte de R, 
# vamos a explorar la BDD

dbListTables(MyDataBase)

# Ahora si se quieren desplegar los campos 
# o variables que contiene la tabla City 
# se hará lo siguiente

dbListFields(MyDataBase, 'CountryLanguage')

# Para realizar una consulta tipo MySQL sobre 
# la tabla seleccionada haremos lo siguiente

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(DataDB)
hist(DataDB$Percentage) # histogram
