%% Process all filters and output audio files
[noise, Fs] = audioread('noisy.wav'); % Read the noise file
cheb1_test(noise);
cheb2_test(noise);
elliptic_test(noise);
kaiser_test(noise);
butter_test(noise);
pamc_test(noise);