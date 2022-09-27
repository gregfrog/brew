# brew test catprint

    Code
      brew("catprint.brew", envir = new.env(), extendedErrorReport = TRUE)
    Output
      DATA FRAME OUTPUT (LISTS TOO)
      
      Let's run this: <% data(iris) %>
      
      Let's look at some R output:
      
      If we say this: <% head(iris) %>
      the output is this:
      
      nothing right?
      
      if we say this: <%= head(iris) %>
      it's an error because cat() cannot handle lists.
      
      But if we say this: <% print(head(iris)) %>
      the output is this:
        Sepal.Length Sepal.Width Petal.Length Petal.Width Species
      1          5.1         3.5          1.4         0.2  setosa
      2          4.9         3.0          1.4         0.2  setosa
      3          4.7         3.2          1.3         0.2  setosa
      4          4.6         3.1          1.5         0.2  setosa
      5          5.0         3.6          1.4         0.2  setosa
      6          5.4         3.9          1.7         0.4  setosa
      
      
      VECTOR OUTPUT
      
      We'll work with v: <% v <- head(iris)$Sepal.Length %>
      
      
      If we say this: <%= v %>
      the output is this:
      5.1 4.9 4.7 4.6 5 5.4
      because 'cat()' coerces v to a character vector
      
      How about <%= v > 5 %>
      TRUE FALSE FALSE FALSE FALSE TRUE
      So cat() can deal with any vector 
      
      And if we say this: <% print(v) %>
      the output is:
      [1] 5.1 4.9 4.7 4.6 5.0 5.4
      

