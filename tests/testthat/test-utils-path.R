test_that("program files path works", {
  skip_on_os(c("mac", "linux", "solaris"))
  program_files.path() %>%
    expect_equal("C:\\Program Files")
})
