%colocar na pasta de trabalho do octave o arquivo de audio Church Schellingwoude.wav
z = audioread('Church Schellingwoude.wav');% coloca o audio em um vetor, ATENÇÃO: O audio original tem dois canais (esterio)
v = z(:,1);% extrair um canal mono do vetor com o audio original
input("grava audio");%marcação para iniciar a gravação do audio da voz
%"enter" para iniciar a gravação do audio
vetor_audio_voz = record(15,44000);%gravar o audio direto do microfone em um vetor mono, com duração de 15 s com 44000 Fps
input("fim audio");%marcação que indica o fim da gravação do audio de voz
%"enter para continuar as conversoes
audiowrite('audio_voz.wav',vetor_audio_voz,44000)%cria o arquivo de audio em wav



result = conv(vetor_audio_voz,v); % realiza a convolução entre o vetor da voz com o vetor mono de audio Church Schellingwoude e coloca em um vetor

audiowrite('audiofinal.wav',result,44000); % converte em sinal de audio o vetor resultado da convolução.

