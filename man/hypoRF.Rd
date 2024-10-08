% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hypoRF.R
\name{hypoRF}
\alias{hypoRF}
\title{HypoRF; a Random Forest based Two Sample Test}
\usage{
hypoRF(
  data1,
  data2,
  K = 100,
  statistic = "PerClassOOB",
  normalapprox = F,
  seed = NULL,
  alpha = 0.05,
  ...
)
}
\arguments{
\item{data1}{An object of type "data.frame". The first sample.}

\item{data2}{An object of type "data.frame". The second sample.}

\item{K}{A numeric value specifying the number of times the created label is permuted. For K = 1 a binomial test is carried out. The Default is K = 100.}

\item{statistic}{A character value specifying the statistic for permutation testing. Two options available
\itemize{
\item\code{PerClassOOB} Sum of OOB per class errors.
\item\code{OverallOOB} OOB-error.
}. Default is statistic = "PerClassOOB".}

\item{normalapprox}{A logical value asking for the use of a normal approximation. Default is normalapprox = FALSE.}

\item{seed}{A numeric value for reproducibility.}

\item{alpha}{The level of the test. Default is alpha = 0.05.}

\item{...}{Arguments to be passed to ranger}
}
\value{
A list with elements
\itemize{
\item\code{pvalue:} The p-value of the test.
\item\code{obs:} The OOB-statistic in case of K>1 or the out-of-sample error in case of K=1 (binomial test).
\item\code{val:} The OOB-statistic of the permuted random forests in case of K>1 (otherwise NULL).
\item\code{varest:} The estimated variance of the permuted random forest OOB-statistic in case of K>1 (otherwise NULL).
\item\code{statistic:} The used OOB-statistic
\item\code{importance_ranking:} The variable importance measure, when importance == "impurity".
\item\code{cutoff:} The quantile of the importance distribution at level alpha.
\item\code{call:} Call to the function.}
}
\description{
Performs a permutation two sample test based on the out-of-bag-error of random forest.
}
\examples{
# Using the default testing procedure (permutation test)
x1 <- data.frame(x=stats::rt(50, df=1.5))
x2 <- data.frame(x=stats::rnorm(50))
hypoRF(x1, x2, num.trees = 50)
# Using the exact binomial test
hypoRF(x1, x2, K=1)
}
\seealso{
\code{\link[ranger]{ranger}}
}
