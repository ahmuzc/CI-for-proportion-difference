DescTools::BinomDiffCI(
  x1, n1, x2, n2, conf.level = 0.95, sides = c("two.sided","left","right"),
            method = c("ac", "wald", "waldcc", "score", "scorecc", "mn",
                       "mee", "blj", "ha", "hal", "jp")
)
# The traditional Wald confidence interval for the difference of two proportions \deltaδ is based on the asymptotic normal distribution of \hat{\delta} 
# δ# ^# .
# The Corrected Wald interval uses a continuity correction included in the test statistic. The continuity correction is subtracted from the numerator of the test statistic if the numerator is greater than zero; otherwise, the continuity correction is added to the numerator. The value of the continuity correction is (1/n1 + 1/n2)/2.
# The Agresti-Caffo (code "ac") is equal to the Wald interval with the adjustment according to Agresti, Caffo (2000) for difference in proportions and independent samples. It adds 1 to x1 and x2 and adds 2 to n1 and n2 and performs surpringly well.
# Newcombe (code "scorecc") proposed a confidence interval for the difference based on the Wilson score confidence interval for a single proportion. A variant uses a continuity correction for the Wilson interval (code "scorecc").
# Miettinen and Nurminen showed that the restricted maximum likelihood estimates for p1 and p2 can be obtained by solving a cubic equation and gave unique closed-form expressions for them. The Miettinen-Nurminen confidence interval is returned with code "mn".
# The Mee (code "mee") interval proposed by Mee (1984) and Farrington-Manning (1990) is using the same maximum likelihood estimators as Miettinen-Nurminen but with another correcting factor.
# The Brown, Li's Jeffreys (code "blj") interval was proposed by Brown, Li's Jeffreys (2005).
# The Hauck-Anderson (code "ha") interval was proposed by Hauck-Anderson (1986).
# The Haldane (code "hal") interval is described in Newcombe (1998) and so is the Jeffreys-Perks (code "jp").

# The general consensus is that the most widely taught method method="wald" is inappropriate in many situations and should not be used. 
# Recommendations seem to converge around the Miettinen-Nurminen based methods (method="mn").
