function J =  JANELA(n,f1,f2,SINAL)
  J = (IMPULSO(n-78)*SINAL + (sen(f1(n-78)))/pi*(n-78) -  (sen(f2(n-78)))/pi*(n-78))
  endfunction
