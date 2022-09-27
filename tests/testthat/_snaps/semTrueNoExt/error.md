# option show.error.messages works as expected

    Code
      brew("error.brew", envir = new.env(), extendedErrorReport = FALSE)
    Output
      Error Test
      Error in fnc() : could not find function "fnc"

