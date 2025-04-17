g = 9.8;    % Constanta greutatii

% Date de testare: [x0, y0, v0, alpha]
cazuri = {
    struct('x0', 0, 'y0', 0,  'v0', 8,  'alpha', pi/3,  'titlu', 'a) α = π/3, v₀ = 8, M₀(0,0)'),
    struct('x0', 0, 'y0', 10, 'v0', 15, 'alpha', pi/4,  'titlu', 'b) α = π/4, v₀ = 15, M₀(0,10)'),
    struct('x0', 0, 'y0', 40, 'v0', 5,  'alpha', 0,     'titlu', 'c) α = 0, v₀ = 5, M₀(0,40)'),
    struct('x0', 10,'y0', 30, 'v0', 3,  'alpha', pi/2,  'titlu', 'd) α = π/2, v₀ = 3, M₀(10,30)')
};

for i = 1:length(cazuri)
    c = cazuri{i};
    v0x = c.v0 * cos(c.alpha);
    v0y = c.v0 * sin(c.alpha);

    % Determinam timpul final (cand y(t) = 0)
    syms t_sym
    y_t = c.y0 + v0y * t_sym - 0.5 * g * t_sym^2;
    tf = double(solve(y_t == 0, t_sym));
    tf = max(tf);  % luam solutia pozitiva

    % Timp discret
    t = linspace(0, tf, 500);

    % Traiectorie
    x = c.x0 + v0x * t;
    y = c.y0 + v0y * t - 0.5 * g * t.^2;

    % Viteza la impact
    vy_final = v0y - g * tf;
    v_final = sqrt(v0x^2 + vy_final^2);

    % Inaltime maxima
    t_max = v0y / g;
    h_max = c.y0 + v0y^2 / (2*g);

    % Bataia
    d = c.x0 + v0x * tf;

    % Afisare rezultate in consola
    fprintf('\n %s \n', c.titlu);
    fprintf('Inaltime maxima: %.2f m\n', h_max);
    fprintf('Bataie: %.2f m\n', d);
    fprintf('Viteza la impact: %.2f m/s (vx=%.2f, vy=%.2f)\n', v_final, v0x, vy_final);

    % Plot
    figure('Name', c.titlu, 'NumberTitle', 'off');
    plot(x, y, 'b', 'LineWidth', 2);
    xlabel('x [m]'); ylabel('y [m]');
    title(['Traiectorie proiectil ' c.titlu]);
    grid on; axis equal;
end
