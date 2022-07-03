test_that("program files path works", {
  skip_on_os(c("mac", "linux", "solaris"))
  expect_equal(program_files.path(), normalizePath("c:/program files"))
})
