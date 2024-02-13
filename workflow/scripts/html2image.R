if(!require("webshot")) {install.packages("webshot", dependencies = TRUE)}
library(webshot)

## save html to png
webshot("images/sample_gps_py.html", file = "images/mymap.png",
        cliprect = "viewport")

