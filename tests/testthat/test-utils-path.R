test_that("program files path works", {
  skip_on_os(c("mac", "linux", "solaris"))
  program_files.path() %>%
    normalizePath() %>%
    expect_equal(normalizePath("c:/program files"))
})
