% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/geom-path-step.r
\name{geom_step}
\alias{geom_step}
\title{Connect observations by stairs.}
\usage{
geom_step(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", direction = "hv", ...)
}
\arguments{
\item{mapping}{The aesthetic mapping, usually constructed with
\code{\link{aes}} or \code{\link{aes_string}}. Only needs to be set
at the layer level if you are overriding the plot defaults.}

\item{data}{A layer specific dataset - only needed if you want to override
the plot defaults.}

\item{stat}{The statistical transformation to use on the data for this
layer.}

\item{position}{The position adjustment to use for overlapping points
on this layer}

\item{direction}{direction of stairs: 'vh' for vertical then horizontal, or
'hv' for horizontal then vertical}

\item{...}{other arguments passed on to \code{\link{layer}}. This can
include aesthetics whose values you want to set, not map. See
\code{\link{layer}} for more details.}
}
\description{
Connect observations by stairs.
}
\section{Aesthetics}{

\Sexpr[results=rd,stage=build]{ggplot2:::rd_aesthetics("geom", "step")}
}
\examples{
# Simple quantiles/ECDF from examples(plot)
set.seed(1492)
df <- data.frame(
  x = sort(rnorm(47))
)
ggplot(df, aes(seq_along(x), x)) + geom_step()

# Steps go horizontally, then vertically (default)
ggplot(df, aes(seq_along(x), x)) + geom_step(direction = "hv")
plot(df$x, type = "s")
# Steps go vertically, then horizontally
ggplot(df, aes(seq_along(x), x)) + geom_step(direction = "vh")
plot(df$x, type = "S")

# Also works with other aesthetics
df <- data.frame(
  x = sort(rnorm(50)),
  trt = sample(c("a", "b"), 50, rep = TRUE)
)
ggplot(df, aes(seq_along(x), x)) + geom_step(aes(colour = trt))
}

