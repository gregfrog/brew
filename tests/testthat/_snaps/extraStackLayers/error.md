# error report produces stack trace (or not)

    Code
      print(c(head(logLines, 1), tail(logLines, 5)))
    Output
      [1] "Call stack at error:"                                                 
      [2] "\tbrew(\"error.brew\", envir = new.env(), extendedErrorReport = TRUE)"
      [3] "\t ..."                                                               
      [4] "\tfna()"                                                              
      [5] "\tfnb()"                                                              
      [6] "Error in fnc() : could not find function \"fnc\""                     

