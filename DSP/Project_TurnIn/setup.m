%% Setup
nyq = 11025 / 2; % Define nyquist frequency
Wp = [1400, 1900] / nyq; % Passband ranges
Ws = [1600, 1700] / nyq; % Stopband ranges
Rp = 0.5; % Passband ripple in decibels.
Rs = 100; % Stopband attenuation in decibels.
fcuts = [1400, 1600, 1700, 1900]; % Cutoff frequencies
mags = [1 0 1]; % Magnitudes (stopband)
devs = [10^(1/40),-1, 10^-5, 10^(1/40),-1]; % ripples
[noise, Fs] = audioread('noisy.wav'); % Read the noise file