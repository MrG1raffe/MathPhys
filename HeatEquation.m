%% Исчезают большие гармоники
clc;
l = 1;
a = 1;
X = @(x, k) sin(pi * k * x / l); % собственные функции ЗШЛ
N = 15; % число слагаемых в ряде
x_sz = 500; % размер выходной сетки
t_sz = 500;
phi = @(x) 3 * sin(pi * x / l) + sin(2 * pi * x / l) + 0.5 * sin(4 * pi * x / l) + 0.3 * sin(20 * pi * x / l) + (x - l / 2) .^ 2 - l^2 / 4 + 0.2 * sin(30 * pi * x / l);
t1 = 0.2; % конечный момент времени
u = sol_heat_eq(a, l, X, phi, N, t1, x_sz, t_sz);

nFrames = t_sz;
mov(1:nFrames) = struct('cdata', [], 'colormap', []);

x = linspace(0, l, x_sz);
mx = max(phi(x));
for i = 1:nFrames
    plot(x, u(i, :), x, phi(x), 'r');
    axis([0, l, 0, mx]);
    mov(i) = getframe();
end

%% Теплоизолированный стержень
clc;
l = 1;
a = 1;
Xk = @(x, k) cos(pi * k * x / l); % собственные функции ЗШЛ
N = 15; % число слагаемых в ряде
x_sz = 500; % размер выходной сетки
t_sz = 500;
%phi = @(x) 3 * sin(pi * x / l) + sin(2 * pi * x / l) + 0.5 * sin(4 * pi * x / l) + 0.3 * sin(20 * pi * x / l) + (x - l / 2) .^ 2 - l^2 / 4;
phi = @(x) 3 * sin(pi * x / l) + sin(2 * pi * x / l) + 0.5 * sin(4 * pi * x / l) + 0.3 * sin(20 * pi * x / l) + (x - l / 2) .^ 2 - l^2 / 4 + 0.2 * sin(30 * pi * x / l);
t1 = 0.2; % конечный момент времени
u = sol_heat_eq(a, l, Xk, phi, N, t1, x_sz, t_sz);

nFrames = t_sz;
mov(1:nFrames) = struct('cdata', [], 'colormap', []);

mx = max(phi(x));
av = mean(phi(x));
for i = 1:nFrames
    plot(x, u(i, :), x, phi(x), x, av * ones(size(x)));
    axis([0, l, 0, mx]);
    mov(i) = getframe();
end

%%

x = linspace(0, l, x_sz);
t = linspace(0, t1, t_sz);
[X, T] = meshgrid(x, t);
surf(X, T, u, 'edgecolor', 'none');


%%
nFrames = 4;
mov(1:nFrames) = struct('cdata', [], 'colormap', []);

x = linspace(0, l, x_sz);
for i = 1:nFrames
    plot(x, sin(pi * i * x));
    hold on;
    axis([0, l, -1, 1]);
    mov(i) = getframe();
end