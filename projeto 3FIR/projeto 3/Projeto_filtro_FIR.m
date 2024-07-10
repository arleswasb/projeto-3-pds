
#GRAVAÇÃO DO AUDIO PARA UTILIZAÇÃO NO PROJETO 1#####

#input("grava audio");%marcação para iniciar a gravação do audio da voz
%"enter" para iniciar a gravação do audio
#vetor_audio_voz = record(10,44100);%gravar o audio direto do microfone em um vetor mono, com duração de 15 s com 44000 Fps
#input("fim audio");%marcação que indica o fim da gravação do audio de voz
%"enter para continuar as conversoes
#audiowrite('audio_voz.wav',vetor_audio_voz,44000)%cria o arquivo de audio em wav
vetor_audio_voz = audioread('audio_voz.wav');% coloca o audio em um vetor,


#DADOS PARA O PROJETO#

Fs = 44100
M = 156 #NUMERO DE AMOSTRAS
N=M+1
n = (0:1:M) #VETOR DO NUMERO DE AMOSTRAS
Tr = (0:1:length(vetor_audio_voz)-1) #TAMANHO EM SEGUNDOS DO SINAL DE RUIDO
K = (-M/2:1:M/2) #VARIAVEL DO INTERVADO DE AMOSTRAGEM
f1 = 10.8*pi  #FREQUENCIA 1 DO RUIDO
f2 = 11.4*pi   #FREQUENCIA 2 DO RUIDO
a1 = 0.5    #Amplitude do sinal de ruido da primeira frequeencia
a2 = 0.5    #Amplitude do sinal de ruido da segunda frequeencia

#FUNÇÕES UTILIZADAS ##########

function R = ruido(a1,a2,f1,f2,Tr,Fs); #função que gera o ruido
  T = 1/Fs
  t = Tr*T
  R = a1*cos(2*pi*f1*t) + a2*cos(2*pi*f2*t)
endfunction

function I = IMPULSO(n); # função impulso
   if n==0;
     I=1
   else
    I=0
    endif
  endfunction

  function S =  sinc_w(n,wc) #função sinc
  if n==0
    S = wc/pi
  else
    S = sin(wc*n)/(n*pi)
  endif
endfunction

function w = JANELA(n,M); #FUNÇÃO JANELA DE HANNING PARA PERDA ATE 42DB
    if n>=0 && n<=M+1
      w = 0.5*(1-cos(2*pi*n/M));
  else
      w = 0;
      endif
  endfunction

function hd = hd(n,f1,f2,M); #função que gera o sinal do filtro desejado (rejeita faixa)
   hd = IMPULSO(n-M/2) + sinc_w(n-M/2,f1) - sinc_w(n-M/2,f2)
 endfunction


 function X = DTFD (x,n,k,M); #FUNÇÃO DA TRANSFORMADA DE FOURRIER
  X = x*(exp(-j*(pi/M)*(n')*k))
 endfunction


#CRIAÇÃO DO VETOR DE RUIDO#

#R = ruido(a1,a2,f1*pi,f2*pi,Tr,Fs)
#R_inv = R'

# CRIAÇÃO DO VETOR DE AUDIO RUIDOSO

#vetor_audio_ruidoso = vetor_audio_voz + R_inv;
#audiowrite('audio_voz_ruidoso.wav',vetor_audio_ruidoso,44100)%cria o arquivo de audio em wav


# ccriação do vetor do filtro

h = hd(n-M/2,f1,f2,M)*JANELA(n,M);

# aplicando a transformada de fourrier

Hn = DFTD(h,n,K,M)

Ymod = abs(Hn) %extrai o módulo dos termos do vetor Y(magnitude)
Yang = angle(Hn) % extrai a fase dos termos do vetor Y(angulo)
plot(K,Hn); %plota os gráficos
title ("Gráfico de X");
xlabel ("Transformada de Foirier");
ylabel ("vetor K");
grid("on");
figure
plot(K,Ymod);
title("Gráfico da magnitude de X");
xlabel ("modulo de X");
ylabel ("vetor K");
grid("on");
figure
plot(K,Yang);
title("Gráfico da fase de X");
xlabel ("Fase de X");
ylabel ("vetor K");
grid("on");



