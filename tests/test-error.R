library(testthat)
library(brew)

test_that("error report produces stack trace (or not)", {
  anotherStackLayer<-function(){
    yetAnotherStackLayer<-function()
    {
      brew("error.brew",envir = new.env(),extendedErrorReport = TRUE)
    }
    yetAnotherStackLayer()
  }
  
  local_edition(3)
  expect_snapshot(anotherStackLayer(), variant = "extraStackLayers")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE), variant = "extErr")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "noextErr")
  expect_snapshot(brew("error.brew",envir = new.env()), variant = "noextErrparm")
})

test_that("option show.error.messages works as expected", {
  local_edition(3)
  options(show.error.messages = TRUE)
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE), variant = "semTrueExt")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "semTrueNoExt")
  options(show.error.messages = FALSE)
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE), variant = "semFalseExt")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "semFalseNoExt")
  options(show.error.messages = TRUE)
})

