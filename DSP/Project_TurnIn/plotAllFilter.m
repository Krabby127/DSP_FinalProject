%% Process all filters and output audio files
[noise, Fs] = audioread('noisy.wav'); % Read the noise file
% FFTs
fft_noise = fft(noise);
fft_cheb1 = fft(cheb1_test(noise));
fft_cheb2 = fft(cheb2_test(noise));
fft_elliptic = fft(elliptic_test(noise));
fft_kaiser = fft(kaiser_test(noise));
fft_butter = fft(butter_test(noise));
fft_pamc = fft(pamc_test(noise));
len = length(fft_noise) / 2;
% Plots
figure;
hold on;
plot((1:len), abs(fft_noise(1:len)), 'k'); % Noise
plot((1:len), abs(fft_cheb1(1:len)), 'r'); % Cheb1
plot((1:len), abs(fft_elliptic(1:len)), 'b'); % Elliptic
xtick = (0:5) * 1000 * 2 * len / 11025; % Define freqency
set(gca, 'XTick', xtick); % Set xaxis to evenly space frequency
set(gca, 'XTickLabel', num2str(xtick' * 11025 / 2 / len)); % Set xaxis to hz
title('Frequency Domain', 'FontSize', 16);
legend('Noise','Cheb1','Elliptic');
xlabel('Frequency (Hz)', 'FontSize', 14); % x label
ylabel('FFT', 'FontSize', 14); % y label
xlim([0 len]);