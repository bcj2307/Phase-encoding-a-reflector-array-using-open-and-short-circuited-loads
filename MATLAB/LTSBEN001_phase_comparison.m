% set(0,'DefaultFigureWindowStyle','docked')
close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%% IMPORT MEASUREMENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
match        = sparameters('900mm/Match_900mm_20250429.s2p');
open         = sparameters('900mm/Open_900mm_20250429.s2p');
short        = sparameters('900mm/Short_900mm_20250429.s2p');
matchs21_900 = rfparam(match,2,1);
opens21_900  = rfparam(open,2,1);
shorts21_900 = rfparam(short,2,1);
match        = sparameters('800mm/Match_800mm_20250429.s2p');
open         = sparameters('800mm/Open_800mm_20250429.s2p');
short        = sparameters('800mm/Short_800mm_20250429.s2p');
matchs21_800 = rfparam(match,2,1);
opens21_800  = rfparam(open,2,1);
shorts21_800 = rfparam(short,2,1);
match        = sparameters('700mm/Match_700mm_20250429.s2p');
open         = sparameters('700mm/Open_700mm_20250429.s2p');
short        = sparameters('700mm/Short_700mm_20250429.s2p');
matchs21_700 = rfparam(match,2,1);
opens21_700  = rfparam(open,2,1);
shorts21_700 = rfparam(short,2,1);
match        = sparameters('600mm/Match_600mm_20250429.s2p');
open         = sparameters('600mm/Open_600mm_20250429.s2p');
short        = sparameters('600mm/Short_600mm_20250429.s2p');
matchs21_600 = rfparam(match,2,1);
opens21_600  = rfparam(open,2,1);
shorts21_600 = rfparam(short,2,1);
match        = sparameters('900mm/Match_900mm_20250517.s2p');
open         = sparameters('900mm/Open_900mm_20250517.s2p');
short        = sparameters('900mm/Short_900mm_20250517.s2p');
matchs21_900_rept = rfparam(match,2,1);
opens21_900_rept  = rfparam(open,2,1);
shorts21_900_rept = rfparam(short,2,1);
match             = sparameters('800mm/Match_800mm_20250517.s2p');
open              = sparameters('800mm/Open_800mm_20250517.s2p');
short             = sparameters('800mm/Short_800mm_20250517.s2p');
matchs21_800_rept = rfparam(match,2,1);
opens21_800_rept  = rfparam(open,2,1);
shorts21_800_rept = rfparam(short,2,1);
match             = sparameters('700mm/Match_700mm_20250517.s2p');
open              = sparameters('700mm/Open_700mm_20250517.s2p');
short             = sparameters('700mm/Short_700mm_20250517.s2p');
matchs21_700_rept = rfparam(match,2,1);
opens21_700_rept  = rfparam(open,2,1);
shorts21_700_rept = rfparam(short,2,1);
match             = sparameters('600mm/Match_600mm_20250517.s2p');
open              = sparameters('600mm/Open_600mm_20250517.s2p');
short             = sparameters('600mm/Short_600mm_20250517.s2p');
matchs21_600_rept = rfparam(match,2,1);
opens21_600_rept  = rfparam(open,2,1);
shorts21_600_rept = rfparam(short,2,1);

freq = short.Frequencies/1e9;
fmin = 9;
fmax = 10;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

shorts21_900_phase = rad2deg(angle(shorts21_900));
shorts21_800_phase = rad2deg(angle(shorts21_800));
shorts21_700_phase = rad2deg(angle(shorts21_700));
shorts21_600_phase = rad2deg(angle(shorts21_600));
opens21_900_phase = rad2deg(angle(opens21_900));
opens21_800_phase = rad2deg(angle(opens21_800));
opens21_700_phase = rad2deg(angle(opens21_700));
opens21_600_phase = rad2deg(angle(opens21_600));

shorts21_900_mag = 20*log10(shorts21_900);
shorts21_800_mag = 20*log10(shorts21_800);
shorts21_700_mag = 20*log10(shorts21_700);
shorts21_600_mag = 20*log10(shorts21_600);
opens21_900_mag = 20*log10(opens21_900);
opens21_800_mag = 20*log10(opens21_800);
opens21_700_mag = 20*log10(opens21_700);
opens21_600_mag = 20*log10(opens21_600);

%%%%%%%%%%%%%%% S21 Short & Open 7.5-11.5 GHz [dB] %%%%%%%%%%%%%%%
% figure(200)
% plot(freq, shorts12_900_mag)
% hold on
% plot(freq, opens12_900_mag)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure S21 [dB]')
% title({'Measured S21 Shorted and Open Antenna at 900mm'})
figure(201)
plot(freq, shorts21_800_mag)
hold on
plot(freq, opens21_800_mag)
legend('Short AUT', 'Open AUT')
grid on
xlabel('Frequency [GHz]')
ylabel('Measure S21 [dB]')
title({'Measured S21 Shorted and Open Antenna at 800mm'})
% figure(202)
% plot(freq, shorts12_700_mag)
% hold on
% plot(freq, opens12_700_mag)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure S21 [dB]')
% title({'Measured S21 Shorted and Open Antenna at 700mm'})
% figure(203)
% plot(freq, shorts12_600_mag)
% hold on
% plot(freq, opens12_600_mag)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure S21 [dB]')
% title({'Measured S21 Shorted and Open Antenna at 600mm'})

