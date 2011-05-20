\name{facet_wrap}
\alias{facet_wrap}
\title{Wrap a 1d ribbon of panels into 2d.}
\usage{facet_wrap(facets, nrow, ncol, scales="fixed", shrink=TRUE,
    as.table=TRUE, drop=TRUE)}

\description{
  Wrap a 1d ribbon of panels into 2d.
}
\arguments{
  \item{nrow}{number of rows}
  \item{ncol}{number of columns}
  \item{facet}{formula specifying variables to facet by}
  \item{scales}{should scales be fixed, free, or free in one dimension
(\code{free_x}, \code{free_y})}
}
\examples{d <- ggplot(diamonds, aes(carat, price, fill = ..density..)) + 
xlim(0, 2) + stat_binhex(na.rm = TRUE) + opts(aspect.ratio = 1)
d + facet_wrap(~ color)
d + facet_wrap(~ color, ncol = 1)
d + facet_wrap(~ color, ncol = 4)
d + facet_wrap(~ color, nrow = 1)
d + facet_wrap(~ color, nrow = 3)

# Using multiple variables continues to wrap the long ribbon of 
# plots into 2d - the ribbon just gets longer
# d + facet_wrap(~ color + cut)

# You can choose to keep the scales constant across all panels
# or vary the x scale, the y scale or both:
p <- qplot(price, data = diamonds, geom = "histogram", binwidth = 1000)
p + facet_wrap(~ color)
p + facet_wrap(~ color, scales = "free_y")

p <- qplot(displ, hwy, data = mpg)
p + facet_wrap(~ cyl)
p + facet_wrap(~ cyl, scales = "free") 

# Add data that does not contain all levels of the faceting variables
cyl6 <- subset(mpg, cyl == 6)
p + geom_point(data = cyl6, colour = "red", size = 1) + 
facet_wrap(~ cyl)
p + geom_point(data = transform(cyl6, cyl = 7), colour = "red") + 
facet_wrap(~ cyl)
p + geom_point(data = transform(cyl6, cyl = NULL), colour = "red") + 
facet_wrap(~ cyl)

# By default, any empty factor levels will be dropped
mpg$cyl2 <- factor(mpg$cyl, levels = c(2, 4, 5, 6, 8, 10))
qplot(displ, hwy, data = mpg) + facet_wrap(~ cyl2)
# Use drop = FALSE to force their inclusion
qplot(displ, hwy, data = mpg) + facet_wrap(~ cyl2, drop = FALSE)}