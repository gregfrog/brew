library(testthat)
library(brew)

test_that("brew test file 1", {
  local_edition(3)
  outfile = paste0(tempdir(),"/","test1.tex")
  brew("brew-test-1.brew",output=outfile, envir=new.env(),extendedErrorReport = TRUE)

  announce_snapshot_file(name = outfile)
  expect_snapshot_file(
    path = outfile,
    cran = FALSE,
    compare = compare_file_text,
    variant = "file1"
  )

  eps1file = paste0(tempdir(),"/",'brew-test-1-3.eps')

  announce_snapshot_file(name = eps1file)
  expect_snapshot_file(
    path = eps1file,
    cran = FALSE,
    compare = compare_file_text,
    variant = "file1"
  )

  eps2file = paste0(tempdir(),"/",'brew-test-1-4.eps')

  announce_snapshot_file(name = eps2file)
  expect_snapshot_file(
    path = eps2file,
    cran = FALSE,
    compare = compare_file_text,
    variant = "file1"
  )
  unlink(eps2file)
  unlink(eps1file)
  unlink(outfile)
})

test_that("brew test file 2", {
  local_edition(3)
  outfile = paste0(tempdir(),"/","test1.html")
  brew("brew-test-2.brew",output = outfile, envir = new.env(),extendedErrorReport = TRUE)

  announce_snapshot_file(name = outfile)
  expect_snapshot_file(
    path = outfile,
    cran = FALSE,
    compare = compare_file_text,
    variant = "file2"
  )
  unlink(outfile)
})

test_that("brew test catprint", {
  local_edition(3)
  expect_snapshot(brew("catprint.brew", envir = new.env(),extendedErrorReport = TRUE),
                  variant = "catprintTest")
})


  
