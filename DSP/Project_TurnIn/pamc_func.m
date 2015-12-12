%% Parks-McClellan

type = 'Parks-McClellan';
% Calculate order
[n, fo, ao, w] = firpmord(fcuts, mags, devs, nyq * 2); 
% Display the order
disp([type ' order: ' num2str(n)]); 
% Create the filter
b = firpm(n, fo, ao, w); 
% Create the dfilt obj
Hd = dfilt.df2t(b); 