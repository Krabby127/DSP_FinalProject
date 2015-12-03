%% Kaiser
type = 'Kaiser';
[n, Wn, beta, ftype] = kaiserord(fcuts, mags, devs, nyq * 2); % Calculate
order
disp([type ' order: ' num2str(n)]); % Display the order
n = n + rem(n,2);
hh = fir1(n, Wn, ftype, kaiser(n+1,beta), 'noscale'); % Create the filter
Hd = dfilt.df2t(hh); % Create the dfilt obj