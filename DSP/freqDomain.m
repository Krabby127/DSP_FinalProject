% Kaiser
[n, Wn, beta, ftype] = kaiserord(fcuts, mags, devs, nyq * 2); % Calculate
% order
n = n + rem(n,2); % Order
hh = fir1(n, Wn, ftype, kaiser(n+1,beta), 'noscale'); % Create the filter
Hd = dfilt.df2t(hh); % Create the dfilt obj
output_kaiser = filter(Hd, noise); % Convolve the signal with the filter
output_kaiser = output_kaiser / max(output_kaiser); % Normalize so the
% max is 1
% Elliptic
[n, Wn] = ellipord(Wp, Ws, Rp, Rs); % Calculate the order
[z, p, k] = ellip(n,Rp, Rs, Wn, 'stop'); % Create the filter
[sos,g] = zp2sos(z,p,k); % Convert to an sos system
Hd = dfilt.df2tsos(sos,g); % Create the dfilt obj
output_elliptic = filter(Hd, noise); % Convolve the signal with the filter
output_elliptic = output_elliptic / max(output_elliptic); % Normalize so the
% max is 1
% FFTs
fft_noise = fft(noise);
fft_kaiser = fft(output_kaiser);
fft_elliptic = fft(output_elliptic);
len = length(fft_noise) / 2;
% Plots
figure;
hold on;
plot(1:len, abs(fft_noise(1:len)), 'k'); % Noise
plot(1:len, abs(fft_kaiser(1:len)), 'r'); % Kaiser
plot(1:len, abs(fft_elliptic(1:len)), 'b'); % Elliptic
xtick = (cumsum(ones(1,6)) - 1) * 1000 * 2 * len / 11025; % Define freqency
% in hz
set(gca, 'XTick', xtick); % Set xaxis to evenly space frequency
set(gca, 'XTickLabel', num2str(xtick' * 11025 / 2 / len)); % Set xaxis to hz
set(gca, 'FontSize', 14); % set font size
title('Frequency Domain', 'FontSize', 16); % title
xlabel('Frequency (Hz)', 'FontSize', 14); % x label
ylabel('FFT', 'FontSize', 14); % y label
legend('Noise', 'Kaiser', 'Elliptic');
xlim([0 len]);