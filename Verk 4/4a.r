id <- c(1001, 1002, 1003, 1004, 1005, 1006)

names <- c(
  "Gillian Keene",
  "Guğmundur Jónsson",
  "Marla Dröfn Diego",
  "Konráğ Guğmundsson",
  "Renate Hertzenslust",
  "Sigurğur Sívertssen"
)
grads <- as.Date(c(
  "2012-05-25",
  "2013-12-17",
  "2014-05-15",
  "2014-05-15",
  "2014-12-19",
  "2015-05-27"
))

physGPA <- c(9.4, 7.5, 9.5, 5.0, 6.6, 8.1)
chemGPA <- c(8.4, 6.9, 5.5, 9.8, 4.0, 8.8)
mathGPA <- c(9.0, 6.7, 8.5, 5.0, 9.0, 9.7)

studs <- data.frame(
  id,
  names,
  physGPA,
  chemGPA,
  mathGPA,
  grads
)

studs
