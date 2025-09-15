grade <- as.integer(readline("Enter grades: "))

if (grade >= 90 && grade <= 100) {
  Fgrade <- "A"
} else if (grade >= 80 && grade <= 89) {
  Fgrade <- "B"
} else if (grade >= 70 && grade <= 79) {
  Fgrade <- "C"
} else if (grade >= 60 && grade <= 69) {
  Fgrade <- "D"
} else if (grade < 60) {
  Fgrade <- "F"
} else {
  Fgrade <- "Invalid input"
}

cat("Grade:", Fgrade, "\n")


