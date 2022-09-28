# option show.error.messages works as expected

    Code
      cat(head(logLines, 1), tail(logLines, 5))
    Output
      Call stack at error: 	brew("error.brew", envir = new.env(), extendedErrorReport = TRUE) 	 ... 	fna() 	fnb() Error in fnc() : could not find function "fnc"

