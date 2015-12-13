function y = elliptic_test(x)
%ELLIPTIC_TEST Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 13-Dec-2015 12:09:18

%#codegen

% To generate C/C++ code from this function use the codegen command.
% Type 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    %
    % Fpass1 = 1400;   % First Passband Frequency
    % Fstop1 = 1600;   % First Stopband Frequency
    % Fstop2 = 1700;   % Second Stopband Frequency
    % Fpass2 = 1900;   % Second Passband Frequency
    % Apass1 = 0.5;    % First Passband Ripple (dB)
    % Astop  = 100;    % Stopband Attenuation (dB)
    % Apass2 = 1;      % Second Passband Ripple (dB)
    % Fs     = 11025;  % Sampling Frequency
    %
    % h = fdesign.bandstop('fp1,fst1,fst2,fp2,ap1,ast,ap2', Fpass1, Fstop1, ...
    %                      Fstop2, Fpass2, Apass1, Astop, Apass2, Fs);
    %
    % Hd = design(h, 'ellip', ...
    %     'MatchExactly', 'both', ...
    %     'SystemObject', true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 -1.12677877928282 1 1 -0.828458819100098 ...
        0.899177919339725; 1 -1.25180680764017 1 1 -1.38069539555517 ...
        0.921186660004898; 1 -1.16757466579574 1 1 -1.26893005210355 ...
        0.672115818827893; 1 -1.2141148174614 1 1 -0.564888943974982 ...
        0.561628515567345; 1 -1.10384883940518 1 1 -0.931191370102105 ...
        0.978450438565336; 1 -1.27183907814981 1 1 -1.38183833986224 ...
        0.982451669581542], ...
        'ScaleValues', [1.58772242934511; 1.58772242934511; ...
        4.00379512721522; 4.00379512721522; 0.110695037322561; ...
        0.110695037322561; 1]);
end

s = double(x);
y = step(Hd,s);
y=y./max(abs(y));
audiowrite('clean_Elliptic.wav',y,11025);