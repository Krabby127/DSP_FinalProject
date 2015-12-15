function y = cheb2_test(x)
%CHEB2_TEST Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 13-Dec-2015 12:08:50

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
    % Hd = design(h, 'cheby2', ...
    %     'MatchExactly', 'stopband', ...
    %     'SystemObject', true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 -1.24531029499365 1 1 -0.991983826052835 ...
        0.954422875092953; 1 -1.13402336637907 1 1 -1.31608268163385 ...
        0.960665393118484; 1 -1.23480289639158 1 1 -0.987525704849297 ...
        0.87847600070225; 1 -1.14554909272881 1 1 -1.24356407639515 ...
        0.891600569352674; 1 -1.21558056483997 1 1 -1.16254906230578 ...
        0.842367831947616; 1 -1.16604248003981 1 1 -1.02167023604817 ...
        0.83225398716707; 1 -1.19109457724896 1 1 -1.08429705223745 ...
        0.820673308314146], ...
        'ScaleValues', [0.974290896092787; 0.974290896092787; ...
        0.939715203602687; 0.939715203602687; 0.917802814471459; ...
        0.917802814471459; 0.910336654157073; 1]);
end

s = double(x);
y = step(Hd,s);
% Impulse response settles down after ~ 28 samples
% Ignore first 28 samples
y(1:28)=0;
% Bound between -1 and 1
y=y./max(abs(y));
audiowrite('clean_Cheb2.wav',y,11025);