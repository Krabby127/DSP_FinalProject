%% Chebyshev Type I
type = 'Chebyshev Type I';
[n, Wn] = cheb1ord(Wp, Ws, Rp, Rs); % Calculate the order
disp([type ' order: ' num2str(2*n)]);
[z,p,k] = cheby1(n,Rp,Wn, 'stop'); % Create the filter
[sos,g] = zp2sos(z,p,k); % Convert to an sos system
Hd = dfilt.df2tsos(sos,g); % Create the dfilt obj