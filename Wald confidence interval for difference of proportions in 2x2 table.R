wald2ci <- function(x1, n1, x2, n2, conflev){
   p1hat = x1/n1
   p2hat = x2/n2
   z = abs(qnorm((1-conflev)/2))
   ll = (p1hat - p2hat)  - z*sqrt((p1hat*(1-p1hat))/n1 + (p2hat*(1-p2hat))/n2)
   ul = (p1hat - p2hat)  + z*sqrt((p1hat*(1-p1hat))/n1 + (p2hat*(1-p2hat))/n2)
   c(ll,ul)
}

#Computes the Wald two-sample interval for (p1 - p2)
#with success counts x1, x2 and trials n1, n2
#and with confidence coeff conflev.  Returns a
#list with the lower and upper end points
#in that order.  Add 1 to x1 and x2 and add 2 to n1 and n2
#to get Agresti-Caffo adjusted CI (American Statistician, 2000).
