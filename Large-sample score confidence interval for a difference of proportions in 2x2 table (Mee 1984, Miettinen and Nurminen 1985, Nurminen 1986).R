diffscoreci <- function(x1,n1,x2,n2,conflev){ 
   px = x1/n1
   py = x2/n2
   z = qchisq(conflev,1)
   proot = px-py
   dp = 1-proot
   niter = 1
   while(niter <= 50){
     dp = 0.5*dp
     up2 = proot+dp
     score = z2stat(px,n1,py,n2,up2)
     if(score<z){ proot = up2 }
     niter = niter+1
     if((dp<0.0000001) || (abs(z-score)<.000001)){
       niter = 51
       ul = up2}
    } 
   
   proot = px-py
   dp = 1+proot
   niter = 1
   while(niter <= 50){
     dp = 0.5*dp
     low2 = proot-dp
     score = z2stat(px,n1,py,n2,low2)
     if(score<z){ proot = low2 }
     niter = niter+1
     if((dp<0.0000001) || (abs(z-score)<.000001)){
     ll = low2
     niter = 51}
     }
 c(ll,ul)
}

z2stat <- function (p1x,nx,p1y,ny,dif){

      diff = p1x-p1y-dif
      if ( abs(diff) == 0 ) {
        fmdiff = 0}
      else{
        t = ny/nx
        a = 1+t
        b = -(1+ t + p1x + t*p1y + dif*(t+2))
        c = dif*dif + dif*(2*p1x + t +1) + p1x + t*p1y
        d = -p1x*dif*(1+dif)
        v = (b/a/3)^3 - b*c/(6*a*a) + d/a/2
        s = sqrt( (b/a/3)^2 - c/a/3)
        if(v>0){u=s}
         else{u=-s}
        w = (3.141592654+acos(v/u^3))/3
        p1d = 2*u*cos(w) - b/a/3
        p2d = p1d - dif
        var = p1d*(1-p1d)/nx + p2d*(1-p2d)/ny
        fmdiff = diff^2/var
      }
  return(fmdiff)
}


# Computes the score two-sample interval for (p1 - p2)
# with success counts x1, x2 and trials n1, n2
# and with confidence coefficient = conflev 
# written by Yongyi Min
