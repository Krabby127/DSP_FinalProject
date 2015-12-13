function y = Stopband_butter(x)

% Stopband filter
% passbands: [0 - 1400]Hz and [1,900 - 5,512.5]Hz
% stopband [1,600 - 1,700]Hz,
% tolerance in the passband: 0.5 dB,
% Maximum gain in the stopband: −100 dB
persistent H;
if isempty(H)
    Fs = 11025; % Hz
    Fp1 = 1400; % End of first passband 
    Fst1 = 1600; % Start of stopband 
    Fst2 = 1700; % End of stopband 
    Fp2 = 1900; % start of second passband 
    Ap1 = 0.5; % Ripple allowed in first passband (dB)
    Ast = 100; % Attenuation in stopband (dB)
    Ap2 = 0.5; % Ripple allowed in second passband (dB)
    d = fdesign.bandstop('fp1,fst1,fst2,fp2,ap1,ast,ap2',...
        Fp1, Fst1, Fst2, Fp2, Ap1,Ast,Ap2,Fs); % Filter specifications
    %Creates filter specification object
    H = design(d,'butter', 'MatchExactly', 'stopband');
    set(H,'PersistentMemory',true);
    % Presents filter in a legible form
    % fvtool(H);
end
y = filter(H,x);