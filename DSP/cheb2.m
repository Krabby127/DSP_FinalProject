%% Chebyshev Type II

type = 'Chebyshev Type II';
[n, Wn] = cheb2ord(Wp, Ws, Rp, Rs); % Calculate the order
disp([type ' order: ' num2str(2*n)]); % Display the order
[z, p, k] = cheby2(n,Rs,Wn, 'stop');% Create the filter
[sos,g] = zp2sos(z,p,k); % Convert to an sos system
Hd = dfilt.df2tsos(sos,g); % Create the dfilt obj