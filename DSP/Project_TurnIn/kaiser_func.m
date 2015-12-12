%% Kaiser
type = 'Kaiser';
% Calculate order
[n, Wn, beta, ftype] = kaiserord(fcuts, mags, devs, nyq * 2); 
% Display the order
disp([type ' order: ' num2str(n)]); 
n = n + rem(n,2);
% Create the filter
hh = fir1(n, Wn, ftype, kaiser(n+1,beta), 'noscale'); 
% Create the dfilt obj
Hd = dfilt.df2t(hh); 