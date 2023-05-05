% Practica 9 PSI
clc
clear all

%% ACTIVITAT 1
% Definir paràmetres del senyal
A1 = 1; A2 = 0.5; A3 = 0.25; A4 = 0.125;
f1 = 18; f2 = 36; f3 = 54; f4 = 72;
phi1 = pi/2; phi2 = pi/4; phi3 = -0.3*pi; phi4 = 0.6*pi;
Fs = 245; % freqüència de mostreig
N = 2048; % nombre de mostres

% Generar vector de temps
t = (0:N-1) / Fs;

% Generar senyal
x = A1*sin(2*pi*f1*t + phi1) + A2*sin(2*pi*f2*t + phi2) + A3*sin(2*pi*f3*t + phi3) + A4*sin(2*pi*f4*t + phi4);

% Generar soroll blanc gaussià
sigma = 0.1;
noise = sigma*randn(size(x));

% Afegir soroll al senyal
x = x + noise;

% Mostrar senyal
figure(1)
plot(t, x);
xlabel('Temps (s)');
ylabel('Amplitud');
title('Senyal sinusoidal amb soroll gaussià');

% Calcular la FFT del senyal
X = fft(x);

% Calcular l'eix de freqüència
f = (0:N-1) * Fs / N;

% Dibuixar el espectre
figure(2)
plot(f, abs(X));
xlabel('Freqüència (Hz)');
ylabel('Magnitud');
title('Espectre del senyal amb soroll gaussià');

%% Fem el mateix amb la frequencia de mostreig a 288Hz.
% Definir paràmetres del senyal
A1 = 1; A2 = 0.5; A3 = 0.25; A4 = 0.125;
f1 = 18; f2 = 36; f3 = 54; f4 = 72;
phi1 = pi/2; phi2 = pi/4; phi3 = -0.3*pi; phi4 = 0.6*pi;
Fs = 288; % freqüència de mostreig
N = 2048; % nombre de mostres

% Generar vector de temps
t = (0:N-1) / Fs;

% Generar senyal
x = A1*sin(2*pi*f1*t + phi1) + A2*sin(2*pi*f2*t + phi2) + A3*sin(2*pi*f3*t + phi3) + A4*sin(2*pi*f4*t + phi4);

% Generar soroll blanc gaussià
sigma = 0.1;
noise = sigma*randn(size(x));

% Afegir soroll al senyal
x = x + noise;

% Mostrar senyal
figure(1)
plot(t, x);
xlabel('Temps (s)');
ylabel('Amplitud');
title('Senyal sinusoidal amb soroll gaussià');

% Calcular la FFT del senyal
X = fft(x);

% Calcular l'eix de freqüència
f = (0:N-1) * Fs / N;

% Dibuixar el espectre
figure(2)
plot(f, abs(X));
xlabel('Freqüència (Hz)');
ylabel('Magnitud');
title('Espectre del senyal amb soroll gaussià');
