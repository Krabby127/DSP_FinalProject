%% Chebyshev Type II
type = 'Chebyshev Type II';
% Calculate the order
[n, Wn] = cheb2ord(Wp, Ws, Rp, Rs); 
% Display the order
disp([type ' order: ' num2str(2*n)]); 
% Create the filter
[z, p, k] = cheby2(n,Rs,Wn, 'stop');
% Convert to an sos system
[sos,g] = zp2sos(z,p,k); 
% Create the dfilt obj
Hd = dfilt.df2tsos(sos,g); 