% %%%%%%%%%%%%%% S21 phase Short & Open 7.5-11.5 GHz %%%%%%%%%%%%%%%
% figure(208)
% plot(freq, shorts12_900_phase)
% hold on
% plot(freq, opens12_900_phase)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 900mm'})
figure(209)
plot(freq, shorts21_800_phase)
hold on
plot(freq, opens21_800_phase)
legend('Short AUT', 'Open AUT')
grid on
xlabel('Frequency [GHz]')
ylabel('Measure phase [{\circ}]')
title({'Measured S21 Phase of the Shorted and Open Antenna at 800mm'})
% figure(210)
% plot(freq, shorts12_700_phase)
% hold on
% plot(freq, opens12_700_phase)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 700mm'})
% figure(211)
% plot(freq, shorts12_600_phase)
% hold on
% plot(freq, opens12_600_phase)
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 600mm'})

% %%%%%%%%%%%%%%%% S21 phase Short & Open 9-10 GHz %%%%%%%%%%%%%%%%%
% figure(212)
% plot(freq(kmin:kmax), shorts12_900_phase(kmin:kmax))
% hold on
% plot(freq(kmin:kmax), opens12_900_phase(kmin:kmax))
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 900mm'})
figure(213)
plot(freq(kmin:kmax), shorts21_800_phase(kmin:kmax))
hold on
plot(freq(kmin:kmax), opens21_800_phase(kmin:kmax))
legend('Short AUT', 'Open AUT')
grid on
xlabel('Frequency [GHz]')
ylabel('Measure phase [{\circ}]')
title({'Measured S21 Phase of the Shorted and Open Antenna at 800mm'})
% figure(214)
% plot(freq(kmin:kmax), shorts12_700_phase(kmin:kmax))
% hold on
% plot(freq(kmin:kmax), opens12_700_phase(kmin:kmax))
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 700mm'})
% figure(215)
% plot(freq(kmin:kmax), shorts12_600_phase(kmin:kmax))
% hold on
% plot(freq(kmin:kmax), opens12_600_phase(kmin:kmax))
% legend('Short AUT', 'Open AUT')
% xlabel('Frequency [GHz]')
% ylabel('Measure phase [{\circ}]')
% title({'Measured S21 Phase of the Shorted and Open Antenna at 600mm'})

%%%%%%%%%%%%%%%%%%%% DIFFERENCE BETWEEN OPEN & SHORT %%%%%%%%%%%%%%%%%%%%%%
diff_900_0      = rad2deg(angle(opens21_900)-angle(shorts21_900));
diff_800_0      = rad2deg(angle(opens21_800)-angle(shorts21_800));
diff_700_0      = rad2deg(angle(opens21_700)-angle(shorts21_700));
diff_600_0      = rad2deg(angle(opens21_600)-angle(shorts21_600));
diff_900_rept_0 = rad2deg(angle(opens21_900_rept)-angle(shorts21_900_rept));
diff_800_rept_0 = rad2deg(angle(opens21_800_rept)-angle(shorts21_800_rept));
diff_700_rept_0 = rad2deg(angle(opens21_700_rept)-angle(shorts21_700_rept));
diff_600_rept_0 = rad2deg(angle(opens21_600_rept)-angle(shorts21_600_rept));
wrap = 180;
for i = 1:length(diff_900_0)
    if(diff_900_0(i) > wrap)
        diff_900_0(i) = diff_900_0(i) - 360;
    end
    if(diff_900_0(i) < -wrap)
        diff_900_0(i) = diff_900_0(i) + 360;
    end
end
for i = 1:length(diff_800_0)
    if(diff_800_0(i) > wrap)
        diff_800_0(i) = diff_800_0(i) - 360;
    end
    if(diff_800_0(i) < -wrap)
        diff_800_0(i) = diff_800_0(i) + 360;
    end
end
for i = 1:length(diff_700_0)
    if(diff_700_0(i) > wrap)
        diff_700_0(i) = diff_700_0(i) - 360;
    end
    if(diff_700_0(i) < -wrap)
        diff_700_0(i) = diff_700_0(i) + 360;
    end
end
for i = 1:length(diff_600_0)
    if(diff_600_0(i) > wrap)
        diff_600_0(i) = diff_600_0(i) - 360;
    end
    if(diff_600_0(i) < -wrap)
        diff_600_0(i) = diff_600_0(i) + 360;
    end
end
for i = 1:length(diff_900_rept_0)
    if(diff_900_rept_0(i) > wrap)
        diff_900_rept_0(i) = diff_900_rept_0(i) - 360;
    end
    if(diff_900_rept_0(i) < -wrap)
        diff_900_rept_0(i) = diff_900_rept_0(i) + 360;
    end
end
for i = 1:length(diff_800_rept_0)
    if(diff_800_rept_0(i) > wrap)
        diff_800_rept_0(i) = diff_800_rept_0(i) - 360;
    end
    if(diff_800_rept_0(i) < -wrap)
        diff_800_rept_0(i) = diff_800_rept_0(i) + 360;
    end
end
for i = 1:length(diff_700_rept_0)
    if(diff_700_rept_0(i) > wrap)
        diff_700_rept_0(i) = diff_700_rept_0(i) - 360;
    end
    if(diff_700_rept_0(i) < -wrap)
        diff_700_rept_0(i) = diff_700_rept_0(i) + 360;
    end
