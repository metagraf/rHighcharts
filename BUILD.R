# Run before pushing to github

#require("formatR")
#tidy.dir("R")  # Fix code formatting

require("devtools")
document()  # Fix documentation with roxygen
check_doc()  # Check documentation
# test()  # Run tests
