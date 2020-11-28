% sound
f0=500;
Fs = 2^16;
dt = 1 / Fs;
T = 1;
t = 0 : dt : T; t(end) = [];
x = cos(2 * pi * f0 * t);
playblocking(audioplayer(x, Fs));

% 
N = length(x);
t = (0 : (N - 1))' * dt;
M = 1000;
f = linspace(0, 550, M)';

x_f=abs(FourierTransform(x', t, 2*pi*f));


figure()
plot(t(1:400),x(1:400))
title('x(t)')
xlabel('t[sec]')

figure()
subplot (2,1,1)
plot(t(1:400),x(1:400))
title('x(t)')
xlabel('t[sec]')
subplot(2,1,2)
plot(f,x_f)
title('X(f)')
xlabel('f[hz]')



% music
clear all;
Fs = 2^13;
dt = 1 / Fs;
T = 0.4;

n = -1*[5 7 9 7 5 5 5 7 7 7 5 5 5 5 7 9 7 5 5 5 9 7 7 5 7 9];
time_to_play = [1 1 1 1 1 1 2 1 1 2 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 2];

x = [];
for i = 1:length(n)
    x = [x; MakeNote(n(i), T*time_to_play(i), dt)]; %jon
end
playblocking(audioplayer(x, Fs));

%
N = length(x);
t = (0 : (N - 1))' * dt;
M = 1000;
f = linspace(0, 550, M)';

x_f=abs(FourierTransform(x, t, 2*pi*f));

figure()
subplot (2,1,1)
plot(t(1:5000),x(1:5000))
title('x(t)')
xlabel('t[sec]')
subplot(2,1,2)
plot(f,x_f)
title('X(f)')
xlabel('f[hz]')


% g
figure; spectrogram(x, round(T * Fs), 0, 2^11, Fs, 'Yaxis'); ylim([0 0.6]);


% phase
clear all;
T = 1;
f0=500;
Fs = 2^16;
dt = 1 / Fs;
t = 0 : dt : T; t(end) = [];
figure(1);
for d = 0:(pi):(2*pi)
    b = sin(2 * pi * f0 * t + d);
    plot(b); ylim([-2 2]); xlim([1 400]);    
    hold on;
end

figure(2);
for d = 0:(pi/2):(2*pi)
    b = sin(2 * pi * f0 * t + d);
    plot(b); ylim([-2 2]); xlim([1 400]);    
    hold on;
end

% Fourier game
clear all;
phase_rand = rand(2,1)*2*pi;
amp_rand = rand(2,1)*5;
f_rand = rand(2,1)*500;

Fs = 2^16;
dt = 1 / Fs;
T = 1;
t = 0 : dt : T; t(end) = [];
t1=t(1:1000);
x = repmat(amp_rand,1,length(t)).*cos(2 * pi * f_rand * t + repmat(phase_rand,1,length(t)));
x1=x(:,1:1000);

figure()
[h,~] = size(x);
for i=1:h
    plot(t1,x1(i,:))
    hold on
end

sum_x = sum(x);
sum_x1 = sum_x(1:1000);
figure()
plot(t1,sum_x1)

% 
N = length(x);
M = 1000;
f = linspace(0, 550, M)';

x_f=abs(FourierTransform(sum_x', t', 2*pi*f));

figure()
subplot (2,1,1)
plot(t(1:400),sum_x(1:400))
title('x(t)')
xlabel('t[sec]')
subplot(2,1,2)
plot(f,x_f)
title('X(f)')
xlabel('f[hz]')

%

clear all;
phase_rand = rand(30,1)*2*pi;
amp_rand = rand(30,1)*5;
f_rand = 100+rand(30,1)*500;

Fs = 2^16;
dt = 1 / Fs;
T = 1;
t = 0 : dt : T; t(end) = [];
t1=t(1:1000);
x = repmat(amp_rand,1,length(t)).*cos(2 * pi * f_rand * t + repmat(phase_rand,1,length(t)));
x1=x(:,1:1000);

figure()
[h,~] = size(x);
for i=1:h
    plot(t1,x1(i,:))
    hold on
end

sum_x = sum(x);
sum_x1 = sum_x(1:1000);
figure()
plot(t1,sum_x1)

% 
N = length(x);
M = 1000;
f = linspace(0, 550, M)';

x_f=abs(FourierTransform(sum_x', t', 2*pi*f));

figure()
subplot (2,1,1)
plot(t(1:400),sum_x(1:400))
title('x(t)')
xlabel('t[sec]')
subplot(2,1,2)
plot(f,x_f)
title('X(f)')
xlabel('f[hz]')



