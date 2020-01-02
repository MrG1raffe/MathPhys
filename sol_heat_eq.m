function u = sol_heat_eq(a, l, X, phi, N, t1, x_sz, t_sz)
    x = linspace(0, l, x_sz);
    X_val = zeros(length(x), N + 1);
    for i = 1:(N + 1)
        X_val(:, i) = X(x, i - 1)';
    end
    nrm = trapz(x, X_val .^ 2);
    idx = find(nrm < 0.000001);
    nrm(idx) = ones(size(idx));
    A = trapz(x, X_val .* repmat(phi(x)', 1, N + 1)) ./ nrm;
    t = linspace(0, t1, t_sz);
    u = zeros(t_sz, x_sz);
    for i = 0:N
        T = exp(-t * (pi * a * i / l).^2);
        u = u + repmat(T', 1, x_sz) .* repmat(X_val(:, i + 1)', t_sz, 1) * A(i + 1);
    end
end