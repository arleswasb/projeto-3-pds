function R = ruido(a1,a2,f1,f2,n,Fs);
  T = 1/Fs
  t = n*T
  R = a1*cos(2*pi*f1*t) + a2*cos(2*pi*f2*t)
  endfunction