end
for i = 1:length(diff_600_rept_0)
    if(diff_600_rept_0(i) > wrap)
        diff_600_rept_0(i) = diff_600_rept_0(i) - 360;
    end
    if(diff_600_rept_0(i) < -wrap)
        diff_600_rept_0(i) = diff_600_rept_0(i) + 360;
    end
end

%%% Measured Phase difference between the Open & Shorted Antenna S12 %%%
% figure(216)
% plot(freq, diff_900_0)
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 900mm']})
figure(217)
plot(freq, diff_800_0)
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
grid on
title({['Measured Phase difference between the Open & Shorted Antenna' ...
    ' at 800mm']})
% figure(218)
% plot(freq, diff_700_0)
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 700mm']})
% figure(219)
% plot(freq, diff_600_0)
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 600mm']})

%%% Measured Phase difference between the Open & Shorted Antenna S12 %%%
% figure(220)
% plot(freq(kmin:kmax), diff_900_0(kmin:kmax))
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 900mm']})
% figure(221)
% plot(freq(kmin:kmax), diff_800_0(kmin:kmax))
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 800mm']})
% figure(222)
% plot(freq(kmin:kmax), diff_700_0(kmin:kmax))
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 700mm']})
% figure(223)
% plot(freq(kmin:kmax), diff_600_0(kmin:kmax))
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({['Measured Phase difference between the Open & Shorted Antenna' ...
%     ' at 600mm']})

freq = short.Frequencies/1e9;
fmin = 9.5995;
fmax = 9.6005;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

