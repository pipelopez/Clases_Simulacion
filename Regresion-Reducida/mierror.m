function error=mierror(N,y,x,w)
    for i=1:N
        -y(i)*log(w*x(i))