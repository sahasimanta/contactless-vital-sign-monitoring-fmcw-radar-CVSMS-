% CVSMS capstone team: FMCW proof-of-concept MATLAB simulation.
% Transcribed from our AIUB capstone book, Appendix Z, pp. 73-75 (June 2024).
% Only formatting was normalized; the reported algorithm and parameters remain.
% The simulation is separate from the MR60BHA1 onboard vital-sign processing.
maxR = 200; rangeRes = 1; maxV = 70;
fc = 60e9; c = 3e8; r0 = 100; v0 = 70;
B = c/(2*rangeRes);
Tchirp = 5.5*2*maxR/c;
endle_time = 6.3e-6;
slope = B/Tchirp;
f_IFmax = (slope*2*maxR)/c;
f_IF = (slope*2*r0)/c;
Nd = 128; Nr = 1024;
vres = (c/fc)/(2*Nd*(Tchirp+endle_time));
Fs = Nr/Tchirp;
t = linspace(0, Nd*Tchirp, Nr*Nd);
angle_freq = fc*t + (slope*t.^2)/2;
freq = fc + slope*t;
Tx = cos(2*pi*angle_freq);
r0 = r0 + v0*t;
td = 2*r0/c;
freqRx = fc + slope*t;
Rx = cos(2*pi*(fc*(t-td) + (slope*(t-td).*(t-td))/2));
IF_angle_freq = fc*t + (slope*t.^2)/2 - ((fc*(t-td) + (slope*(t-td).*(t-td))/2));
freqIF = slope*td;
IFx = cos(-(2*pi*(fc*(t-td) + (slope*(t-td).*(t-td))/2)) + (2*pi*angle_freq));
doppler = 10*log10(abs(fft(IFx(1:1024))));
frequency = fftshift((-Nr/2:Nr/2-1)*(Fs/Nr));
range = frequency*c/(2*slope);
figure; plot(t(1:1024), Tx(1:1024)); xlabel('Time'); ylabel('Amplitude'); title('Tx Signal');
figure; plot(t(1:1024), Rx(1:1024)); xlabel('Time'); ylabel('Amplitude'); title('Rx Signal');
figure; plot(t(1:1024), freq(1:1024)); xlabel('Time'); ylabel('Frequency'); title('Tx F-T');
figure; plot(t(1:1024)+td(1:1024), freqRx(1:1024)); xlabel('Time'); ylabel('Frequency'); title('Chirp F-T');
figure; plot(t(1:1024), IFx(1:1024)); xlabel('Time'); ylabel('Amplitude'); title('IFx Signal');
figure; plot(range(1:512), doppler(Nr/2:Nr/2+511)); xlabel('Frequency->Distance'); ylabel('Amplitude'); title('IF Signal FFT');
figure; spectrogram(IFx,1024,[],[],Fs,'yaxis'); xlabel('Time'); ylabel('Frequency'); title('Spectrogram');
