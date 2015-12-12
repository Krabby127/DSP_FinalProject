%% Chebyshev Type I
type = 'Chebyshev Type I';
% Calculate the order
[n, Wn] = cheb1ord(Wp, Ws, Rp, Rs); 
disp([type ' order: ' num2str(2*n)]);
% Create the filter
[z,p,k] = cheby1(n,Rp,Wn, 'stop'); 
% Convert to an sos system
[sos,g] = zp2sos(z,p,k); 
% Create the dfilt obj
Hd = dfilt.df2tsos(sos,g); 