nums <- as.numeric(unlist(strsplit(readline("Enter numbers separated by space: "), " ")))

if (all(nums > 50)) {
  print("All are above 50")
} else if (any(nums > 50)) {
  print("Some are above 50")
} else {
  print("None are above 50")
}
