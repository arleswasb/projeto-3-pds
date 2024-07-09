function H = HANNING(n,M);
  if n>=0 and n<=M
    H = 0.5(1 - cos((2*pi*n)/M))
  endif
  endfunction
