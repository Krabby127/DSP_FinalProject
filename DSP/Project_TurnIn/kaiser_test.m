function y = kaiser_test(x)
%KAISER_TEST Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 13-Dec-2015 12:10:23

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % FIR Window Bandstop filter designed using the FIR1 function.
    %
    % % All frequency values are in Hz.
    % Fs = 11025;  % Sampling Frequency
    %
    % Fpass1 = 1400;            % First Passband Frequency
    % Fstop1 = 1600;            % First Stopband Frequency
    % Fstop2 = 1700;            % Second Stopband Frequency
    % Fpass2 = 1900;            % Second Passband Frequency
    % Dpass1 = 0.028774368332;  % First Passband Ripple
    % Dstop  = 1e-05;           % Stopband Attenuation
    % Dpass2 = 0.028774368332;  % Second Passband Ripple
    % flag   = 'scale';         % Sampling Flag
    %
    % % Calculate the order from the parameters using KAISERORD.
    % [N,Wn,BETA,TYPE] = kaiserord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 ...
    %                              0 1], [Dpass1 Dstop Dpass2]);
    %
    % % Calculate the coefficients using the FIR1 function.
    % b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [6.56153688222712e-07 5.2249100959207e-07 ...
        -5.01282059316627e-07 -1.7993100623494e-06 -1.89491379751209e-06 ...
        1.67199451283142e-07 3.287261056848e-06 4.50557872436725e-06 ...
        1.53718772167542e-06 -4.31886286165996e-06 -8.11613920815473e-06 ...
        -5.21276361309272e-06 3.71096963322e-06 1.16686171016685e-05 ...
        1.06780070265017e-05 -4.78930124682955e-07 -1.3465267410279e-05 ...
        -1.65494505683495e-05 -5.32212332607869e-06 1.19280340569405e-05 ...
        2.03783841292684e-05 1.19039859483253e-05 -6.78763107727459e-06 ...
        -1.95944091715384e-05 -1.57418693371942e-05 1.94582787535658e-07 ...
        1.31340531736552e-05 1.26654149557076e-05 2.97948395141583e-06 ...
        -3.14974023489601e-06 -2.13545837611823e-18 3.72280412422975e-06 ...
        -4.1628217737219e-06 -2.09232767042945e-05 -2.56650414499744e-05 ...
        -4.49995918249966e-07 4.31131698206945e-05 6.36043530675154e-05 ...
        2.61391514486973e-05 -5.44467125662112e-05 -0.000110845188315403 ...
        -7.72726164441393e-05 4.11319905140002e-05 0.00015287602477497 ...
        0.000148990606635157 6.36278044280809e-06 -0.000170792304256256 ...
        -0.00022538238298432 -8.68555065897738e-05 0.000148411679019094 ...
        0.000282323431620743 0.000184475997548786 -8.10901889742343e-05 ...
        -0.000295497803771656 -0.000270134711665566 -1.73749842290005e-05 ...
        0.000251785430668264 0.000309876455261776 0.000113814678336449 ...
        -0.000159883303210391 -0.000278788139884979 -0.000163426374058597 ...
        5.48886518029912e-05 0.000176021781128319 0.000125760695710597 ...
        7.46050687948777e-06 -3.44229909015708e-05 1.54382304758735e-05 ...
        3.21104836452406e-05 -8.14706698288458e-05 -0.000236169497347085 ...
        -0.00021179715633673 9.20716782949775e-05 0.000468297167670055 ...
        0.000525034061585348 6.85609051633612e-05 -0.000613485976669449 ...
        -0.000908418549492577 -0.000420690154785993 0.000574455607389534 ...
        0.00125005859797912 0.000916337179976936 -0.000295364317616398 ...
        -0.00142090005214382 -0.00143863561309194 -0.00020317531854819 ...
        0.00132245309524486 0.00182971791240046 0.000810743645354519 ...
        -0.000935528885376239 -0.00194349161428207 -0.0013470452929531 ...
        0.000349986348956637 0.00170824299405548 0.00161593797142194 ...
        0.000241897002413327 -0.00117596784400239 -0.00148046719906345 ...
        -0.000595292763380522 0.000534876309456941 0.000933877982975317 ...
        0.000496840549127838 -7.06486978519532e-05 -0.000137013471650329 ...
        0.000142333228952928 7.92021238451818e-05 -0.000601104607533154 ...
        -0.00121938657732287 -0.000753785842867809 0.000905525926109994 ...
        0.00243099673505528 0.00208469883342459 -0.000463015030944214 ...
        -0.00334016552278785 -0.00381365383818674 -0.000844050505011853 ...
        0.00351002758092154 0.00547287284111394 0.00284771045204421 ...
        -0.00266832132116963 -0.00651288316595962 -0.00509250520939282 ...
        0.00084668290972349 0.00649000821120678 0.00694157767575204 ...
        0.00156321429281128 -0.0052560269617532 -0.00777429673149634 ...
        -0.00387537289551018 0.00308003084826487 0.00722164108577007 ...
        0.00529841356278088 -0.000643659807840189 -0.00536126332571264 ...
        -0.00520447259162365 -0.00111441725183897 0.00279393084985357 ...
        0.00339795290758817 0.00127948501713796 -0.000550912563333877 ...
        -0.000289612456245122 0.000706733984409018 -0.00016779941448177 ...
        -0.00310194314982617 -0.0047665158560214 -0.00163369440323365 ...
        0.00535307411468069 0.0100628610038924 0.00636834485885507 ...
        -0.00501012600044961 -0.015099439097922 -0.0136040569393269 ...
        0.00104285895212582 0.0180468950478321 0.0220202295731117 ...
        0.00675586583027301 -0.0172259066421255 -0.0296277968753111 ...
        -0.0175558380291691 0.0116190248856165 0.0342197192287838 ...
        0.0295493057955793 -0.00126006184858607 -0.033943689535161 ...
        -0.0402979277919713 -0.0126276464621086 0.0278410607762433 ...
        0.0472937620266787 0.0278080115461301 -0.0161931293975641 ...
        -0.0485911703668989 -0.0414986801751998 0.000561832618768208 ...
        0.0433359292750777 0.0510149805221481 0.0165050733260612 ...
        -0.0320383933341053 0.945578295743065 -0.0320383933341053 ...
        0.0165050733260612 0.0510149805221481 0.0433359292750777 ...
        0.000561832618768208 -0.0414986801751998 -0.0485911703668989 ...
        -0.0161931293975641 0.0278080115461301 0.0472937620266787 ...
        0.0278410607762433 -0.0126276464621086 -0.0402979277919713 ...
        -0.033943689535161 -0.00126006184858607 0.0295493057955793 ...
        0.0342197192287838 0.0116190248856165 -0.0175558380291691 ...
        -0.0296277968753111 -0.0172259066421255 0.00675586583027301 ...
        0.0220202295731117 0.0180468950478321 0.00104285895212582 ...
        -0.0136040569393269 -0.015099439097922 -0.00501012600044961 ...
        0.00636834485885507 0.0100628610038924 0.00535307411468069 ...
        -0.00163369440323365 -0.0047665158560214 -0.00310194314982617 ...
        -0.00016779941448177 0.000706733984409018 -0.000289612456245122 ...
        -0.000550912563333877 0.00127948501713796 0.00339795290758817 ...
        0.00279393084985357 -0.00111441725183897 -0.00520447259162365 ...
        -0.00536126332571264 -0.000643659807840189 0.00529841356278088 ...
        0.00722164108577007 0.00308003084826487 -0.00387537289551018 ...
        -0.00777429673149634 -0.0052560269617532 0.00156321429281128 ...
        0.00694157767575204 0.00649000821120678 0.00084668290972349 ...
        -0.00509250520939282 -0.00651288316595962 -0.00266832132116963 ...
        0.00284771045204421 0.00547287284111394 0.00351002758092154 ...
        -0.000844050505011853 -0.00381365383818674 -0.00334016552278785 ...
        -0.000463015030944214 0.00208469883342459 0.00243099673505528 ...
        0.000905525926109994 -0.000753785842867809 -0.00121938657732287 ...
        -0.000601104607533154 7.92021238451818e-05 0.000142333228952928 ...
        -0.000137013471650329 -7.06486978519532e-05 0.000496840549127838 ...
        0.000933877982975317 0.000534876309456941 -0.000595292763380522 ...
        -0.00148046719906345 -0.00117596784400239 0.000241897002413327 ...
        0.00161593797142194 0.00170824299405548 0.000349986348956637 ...
        -0.0013470452929531 -0.00194349161428207 -0.000935528885376239 ...
        0.000810743645354519 0.00182971791240046 0.00132245309524486 ...
        -0.00020317531854819 -0.00143863561309194 -0.00142090005214382 ...
        -0.000295364317616398 0.000916337179976936 0.00125005859797912 ...
        0.000574455607389534 -0.000420690154785993 -0.000908418549492577 ...
        -0.000613485976669449 6.85609051633612e-05 0.000525034061585348 ...
        0.000468297167670055 9.20716782949775e-05 -0.00021179715633673 ...
        -0.000236169497347085 -8.14706698288458e-05 3.21104836452406e-05 ...
        1.54382304758735e-05 -3.44229909015708e-05 7.46050687948777e-06 ...
        0.000125760695710597 0.000176021781128319 5.48886518029912e-05 ...
        -0.000163426374058597 -0.000278788139884979 -0.000159883303210391 ...
        0.000113814678336449 0.000309876455261776 0.000251785430668264 ...
        -1.73749842290005e-05 -0.000270134711665566 -0.000295497803771656 ...
        -8.10901889742343e-05 0.000184475997548786 0.000282323431620743 ...
        0.000148411679019094 -8.68555065897738e-05 -0.00022538238298432 ...
        -0.000170792304256256 6.36278044280809e-06 0.000148990606635157 ...
        0.00015287602477497 4.11319905140002e-05 -7.72726164441393e-05 ...
        -0.000110845188315403 -5.44467125662112e-05 2.61391514486973e-05 ...
        6.36043530675154e-05 4.31131698206945e-05 -4.49995918249966e-07 ...
        -2.56650414499744e-05 -2.09232767042945e-05 -4.1628217737219e-06 ...
        3.72280412422975e-06 -2.13545837611823e-18 -3.14974023489601e-06 ...
        2.97948395141583e-06 1.26654149557076e-05 1.31340531736552e-05 ...
        1.94582787535658e-07 -1.57418693371942e-05 -1.95944091715384e-05 ...
        -6.78763107727459e-06 1.19039859483253e-05 2.03783841292684e-05 ...
        1.19280340569405e-05 -5.32212332607869e-06 -1.65494505683495e-05 ...
        -1.3465267410279e-05 -4.78930124682955e-07 1.06780070265017e-05 ...
        1.16686171016685e-05 3.71096963322e-06 -5.21276361309272e-06 ...
        -8.11613920815473e-06 -4.31886286165996e-06 1.53718772167542e-06 ...
        4.50557872436725e-06 3.287261056848e-06 1.67199451283142e-07 ...
        -1.89491379751209e-06 -1.7993100623494e-06 -5.01282059316627e-07 ...
        5.2249100959207e-07 6.56153688222712e-07]);
end

y = step(Hd,x);
% Disregard sample 177, as it has an unusually high impulse response
y(177)=0;
% Bound between -1 and 1
y=y./max(abs(y));
% linearly interpolate actual value of y(177)
y(177)=-(y(176)+y(178))/2;
audiowrite('clean_Kaiser.wav',y,11025);
