#install.packages("RMySQL")

library(RMySQL)

con=dbConnect(MySQL(), user='kate', password='2211', host='localhost', db = 'mydb')
isIdCurrent(con)
dbListTables(conn = con)

mcars <-read.csv(file="C:/Users/User/Desktop/mtcars.csv", header = TRUE, sep = ",")

mcars1 <- as.data.frame(mcars)
head(mcars1)

test1 <- data.frame("age" = c(20, 30, 40), "name" = c("Bob", "Jo", "Ann"), "var" = c(0, 1, 0))

dbWriteTable(conn = con, name = 'testtab', value = test1, field_types=NULL, row.names = FALSE)

dbWriteTable(conn = con, name = 'tabcars', value = mcars1, field_types=NULL, row.names = FALSE)

#---------------/
#Get for  DDL---/
#Send for DML---/
#---------------/

dbGetQuery(conn=con, "SELECT * FROM tabcars")
qceq = dbGetQuery(conn=con, "SELECT qsec FROM tabcars")
as.data.frame(qceq)
avg_qceq=mean(qceq$qsec)

dbSendQuery(conn = con, "ALTER TABLE testtab ADD response INTEGER")

dbSendQuery(conn = con, "INSERT INTO testtab (response) VALUES (2)")

dbSendQuery(conn = con, "UPDATE testtab SET response = 2 WHERE name = 'Jo'")

dbSendQuery(conn = con, "DELETE FROM testtab WHERE response > 1")

dbGetQuery(conn = con, "SELECT * FROM testtab")



