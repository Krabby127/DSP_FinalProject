%% Plot the filter
xtick = (cumsum(ones(1,51)) - 1) * 100 * 2 / 11025; % Define freqency in hz
h = fvtool(Hd); % Display the magnitude
% set(h,'analysis','freq'); % Set analysis to frequency
set(gca, 'Fontsize', 14); % Set fontsize
set(gca, 'XTick', xtick); % Set xaxis to evenly space frequency
set(gca, 'XTickLabel', num2str(xtick' * 11025 / 2)); % Set xaxis to hz
xlabel('Frequency (Hz)', 'FontSize', 14); % Label xaxis
set(get(gca, 'YLabel'), 'FontSize', 14); % Set yaxis fontsize
title([type ' Magnitude & Frequency Response'], 'FontSize', 16); % Title
xlim([.2431 .3556]); % Set x bounds, 1340 to 1960 hz
ylim([-110 10]); % set y bounds
% Group Delay plot
grpdelay(Hd); % Plot group delay
set(gca, 'Fontsize', 14); % Set fontsize
set(gca, 'XTick', xtick(1:10:end)); % Set xaxis to evenly space frequenc
set(gca, 'XTickLabel', num2str(xtick(1:10:end)' * 11025 / 2)); % Set xaxis to hz
xlabel('Frequency (Hz)', 'FontSize', 14); % Label xaxis
set(get(gca, 'YLabel'), 'FontSize', 14); % Set yaxis fontsize
title([type ' Group Delay'], 'FontSize', 16); % Title
xlim([.1 .9]); % Set x axis bounds
% Pole-Zero plot
zplane(Hd); % Plot the pole-zero diagram
set(gca, 'FontSize', 14); % Scale font size
title([type ' Pole-Zero Plot'], 'FontSize', 16); % Title
set(get(gca, 'XLabel'), 'FontSize', 14); % X label font size
set(get(gca, 'YLabel'), 'FontSize', 14); % Y label font size
% Impulse Response
figure; % new figure
hold on;
set(gca, 'FontSize', 14); % set font size
title([type ' Impulse Response (size 100)'], 'FontSize', 16); % title
xlabel('n', 'FontSize', 14); % x label
ylabel('h[n]', 'FontSize', 14); % y label
y = filter(Hd,[1 zeros(1,99)]); % Convolve an impulse with the filter
stem(1:100, y); % Plot the impulse response
% Sound output
output = filter(Hd, noise); % Convolve the signal with the filter
output = output / max(output); % Normalize so the max is 1
sound(output, Fs); % Play the output sound