%%% Measured antenna S21 %%%
% figure(1)
% fig = smithplot(freq(kmin:kmax), matchs12_900(kmin:kmax));
% fig.Marker = {'+','*','x'};
% fig.TitleTop = 'Measured antenna S12 at 900mm';
% add(fig, freq(kmin:kmax), opens12_900(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_900(kmin:kmax))
% leg = legend('Matched Antenna s12', 'Open Antenna s12', 'Shorted Antenna s12');
% leg.Location = 'southeast';
figure(2)
fig = smithplot(freq(kmin:kmax), matchs21_800(kmin:kmax));
fig.Marker = {'+','*','x'};
fig.TitleTop = 'Measured antenna S21 at 800mm';
add(fig, freq(kmin:kmax), opens21_800(kmin:kmax))
add(fig, freq(kmin:kmax), shorts21_800(kmin:kmax))
leg = legend('Matched Antenna S21', 'Open Antenna S21', 'Shorted Antenna S21');
grid on
leg.Location = 'southeast';
% figure(3)
% fig = smithplot(freq(kmin:kmax), matchs12_700(kmin:kmax));
% fig.Marker = {'+','*','x'};
% fig.TitleTop = 'Measured antenna S12 at 700mm';
% add(fig, freq(kmin:kmax), opens12_700(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_700(kmin:kmax))
% leg = legend('Matched Antenna s12', 'Open Antenna s12', 'Shorted Antenna s12');
% leg.Location = 'southeast';
% figure(4)
% fig = smithplot(freq(kmin:kmax), matchs12_600(kmin:kmax));
% fig.Marker = {'+','*','x'};
% fig.TitleTop = 'Measured antenna S12 at 600mm';
% add(fig, freq(kmin:kmax), opens12_600(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_600(kmin:kmax))
% leg = legend('Matched Antenna s12', 'Open Antenna s12', 'Shorted Antenna s12');
% leg.Location = 'southeast';

%%% Zoomed in Measured antenna S21 %%%
% figure(5)
% fig = smithplot(freq(kmin:kmax), matchs12_900(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_900(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_900(kmin:kmax))
% legend('Matched Antenna s12 at 900m', 'Open Antenna s12', 'Shorted Antenna s12')
% lim = abs(max(matchs12_900_rept(kmin:kmax)))+0.001;
% xlim([-lim lim])
% ylim([-lim lim])
figure(6)
fig = smithplot(freq(kmin:kmax), matchs21_800(kmin:kmax));
fig.Marker = {'+','*','x'};
add(fig, freq(kmin:kmax), opens21_800(kmin:kmax))
add(fig, freq(kmin:kmax), shorts21_800(kmin:kmax))
legend('Matched Antenna S21 at 800m', 'Open Antenna S21', 'Shorted Antenna S21')
grid on
lim = abs(max(matchs21_800_rept(kmin:kmax)))+0.001;
xlim([-lim lim])
ylim([-lim lim])
% figure(7)
% fig = smithplot(freq(kmin:kmax), matchs12_700(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_700(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_700(kmin:kmax))
% legend('Matched Antenna s12 at 700m', 'Open Antenna s12', 'Shorted Antenna s12')
% lim = abs(max(matchs12_700_rept(kmin:kmax)))+0.001;
% xlim([-lim lim])
% ylim([-lim lim])
% figure(8)
% fig = smithplot(freq(kmin:kmax), matchs12_600(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_600(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_600(kmin:kmax))
% legend('Matched Antenna s12 at 600m', 'Open Antenna s12', 'Shorted Antenna s12')
% lim = abs(max(matchs12_600_rept(kmin:kmax)))+0.001;
% xlim([-lim lim])
% ylim([-lim lim])

% figure(105)
% fig = smithplot(freq(kmin:kmax), matchs12_900_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_900_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_900_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 900m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])
figure(106)
fig = smithplot(freq(kmin:kmax), matchs21_800_rept(kmin:kmax));
fig.Marker = {'+','*','x'};
add(fig, freq(kmin:kmax), opens21_800_rept(kmin:kmax))
add(fig, freq(kmin:kmax), shorts21_800_rept(kmin:kmax))
legend('Matched Antenna S21 rept at 800m', 'Open Antenna S21 rept', 'Shorted Antenna S21 rept')
grid on
xlim([-lim lim])
ylim([-lim lim])
% figure(107)
% fig = smithplot(freq(kmin:kmax), matchs12_700_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_700_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_700_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 700m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])
% figure(108)
% fig = smithplot(freq(kmin:kmax), matchs12_600_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_600_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_600_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 600m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])

%%%%%%%%%%%%%%%% NORMALIZE ALL MEASUREMENTS TO MATCH LOAD %%%%%%%%%%%%%%%%%
opens21_900  = opens21_900-matchs21_900;
opens21_800  = opens21_800-matchs21_800;
opens21_700  = opens21_700-matchs21_700;
opens21_600  = opens21_600-matchs21_600;
shorts21_900 = shorts21_900-matchs21_900;
shorts21_800 = shorts21_800-matchs21_800;
shorts21_700 = shorts21_700-matchs21_700;
shorts21_600 = shorts21_600-matchs21_600;
matchs21_900 = matchs21_900-matchs21_900;
matchs21_800 = matchs21_800-matchs21_800;
matchs21_700 = matchs21_700-matchs21_700;
matchs21_600 = matchs21_600-matchs21_600;
opens21_900_rept  = opens21_900_rept-matchs21_900_rept;
opens21_800_rept  = opens21_800_rept-matchs21_800_rept;
opens21_700_rept  = opens21_700_rept-matchs21_700_rept;
opens21_600_rept  = opens21_600_rept-matchs21_600_rept;
shorts21_900_rept = shorts21_900_rept-matchs21_900_rept;
shorts21_800_rept = shorts21_800_rept-matchs21_800_rept;
shorts21_700_rept = shorts21_700_rept-matchs21_700_rept;
shorts21_600_rept = shorts21_600_rept-matchs21_600_rept;
matchs21_900_rept = matchs21_900_rept-matchs21_900_rept;
matchs21_800_rept = matchs21_800_rept-matchs21_800_rept;
matchs21_700_rept = matchs21_700_rept-matchs21_700_rept;
matchs21_600_rept = matchs21_600_rept-matchs21_600_rept;

%%% Calibrated out the Measured Matched antenna S21 %%%
% figure(9)
% fig = smithplot(freq(kmin:kmax), matchs12_900(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_900(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_900(kmin:kmax))
% legend('Matched Antenna s12 at 900m', 'Open Antenna s12', 'Shorted Antenna s12')
% xlim([-lim lim])
% ylim([-lim lim])
figure(10)
fig = smithplot(freq(kmin:kmax), matchs21_800(kmin:kmax));
fig.Marker = {'+','*','x'};
add(fig, freq(kmin:kmax), opens21_800(kmin:kmax))
add(fig, freq(kmin:kmax), shorts21_800(kmin:kmax))
legend('Matched Antenna S21 at 800m', 'Open Antenna S21', 'Shorted Antenna S21')
grid on
xlim([-lim lim])
ylim([-lim lim])
% figure(11)
% fig = smithplot(freq(kmin:kmax), matchs12_700(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_700(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_700(kmin:kmax))
% legend('Matched Antenna s12 at 700m', 'Open Antenna s12', 'Shorted Antenna s12')
% xlim([-lim lim])
% ylim([-lim lim])
% figure(12)
% fig = smithplot(freq(kmin:kmax), matchs12_600(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_600(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_600(kmin:kmax))
% legend('Matched Antenna s12 at 600m', 'Open Antenna s12', 'Shorted Antenna s12')
% xlim([-lim lim])
% ylim([-lim lim])

% figure(109)
% fig = smithplot(freq(kmin:kmax), matchs12_900_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_900_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_900_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 900m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])
figure(110)
fig = smithplot(freq(kmin:kmax), matchs21_800_rept(kmin:kmax));
fig.Marker = {'+','*','x'};
add(fig, freq(kmin:kmax), opens21_800_rept(kmin:kmax))
add(fig, freq(kmin:kmax), shorts21_800_rept(kmin:kmax))
legend('Matched Antenna S21 rept at 800m', 'Open Antenna S21 rept', 'Shorted Antenna S21 rept')
grid on
xlim([-lim lim])
ylim([-lim lim])
% figure(111)
% fig = smithplot(freq(kmin:kmax), matchs12_700_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_700_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_700_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 700m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])
% figure(112)
% fig = smithplot(freq(kmin:kmax), matchs12_600_rept(kmin:kmax));
% fig.Marker = {'+','*','x'};
% add(fig, freq(kmin:kmax), opens12_600_rept(kmin:kmax))
% add(fig, freq(kmin:kmax), shorts12_600_rept(kmin:kmax))
% legend('Matched Antenna s12 rept at 600m', 'Open Antenna s12 rept', 'Shorted Antenna s12 rept')
% xlim([-lim lim])
% ylim([-lim lim])

%%%%%%%%%%%%%%%%%%%% DIFFERENCE BETWEEN OPEN & SHORT %%%%%%%%%%%%%%%%%%%%%%
diff_900          = rad2deg(angle(opens21_900)-angle(shorts21_900));
diff_800          = rad2deg(angle(opens21_800)-angle(shorts21_800));
diff_700          = rad2deg(angle(opens21_700)-angle(shorts21_700));
diff_600          = rad2deg(angle(opens21_600)-angle(shorts21_600));
diff_900_rept     = rad2deg(angle(opens21_900_rept)-angle(shorts21_900_rept));
diff_800_rept     = rad2deg(angle(opens21_800_rept)-angle(shorts21_800_rept));
diff_700_rept     = rad2deg(angle(opens21_700_rept)-angle(shorts21_700_rept));
diff_600_rept     = rad2deg(angle(opens21_600_rept)-angle(shorts21_600_rept));

freq = short.Frequencies/1e9;
fmin = 7.5;
fmax = 11.5;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

% %%% Measured Phase difference between the Open & Shorted Antenna S21 
% % relative to the Matched S21 %%%
figure(17)
plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
legend('900mm', '800mm', '700mm', '600mm')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna', ...
    'S21 relative to the Matched S21'})

wrap = 180;
for i = 1:length(diff_900)
    if(diff_900(i) > wrap)
        diff_900(i) = diff_900(i) - 360;
    end
    if(diff_900(i) < -wrap)
        diff_900(i) = diff_900(i) + 360;
    end
end
for i = 1:length(diff_800)
    if(diff_800(i) > wrap)
        diff_800(i) = diff_800(i) - 360;
    end
    if(diff_800(i) < -wrap)
        diff_800(i) = diff_800(i) + 360;
    end
end
for i = 1:length(diff_700)
    if(diff_700(i) > wrap)
        diff_700(i) = diff_700(i) - 360;
    end
    if(diff_700(i) < -wrap)
        diff_700(i) = diff_700(i) + 360;
    end
end
for i = 1:length(diff_600)
    if(diff_600(i) > wrap)
        diff_600(i) = diff_600(i) - 360;
    end
    if(diff_600(i) < -wrap)
        diff_600(i) = diff_600(i) + 360;
    end
end
for i = 1:length(diff_900_rept)
    if(diff_900_rept(i) > wrap)
        diff_900_rept(i) = diff_900_rept(i) - 360;
    end
    if(diff_900_rept(i) < -wrap)
        diff_900_rept(i) = diff_900_rept(i) + 360;
    end
end
for i = 1:length(diff_800_rept)
    if(diff_800_rept(i) > wrap)
        diff_800_rept(i) = diff_800_rept(i) - 360;
    end
    if(diff_800_rept(i) < -wrap)
        diff_800_rept(i) = diff_800_rept(i) + 360;
    end
end
for i = 1:length(diff_700_rept)
    if(diff_700_rept(i) > wrap)
        diff_700_rept(i) = diff_700_rept(i) - 360;
    end
    if(diff_700_rept(i) < -wrap)
        diff_700_rept(i) = diff_700_rept(i) + 360;
    end
end
for i = 1:length(diff_600_rept)
    if(diff_600_rept(i) > wrap)
        diff_600_rept(i) = diff_600_rept(i) - 360;
    end
    if(diff_600_rept(i) < -wrap)
        diff_600_rept(i) = diff_600_rept(i) + 360;
    end
end

% %%% Measured Phase difference between the Open & Shorted Antenna S21 
% % relative to the Matched S21 with phase wraps corrected %%%
figure(21)
plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
legend('900mm', '800mm', '700mm', '600mm')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected'})

figure(121)
plot(freq(kmin:kmax), diff_900_rept(kmin:kmax), 'Color', [0.5 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800_rept(kmin:kmax), 'Color', [0.5 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700_rept(kmin:kmax), 'Color', [0.5 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600_rept(kmin:kmax), 'Color', [0.0 0.0 1.0 0.2])
legend('900mm repeat', '800mm repeat', '700mm repeat', '600mm repeat')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected'})

freq = short.Frequencies/1e9;
fmin = 9;
fmax = 10;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

figure(23)
plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
legend('900mm', '800mm', '700mm', '600mm')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected'})

figure(123)
plot(freq(kmin:kmax), diff_900_rept(kmin:kmax), 'Color', [0.5 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800_rept(kmin:kmax), 'Color', [0.5 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700_rept(kmin:kmax), 'Color', [0.5 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600_rept(kmin:kmax), 'Color', [0.0 0.0 1.0 0.2])
legend('900mm', '800mm', '700mm', '600mm')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected'})

%%%%%%%%%%%%%%%%%%%% 150MHz Bandwidth around 9.5GHz %%%%%%%%%%%%%%%%%%%%
freq = short.Frequencies/1e9;
fmin = 9.425;
fmax = 9.575;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

% % %%%%%%%%%%%%%%%%%%%%%%%%%%% RMSE & MAX ERROR %%%%%%%%%%%%%%%%%%%%%%%%%%%
% % n_order = 'poly2';
% % diff_900_f = fit(freq(kmin:kmax), diff_900(kmin:kmax), n_order);
% % diff_800_f = fit(freq(kmin:kmax), diff_800(kmin:kmax), n_order);
% % diff_700_f = fit(freq(kmin:kmax), diff_700(kmin:kmax), n_order);
% % diff_600_f = fit(freq(kmin:kmax), diff_600(kmin:kmax), n_order);
% % diff_900_rept_f = fit(freq(kmin:kmax), diff_900_rept(kmin:kmax), n_order);
% % diff_800_rept_f = fit(freq(kmin:kmax), diff_800_rept(kmin:kmax), n_order);
% % diff_700_rept_f = fit(freq(kmin:kmax), diff_700_rept(kmin:kmax), n_order);
% % diff_600_rept_f = fit(freq(kmin:kmax), diff_600_rept(kmin:kmax), n_order);
% 
% % figure(24)
% % plot(freq(kmin:kmax), diff_900(kmin:kmax))
% % hold on
% % plot(diff_900_f)
% % legend('900m', '900mm fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(25)
% % plot(freq(kmin:kmax), diff_800(kmin:kmax))
% % hold on
% % plot(diff_800_f)
% % legend('800m', '800mm fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(26)
% % plot(freq(kmin:kmax), diff_700(kmin:kmax))
% % hold on
% % plot(diff_700_f)
% % legend('700m', '700mm fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(27)
% % plot(freq(kmin:kmax), diff_600(kmin:kmax))
% % hold on
% % plot(diff_600_f)
% % legend('600m', '600mm fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% 
% % figure(124)
% % plot(freq(kmin:kmax), diff_900_rept(kmin:kmax))
% % hold on
% % plot(diff_900_rept_f)
% % legend('900m repeat', '900mm repeat fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(125)
% % plot(freq(kmin:kmax), diff_800_rept(kmin:kmax))
% % hold on
% % plot(diff_800_rept_f)
% % legend('800m repeat', '800mm repeat fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(126)
% % plot(freq(kmin:kmax), diff_700_rept(kmin:kmax))
% % hold on
% % plot(diff_700_rept_f)
% % legend('700m repeat', '700mm repeat fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% % figure(127)
% % plot(freq(kmin:kmax), diff_600_rept(kmin:kmax))
% % hold on
% % plot(diff_600_rept_f)
% % legend('600m repeat', '600mm repeat fit')
% % xlabel('Frequency [GHz]')
% % ylabel('Phase difference [{\circ}]')
% % title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
% %     'relative to the Matched S21 with phase wraps corrected with two different', ...
% %     'sets of measurements'})
% 
% % fit_900 = feval(diff_900_f,  freq(kmin:kmax));
% % fit_800 = feval(diff_800_f,  freq(kmin:kmax));
% % fit_700 = feval(diff_700_f,  freq(kmin:kmax));
% % fit_600 = feval(diff_600_f,  freq(kmin:kmax));
% % fit_900_rept = feval(diff_900_rept_f,  freq(kmin:kmax));
% % fit_800_rept = feval(diff_800_rept_f,  freq(kmin:kmax));
% % fit_700_rept = feval(diff_700_rept_f,  freq(kmin:kmax));
% % fit_600_rept = feval(diff_600_rept_f,  freq(kmin:kmax));
% % rmse_900 = rmse(fit_900, diff_900(kmin:kmax));
% % rmse_800 = rmse(fit_800, diff_800(kmin:kmax));
% % rmse_700 = rmse(fit_700, diff_700(kmin:kmax));
% % rmse_600 = rmse(fit_600, diff_600(kmin:kmax));
% % rmse_900_rept = rmse(fit_900_rept, diff_900_rept(kmin:kmax));
% % rmse_800_rept = rmse(fit_800_rept, diff_800_rept(kmin:kmax));
% % rmse_700_rept = rmse(fit_700_rept, diff_700_rept(kmin:kmax));
% % rmse_600_rept = rmse(fit_600_rept, diff_600_rept(kmin:kmax));
% % maxe_900 = max(abs(diff_900(kmin:kmax)-fit_900));
% % maxe_800 = max(abs(diff_800(kmin:kmax)-fit_800));
% % maxe_700 = max(abs(diff_700(kmin:kmax)-fit_700));
% % maxe_600 = max(abs(diff_600(kmin:kmax)-fit_600));
% % maxe_900_rept = max(abs(diff_900_rept(kmin:kmax)-fit_900_rept));
% % maxe_800_rept = max(abs(diff_800_rept(kmin:kmax)-fit_800_rept));
% % maxe_700_rept = max(abs(diff_700_rept(kmin:kmax)-fit_700_rept));
% % maxe_600_rept = max(abs(diff_600_rept(kmin:kmax)-fit_600_rept));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MEAN & STD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
all_data      = [diff_900(kmin:kmax), diff_800(kmin:kmax), diff_700(kmin:kmax), diff_600(kmin:kmax)];
std_all_freq  = std(all_data);                                           %%%
all_data      = all_data';
mean_all      = mean(all_data);
mean_all_avg  = mean(mean_all);                                          %%%
std_all       = std(all_data);
std_all_avg   = mean(std_all);                                           %%%
rms_all       = rms(all_data);
all_data_f    = fit(freq(kmin:kmax), mean_all', 'poly2');
fit_all_data  = feval(all_data_f, freq(kmin:kmax));

rmse_900        = rmse(mean_all', diff_900(kmin:kmax))                  %%%
rmse_800        = rmse(mean_all', diff_800(kmin:kmax))                  %%%
rmse_700        = rmse(mean_all', diff_700(kmin:kmax))                  %%%
rmse_600        = rmse(mean_all', diff_600(kmin:kmax))                  %%%
error_900       = diff_900(kmin:kmax)-mean_all';
error_800       = diff_800(kmin:kmax)-mean_all';
error_700       = diff_700(kmin:kmax)-mean_all';
error_600       = diff_600(kmin:kmax)-mean_all';
error_all_data  = [error_900, error_800, error_700, error_600];
figure(30)
plot(freq(kmin:kmax), error_all_data)
legend('900mm', '800mm', '700mm', '600mm')
grid on
xlim([fmin fmax])
ylim([-30 30])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Phase error measured from the Mean'})

% error_900       = diff_900(kmin:kmax)-mean_all';
% error_800       = diff_800(kmin:kmax)-mean_all';
% error_700       = diff_700(kmin:kmax)-mean_all';
% error_600       = diff_600(kmin:kmax)-mean_all';
% error_900       = abs(error_900);
% error_800       = abs(error_800);
% error_700       = abs(error_700);
% error_900       = abs(error_600);
% error_all_data  = [error_900, error_800, error_700, error_600];
% mean_error_freq = mean(error_all_data)                                  %%%
% mean_error_sets = mean(error_all_data');                                 %%%
% rms_error_freq  = rms(error_all_data)                                   %%%
% rms_error_sets  = rms(error_all_data');                                  %%%
% figure(30)
% plot(freq(kmin:kmax), error_all_data)
% hold on
% plot(freq(kmin:kmax), mean_error_sets, 'black', LineWidth=2)
% % plot(freq(kmin:kmax), rms_error_sets, 'black', LineWidth=2)
% legend('900mm', '800mm', '700mm', '600mm')
% grid on
% xlim([fmin fmax])
% ylim([-30 30])
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({'Phase error from mean'})

all_data_rept      = [diff_900(kmin:kmax), diff_800(kmin:kmax), diff_700(kmin:kmax), diff_600(kmin:kmax), diff_900_rept(kmin:kmax), diff_800_rept(kmin:kmax), diff_700_rept(kmin:kmax), diff_600_rept(kmin:kmax)];
std_all_freq_rept  = std(all_data_rept);                                 %%%
all_data_rept      = all_data_rept';
mean_all_rept      = mean(all_data_rept);
mean_all_rept_avg  = mean(mean_all_rept);                                %%%
std_all_rept       = std(all_data_rept);    
std_all_rept_avg   = mean(std_all_rept);                                 %%%
rms_all_rept       = rms(all_data_rept);
all_data_rept_f    = fit(freq(kmin:kmax), mean_all_rept', 'poly2');
fit_all_data_rept  = feval(all_data_rept_f, freq(kmin:kmax));

rmse_900_rept        = rmse(mean_all_rept', diff_900_rept(kmin:kmax))   %%%
rmse_800_rept        = rmse(mean_all_rept', diff_800_rept(kmin:kmax))   %%%          
rmse_700_rept        = rmse(mean_all_rept', diff_700_rept(kmin:kmax))   %%%              
rmse_600_rept        = rmse(mean_all_rept', diff_600_rept(kmin:kmax))   %%%               
error_900_rept       = diff_900_rept(kmin:kmax)-mean_all_rept';
error_800_rept       = diff_800_rept(kmin:kmax)-mean_all_rept';
error_700_rept       = diff_700_rept(kmin:kmax)-mean_all_rept';
error_600_rept       = diff_600_rept(kmin:kmax)-mean_all_rept';
error_all_data_rept  = [error_900, error_800, error_700, error_600 error_900_rept, error_800_rept, error_700_rept, error_600_rept];
figure(130)
plot(freq(kmin:kmax), error_all_data_rept)
legend('900mm', '800mm', '700mm', '600mm', ...
    '900mm repeat', '800mm repeat', '700mm repeat', '600mm repeat')
grid on
xlim([fmin fmax])
ylim([-30 30])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Phase error measured from the Mean'})

figure(28)
scatter(freq(kmin:kmax), all_data, '+')
hold on
plot(freq(kmin:kmax), mean_all, 'black', LineWidth=2)
% plot(all_data_f)
legend('900mm', '800mm', '700mm', '600mm', 'Mean', 'curve fit to mean')
grid on
xlim([fmin fmax])
ylim([-90 0])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected with two different', ...
    'sets of measurements'})

figure(128)
scatter(freq(kmin:kmax), all_data_rept, '+')
hold on
plot(freq(kmin:kmax), mean_all_rept, 'black', LineWidth=2)
% plot(all_data_rept_f)
legend('900mm', '800mm', '700mm', '600mm', '900mm repeat', '800mm repeat', '700mm repeat', '600mm repeat', 'Mean', 'curve fit to mean')
grid on
xlim([fmin fmax])
ylim([-90 0])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected with two different', ...
    'sets of measurements'})

figure(29)
plot(freq(kmin:kmax), std_all, 'b')
hold on
legend('std')
grid on
xlim([fmin fmax])
ylim([-30 30])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Standard deviation of phase difference across the bandwith of the antenna'})

figure(129)
plot(freq(kmin:kmax), std_all_rept, 'g')
hold on
plot(freq(kmin:kmax), std_all, 'b')
legend('std repeat', 'std')
grid on
xlim([fmin fmax])
ylim([-30 30])
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Standard deviation of phase difference across the bandwith of the antenna'})

%%% Measured Phase difference between the Open & Shorted Antenna S21 
% relative to the Matched S21 with phase wraps corrected with two different 
% sets of measurements %%%
freq = short.Frequencies/1e9;
fmin = 9;
fmax = 10;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

figure(150)
plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
plot(freq(kmin:kmax), diff_900_rept(kmin:kmax), 'Color', [0.5 0.0 0.0 0.2])
plot(freq(kmin:kmax), diff_800_rept(kmin:kmax), 'Color', [0.5 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700_rept(kmin:kmax), 'Color', [0.5 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600_rept(kmin:kmax), 'Color', [0.0 0.0 1.0 0.2])
legend('900mm', '800mm', '700mm', '600mm', '900mm_{repeated}', ...
    '800mm_{repeated}', '700mm_{repeated}', '600mm_{repeated}')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected with two different', ...
    'sets of measurements'})

freq = short.Frequencies/1e9;
fmin = 7.5;
fmax = 11.5;
kmin = find(freq>fmin, 1, "first");
kmax = find(freq<fmax, 1, "last");

figure(151)
plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
hold on
plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
plot(freq(kmin:kmax), diff_900_rept(kmin:kmax), 'Color', [0.5 0.0 0.0 0.2])
plot(freq(kmin:kmax), diff_800_rept(kmin:kmax), 'Color', [0.5 0.0 0.5 0.2])
plot(freq(kmin:kmax), diff_700_rept(kmin:kmax), 'Color', [0.5 0.5 0.0 0.2])
plot(freq(kmin:kmax), diff_600_rept(kmin:kmax), 'Color', [0.0 0.0 1.0 0.2])
legend('900mm', '800mm', '700mm', '600mm', '900mm_{repeated}', ...
    '800mm_{repeated}', '700mm_{repeated}', '600mm_{repeated}')
grid on
xlabel('Frequency [GHz]')
ylabel('Phase difference [{\circ}]')
title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
    'relative to the Matched S21 with phase wraps corrected with two different', ...
    'sets of measurements'})

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 150MHz Bandwidth around 9.5GHz %
% freq = short.Frequencies/1e9;
% fmin = 9.4;
% fmax = 9.6;
% kmin = find(freq>fmin, 1, "first");
% kmax = find(freq<fmax, 1, "last");
% 
% n_order = 'poly2';
% diff_900_f = fit(freq(kmin:kmax), diff_900(kmin:kmax), n_order);
% diff_800_f = fit(freq(kmin:kmax), diff_800(kmin:kmax), n_order);
% diff_700_f = fit(freq(kmin:kmax), diff_700(kmin:kmax), n_order);
% diff_600_f = fit(freq(kmin:kmax), diff_600(kmin:kmax), n_order);
% diff_900_rept_f = fit(freq(kmin:kmax), diff_900_rept(kmin:kmax), n_order);
% diff_800_rept_f = fit(freq(kmin:kmax), diff_800_rept(kmin:kmax), n_order);
% diff_700_rept_f = fit(freq(kmin:kmax), diff_700_rept(kmin:kmax), n_order);
% diff_600_rept_f = fit(freq(kmin:kmax), diff_600_rept(kmin:kmax), n_order);
% 
% figure(152)
% plot(freq(kmin:kmax), diff_900(kmin:kmax), 'Color', [0.0 0.0 0.0 0.2])
% hold on
% plot(freq(kmin:kmax), diff_800(kmin:kmax), 'Color', [0.0 0.0 0.5 0.2])
% plot(freq(kmin:kmax), diff_700(kmin:kmax), 'Color', [0.0 0.5 0.0 0.2])
% plot(freq(kmin:kmax), diff_600(kmin:kmax), 'Color', [0.0 0.5 0.5 0.2])
% plot(freq(kmin:kmax), diff_900_rept(kmin:kmax), 'Color', [0.5 0.0 0.0 0.2])
% plot(freq(kmin:kmax), diff_800_rept(kmin:kmax), 'Color', [0.5 0.0 0.5 0.2])
% plot(freq(kmin:kmax), diff_700_rept(kmin:kmax), 'Color', [0.5 0.5 0.0 0.2])
% plot(freq(kmin:kmax), diff_600_rept(kmin:kmax), 'Color', [0.0 0.0 1.0 0.2])
% plot(diff_900_f, 'r')
% plot(diff_800_f, 'g')
% plot(diff_700_f, 'b')
% plot(diff_600_f, 'm')
% plot(diff_900_rept_f, 'r')
% plot(diff_800_rept_f, 'g')
% plot(diff_700_rept_f, 'b')
% plot(diff_600_rept_f, 'm')
% legend('900mm', '800mm', '700mm', '600mm', '900mm_{repeated}', ...
%     '800mm_{repeated}', '700mm_{repeated}', '600mm_{repeated}', ...
%     '900mm fit', '800mm fit', '700mm fit', '600mm fit', ...
%     '900mm_{repeated} fit', '800mm_{repeated} fit', '700mm_{repeated} fit', '600mm_{repeated} fit')
% xlabel('Frequency [GHz]')
% ylabel('Phase difference [{\circ}]')
% title({'Measured Phase difference between the Open & Shorted Antenna S21', ...
%     'relative to the Matched S21 with phase wraps corrected with two different', ...
%     'sets of measurements'})