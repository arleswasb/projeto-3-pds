
#criando sinal de voz

#input("grava audio");%marcação para iniciar a gravação do audio da voz
#"enter" para iniciar a gravação do audio

vetor_audio_voz = audioread('audio_voz.wav');%gravar o audio direto do microfone em um vetor mono, com duração de 15 s com 44000 Fps
V_col = vetor_audio_voz'
#input("fim audio");%marcação que indica o fim da gravação do audio de voz
%"enter para continuar as conversoes

#audiowrite('audio_voz.wav',vetor_audio_voz,44000)%cria o arquivo de audio em wav


#criando sinal de ruido

#numero de amostras

M = 156
n = (1:1:M)
Fs = 44000

R = ruido(0.5,0.5,10.8*pi,11.4*pi,n,Fs)

audiowrite('audio_ruido.wav',R,44000)%cria o arquivo de ruido em wav

#juntando os sinais de voz e ruido


z = conv(V_col,R);
audiowrite('voz_e_ruido.wav',z,44000);

#H = HANNING(n,156)





