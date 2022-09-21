add_two <- function(my_number) {
  if (!is.numeric(my_number)) {
    stop("It's a number! Try again!")
  }
  my_number + 2
}

add_two(19)
