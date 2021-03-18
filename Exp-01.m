# Processamento de Sinais LAB - Exp.:01
# Multiplicação de sinais cosseno
# 
#  Victor T. S. Marciano - 180131
#  Vinicius Ibanez  Alves - 180023
#

clear all;
close all;
clc;

# Frequência do sinal 1 = 300 Hz
fsi = 400;
#fsi = 300;
# Periodo do Sinal 1
p_si = 1/fsi;

# Frenquência do sinal 2 = 3kHz
fsii = 2800 ;
#fsii = 3000;
# Periodo do Sinal 2
p_sii = 1/fsii;

# Frequência de amostragem  = 300 kHz
sf = 300e3;

# Variação de tempo =  frenquencia de amostragem^-1
dt = 1/sf;

# Tempo total de sinal
t = 6e-3;

# Vetor de tempo
vet_t = 0:dt:t-dt;

# Linha de cosseno  sinal 1
x = cos(2*pi*fsi*vet_t);

# Linha de cosseno sinal 2
y = cos(2*pi*fsii*vet_t);

# Multiplcação entre os vetores
x_times_y = x.*y
figure (1);
plot(vet_t, x_times_y)
title('Multiplicação de fcos de Sinal 1 * fcos de Sinal 2')
xlabel('Tempo [s]')
ylabel('Amplitude')
grid

# Gráfico do sinal 1
figure (2);
plot(vet_t, x)
title(strcat('Cosseno do Sinal 1 [f1=',mat2str(fsi),' Hz]'))
xlabel('Tempo [s]')
ylabel('Amplitude')
grid


# Gráfico do Sinal 2
figure (3);
plot(vet_t, y)
title(strcat('Cosseno do Sinal 2 [f2=',mat2str(fsii),' Hz]'))
xlabel('Tempo [s]')
ylabel('Amplitude de onda')
grid

#====DOMINIO FREQUENCIA====#
NFFT=2^16; # Tamanho de amostragem do vetor
X_T_Y=fft(x_times_y,NFFT);  
nVals=sf*(-NFFT/2:NFFT/2-1)/NFFT; 
figure(4)     
plot(nVals,fftshift(abs(X_T_Y)));      
title('fcos de Sinal 1 * fcos de Sinal 2 - Domínio da frequencia');        
xlabel('Frequencia [Hz]')        
ylabel('Amplitude de Onda');
axis([-3500, 3500]);
