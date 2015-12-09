% Stopband filter
% • passbands: [0 − 1400]Hz and [1, 900 − 5, 512.5]Hz
% • stopband [1, 600 − 1, 700]Hz,
% • tolerance in the passband: 0.5 dB,
% • Maximum gain in the stopband: −100 dB
sampFreq = 11025; % Hz
Fp1 = 1400/sampFreq; % End of first passband (normalized)
Fst1 = 1600/sampFreq; % Start of stopband (normalized)
Fst2 = 1700/sampFreq; % End of stopband (normalized)
Fp2 = 1900/sampFreq; % start of second passband (normalized)
Ap1 = 0.5; % Ripple allowed in first passband (dB)
Ast = 100; % Attenuation in stopband (dB)
Ap2 = 0.5; % Ripple allowed in second passband (dB)
d = fdesign.bandstop('Fp1,Fst1,Fst2,Fp2,Ap1,Ast,Ap2',...
    Fp1, Fst1, Fst2, Fp2, Ap1,Ast,Ap2); % Filter specifications
%Creates filter specification object
H = design(d,'cheby1', 'MatchExactly', 'stopband');
% Presents filter in a legible form
fvtool(H);