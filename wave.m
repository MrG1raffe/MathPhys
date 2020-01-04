a = 1;
f = @(x, t) 0.5 * cos(a * t - x);
g = @(x, t) -0.5 * cos(a * t + x);
u = @(x, t) f(x, t) + g(x, t);

nFrames = 500;
mov(1:nFrames) = struct('cdata', [], 'colormap', []);

l = 10;
x = linspace(-l, l, 1000);
T = 8 * pi;
for i = 1:nFrames
    t = i * T / nFrames;
    subplot(2, 2, 1);
    plot(x, f(x, t));
    subplot(2, 2, 2);
    plot(x, g(x, t));
    subplot(2, 2, [3, 4]);
    plot(x, u(x, t));
    axis([-l l -1 1]);
    mov(i) = getframe();
end
