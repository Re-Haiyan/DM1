temp <- as.integer(readline("Enter temperature: "))

if (temp >= 30) {
  category <- "Hot"
} else if (temp >= 20 && temp <= 29) {
  category <- "Warm"
} else if (temp < 20) {
  category <- "Cold"
} else {
  category <- "Invalid input"
}

cat("Temperature Category:", category, "\n")
