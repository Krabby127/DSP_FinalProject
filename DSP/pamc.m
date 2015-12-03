%% Parks-McClellan

type = 'Parks-McClellan';
[n, fo, ao, w] = firpmord(fcuts, mags, devs, nyq * 2); % Calculate order
disp([type ' order: ' num2str(n)]); % Display the order
b = firpm(n, fo, ao, w); % Create the filter
Hd = dfilt.df2t(b); % Create the dfilt obj