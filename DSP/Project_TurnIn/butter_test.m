function y = butter_test(x)
%BUTTER_TEST Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 13-Dec-2015 12:07:23

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
    % Hd = design(h, 'butter', ...
    %     'MatchExactly', 'stopband', ...
    %     'SystemObject', true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 -1.19109457724896 1 1 -0.980328424576093 ...
        0.963132878071047; 1 -1.19109457724896 1 1 -1.33318904630876 ...
        0.968603590486784; 1 -1.19109457724896 1 1 -0.966025775271948 ...
        0.897114330387966; 1 -1.19109457724896 1 1 -1.28015440920878 ...
        0.910624460100616; 1 -1.19109457724896 1 1 -1.2209273416032 ...
        0.861673973791691; 1 -1.19109457724896 1 1 -0.974023145117099 ...
        0.845694548694776; 1 -1.19109457724896 1 1 -1.15916088762967 ...
        0.824721179100316; 1 -1.19109457724896 1 1 -1.00158300525366 ...
        0.812161435480477; 1 -1.19109457724896 1 1 -1.09891304620724 ...
        0.802630775168496; 1 -1.19109457724896 1 1 -1.04476587509749 ...
        0.797900644579592], ...
        'ScaleValues', [0.97693211531984; 0.97693211531984; ...
        0.947174457545188; 0.947174457545188; 0.923893301844649; ...
        0.923893301844649; 0.908015947672573; 0.908015947672573; ...
        0.8999903406633; 0.8999903406633; 1]);
end

s = double(x);
y = step(Hd,s);
% Impulse response settles down after 15 samples
% Remove first 15 samples
y(1:15)=0;
% Normalize between -1 and 1
y=y./max(abs(y));
audiowrite('clean_Butter.wav',y,11025);