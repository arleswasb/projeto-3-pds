function hd = h(n,f1,f2,M);
   hd = impulso(n) + sinc_w(n,f1) *sinc_w(n,f2)
   endfunction
