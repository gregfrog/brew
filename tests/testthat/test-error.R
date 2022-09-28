test_that("error report produces stack trace (or not)", {
  anotherStackLayer<-function(){
    yetAnotherStackLayer<-function()
    {
      brew("error.brew",envir = new.env(),extendedErrorReport = TRUE)
    }
    yetAnotherStackLayer()
  }
  options(show.error.messages = TRUE)
  logLines = capture.output(anotherStackLayer(),type="message")
  expect_snapshot(print(c(head(logLines,1), tail(logLines,5))), variant = "extraStackLayers")
  logLines=capture.output(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE),type="message")
  # discard the testthat internals on the stack
  expect_snapshot(cat(head(logLines,1), tail(logLines,5)), variant = "extErr")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "noextErr")
  expect_snapshot(brew("error.brew",envir = new.env()), variant = "noextErrparm")
})

test_that("option show.error.messages works as expected", {
  options(show.error.messages = TRUE)
  logLines = capture.output(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE),type="message")
  expect_snapshot(cat(head(logLines,1), tail(logLines,5)), variant = "semTrueExt")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "semTrueNoExt")
  options(show.error.messages = FALSE)
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = TRUE), variant = "semFalseExt")
  expect_snapshot(brew("error.brew",envir = new.env(),extendedErrorReport = FALSE), variant = "semFalseNoExt")
  options(show.error.messages = TRUE)
})

