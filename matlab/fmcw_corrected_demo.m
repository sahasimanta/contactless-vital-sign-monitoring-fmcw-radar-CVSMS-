% Modernized independent simulation based on the capstone FMCW parameters.
% Demonstrates range estimation with a complex-baseband dechirped signal.
% This is not the original experimental radar processing pipeline.
clear; close all; clc;
c=3e8; fc=60e9; maxR=200; rangeRes=1; targetRange=100;
B=c/(2*rangeRes); Tchirp=5.5*2*maxR/c; slope=B/Tchirp;
Nr=1024; Fs=Nr/Tchirp; t=(0:Nr-1)/Fs;
tau=2*targetRange/c;
% Baseband beat frequency for a stationary point target
fbeat=slope*tau;
beat=exp(1j*2*pi*fbeat*t);
window=0.5-0.5*cos(2*pi*(0:Nr-1)/(Nr-1));
spectrum=abs(fft(beat.*window));
freq=(0:floor(Nr/2)-1)*Fs/Nr;
ranges=freq*c/(2*slope);
[~,idx]=max(spectrum(1:numel(freq)));
estimatedRange=ranges(idx);
fprintf('True range: %.2f m | Estimated range: %.2f m\n',targetRange,estimatedRange);
figure('Color','w'); plot(ranges,spectrum(1:numel(freq)),'LineWidth',1.5);
xlabel('Range (m)'); ylabel('FFT magnitude'); title('Synthetic FMCW range FFT'); grid on;
xlim([0 maxR]);
if ~exist('figures','dir'), mkdir('figures'); end
saveas(gcf,fullfile('figures','synthetic_range_fft.png'));
