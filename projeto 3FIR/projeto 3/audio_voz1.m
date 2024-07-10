
#criando sinal de voz

#input("grava audio");%marcação para iniciar a gravação do audio da voz
#"enter" para iniciar a gravação do audio

vetor_audio_voz = audioread('audio_voz.wav');%gravar o audio direto do microfone em um vetor mono, com duração de 15 s com 44000 Fps
#input("fim audio");%marcação que indica o fim da gravação do audio de voz
%"enter para continuar as conversoes

#audiowrite('audio_voz.wav',vetor_audio_voz,44000)%cria o arquivo de audio em wav


#criando sinal de ruido

#numero de amostras

M = 156
N=M+1
n = (1:1:M)
Tr = (0:1:length(vetor_audio_voz)-1)
k = (-M/2:1:M/2)
f1 = 10.8
f2 = 11.4

Fs = 44000

R = ruido(0.5,0.5,10.8*pi,11.4*pi,Tr,Fs)

#audiowrite('audio_ruido.wav',R,44000)%cria o arquivo de ruido em wav

#juntando os sinais de voz e ruido


audio_ruidoso = vetor_audio_voz + R;


#audiowrite('voz_e_ruido.wav',audio_ruidoso,44000);

h1 = h(n,f1,f2,M) #função 1

h2 =


hf =

H = DFTD(



for i =1:(M)
    n(i) = i;
    h(i) = hd(n(i)-M/2,wc1,wc2)*janela(n(i),M);
end

%Contaminação do sinal de áudio
R = (0:1:length(v)-1);
for i = 1:length(v)
   R(i) = r(tempo(i),f1,f2);
end

%v_contaminado = v + R;


for i =1:(M)
  k(i) = -M/2+i-1;
end



function [X] = dtft(x,n,k)
  M = 200;
  W = exp(-1*1i*pi*(n'*k)/M);
  X = x*W;
end


function hd = h(n,f1,f2,M);
   hd = impulso(n-M/2) + sinc_w(n-M/2,f1) - sinc_w(n-M/2,f2)
 endfunction

 function H = HANNING(n,M);
  if n>=0 and n<=M
    H = 0.5(1 - cos((2*pi*n)/M))
  endif
  endfunction






