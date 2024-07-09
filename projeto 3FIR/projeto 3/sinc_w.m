function S =  sinc_w(n,wc)
  if n>=0
    S = wc/pi
  else
    S = sin(wc*n)/n*pi
  endif
endfunction
