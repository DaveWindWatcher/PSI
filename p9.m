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
figure(3)
plot(t, x);
xlabel('Temps (s)');
ylabel('Amplitud');
title('Senyal sinusoidal amb soroll gaussià');

% Calcular la FFT del senyal
X = fft(x);

% Calcular l'eix de freqüència
f = (0:N-1) * Fs / N;

% Dibuixar el espectre
figure(4)
plot(f, abs(X));
xlabel('Freqüència (Hz)');
ylabel('Magnitud');
title('Espectre del senyal amb soroll gaussià');



%% Activitat 2

%% a)
% Señal original
n = [0:31];
x = sin(2*pi*4.5*n/32) + sin(2*pi*6.5*n/32);

% Aplicar ventana Hanning y Blackmann
xh = x.*hanning(32)';
xb = x.*blackman(32)';

% Calcular la DFT
X = fft(x);
Xh = fft(xh);
Xb = fft(xb);

% Espectro en dB
X_dB = 20*log10(abs(X)/max(abs(X)));
Xh_dB = 20*log10(abs(Xh)/max(abs(Xh)));
Xb_dB = 20*log10(abs(Xb)/max(abs(Xb)));

% Visualizar el espectro
f = [0:length(X)-1]/length(X);
figure(5)
plot(f, X_dB, 'b', f, Xh_dB, 'r', f, Xb_dB, 'g');
xlabel('Frecuencia normalizada');
ylabel('Amplitud (dB)');
legend('Original', 'Hanning', 'Blackmann');
ylim([-60 0]);

% Zero-padding
N = 512;
xn = [x, zeros(1, N-length(x))];
xhn = [xh, zeros(1, N-length(xh))];
xbn = [xb, zeros(1, N-length(xb))];

% Calcular la DFT con zero-padding
Xn = fft(xn);
Xhn = fft(xhn);
Xbn = fft(xbn);

% Espectro en dB
Xn_dB = 20*log10(abs(Xn)/max(abs(Xn)));
Xhn_dB = 20*log10(abs(Xhn)/max(abs(Xhn)));
Xbn_dB = 20*log10(abs(Xbn)/max(abs(Xbn)));

% Visualizar el espectro con zero-padding
fn = [0:length(Xn)-1]/length(Xn);
figure(6)
plot(fn, Xn_dB, 'b', fn, Xhn_dB, 'r', fn, Xbn_dB, 'g');
xlabel('Frecuencia normalizada');
ylabel('Amplitud (dB)');
legend('Original', 'Hanning', 'Blackmann');
ylim([-60 0]);

%% b) Efecte sobre el rang dinàmic

% Senal original
n = [0:63];
x = sin(2*pi*10.1*n/64) + 0.001*cos(2*pi*15.2*n/64) + 0.001*sin(2*pi*20.3*n/64) + 0.001*cos(2*pi*25.2*n/64);

% Aplicar ventana rectangular
xr = x.*rectwin(64)';

% Aplicar ventana Hanning
xh = x.*hanning(64)';

% Aplicar ventana Blackmann
xb = x.*blackman(64)';

% Calcular la DFT
X = fft(x);
Xr = fft(xr);
Xh = fft(xh);
Xb = fft(xb);

% Magnitud del espectro
X_mag = abs(X);
Xr_mag = abs(Xr);
Xh_mag = abs(Xh);
Xb_mag = abs(Xb);

% Espectro en dB
X_dB = 20*log10(X_mag/max(X_mag));
Xr_dB = 20*log10(Xr_mag/max(Xr_mag));
Xh_dB = 20*log10(Xh_mag/max(Xh_mag));
Xb_dB = 20*log10(Xb_mag/max(Xb_mag));

% Visualizar el espectro
f = [0:length(X)-1]/length(X);
figure(7)
plot(f, X_dB, 'b', f, Xr_dB, 'r', f, Xh_dB, 'g', f, Xb_dB, 'k');
xlabel('Frecuencia normalizada');
ylabel('Amplitud (dB)');
legend('Original', 'Rectangular', 'Hanning', 'Blackmann');
ylim([-80 0]);

%% Zero Padding
% Senal original
n = [0:63];
x = sin(2*pi*10.1*n/64) + 0.001*cos(2*pi*15.2*n/64) + 0.001*sin(2*pi*20.3*n/64) + 0.001*cos(2*pi*25.2*n/64);

% Aplicar ventana rectangular
xr = x.*rectwin(64)';

% Aplicar ventana Hanning
xh = x.*hanning(64)';

% Aplicar ventana Blackmann
xb = x.*blackman(64)';

% Calcular la DFT con zero-padding
N = 512;
X = fft(x, N);
Xr = fft(xr, N);
Xh = fft(xh, N);
Xb = fft(xb, N);

% Magnitud del espectro con zero-padding
X_mag = abs(X);
Xr_mag = abs(Xr);
Xh_mag = abs(Xh);
Xb_mag = abs(Xb);

% Espectro en dB con zero-padding
X_dB = 20*log10(X_mag/max(X_mag));
Xr_dB = 20*log10(Xr_mag/max(Xr_mag));
Xh_dB = 20*log10(Xh_mag/max(Xh_mag));
Xb_dB = 20*log10(Xb_mag/max(Xb_mag));

% Visualizar el espectro con zero-padding
f = [0:N-1]/N;
figure(8)
plot(f, X_dB, 'b', f, Xr_dB, 'r', f, Xh_dB, 'g', f, Xb_dB, 'k');
xlabel('Frecuencia normalizada');
ylabel('Amplitud (dB)');
legend('Original', 'Rectangular', 'Hanning', 'Blackmann');
ylim([-80 0]);










