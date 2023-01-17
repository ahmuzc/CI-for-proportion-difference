orscoreci <- function(x1,n1,x2,n2,conflev){
  px = x1/n1
  py = x2/n2
  if(((x1==0) && (x2==0)) || ((x1==n1) && (x2==n2))){
      ul = 1/0
      ll = 0   
      } 
  else if((x1==0) || (x2==n2)){
       ll = 0
       theta = 0.01/n2 
       ul = limit(x1,n1,x2,n2,conflev,theta,1)      
     }
  else if((x1==n1) || (x2==0)){
       ul = 1/0
       theta = 100*n1
       ll = limit(x1,n1,x2,n2,conflev,theta,0)       
     }
  else{
      theta = px/(1-px)/(py/(1-py))/1.1
      ll = limit(x1,n1,x2,n2,conflev,theta,0)       
      theta=px/(1-px)/(py/(1-py))*1.1
      ul = limit(x1,n1,x2,n2,conflev,theta,1)      
   }
  c(ll,ul)  
}

limit <- function(x,nx,y,ny,conflev,lim,t){
      
      z = qchisq(conflev,1)
      px = x/nx
      score= 0
      while ( score < z){
        a = ny*(lim-1)
        b = nx*lim+ny-(x+y)*(lim-1)
        c = -(x+y)
        p2d = (-b+sqrt(b^2-4*a*c))/(2*a)
        p1d = p2d*lim/(1+p2d*(lim-1))
        score = ((nx*(px-p1d))^2)*(1/(nx*p1d*(1-p1d))+1/(ny*p2d*(1-p2d)))
        ci = lim
        if(t==0) { lim = ci/1.001 }
        else{ lim = ci*1.001 }
        } 
 return(ci)
}
# computes the score CI for the odds ratio  p1(1-p2)/(p2(1-p1))
# with success counts x1, x2 and trials n1, n2
# and with confidence coefficient = conflev 
# written by Yongyi Min
