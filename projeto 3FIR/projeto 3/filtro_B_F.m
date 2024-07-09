function F = FBF1(n,f1,f2,M);
   F = impulso(n) + sinc_w(n,f1) *sinc_w(n,f2)
   endfunction
