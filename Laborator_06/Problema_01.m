g = 9.8;    % Constanta gravitationala

% Date de testare
cazuri = {
    struct('tf', 3, 'theta0' , pi/3, 'v0', 0, 'l', 1, 'm', 1, 'titlu', 'Caz a: θ₀ = π/3, v₀ = 0, m = 1'),
    struct('tf', 3, 'theta0' , 0,    'v0', 2, 'l', 1, 'm', 5, 'titlu', 'Caz b: θ₀ = 0,   v₀ = 2, m = 5')
};

for i = 1:length(cazuri)
    c = cazuri{i};
    theta0 = c.theta0;
    omega0 = c.v0 / c.l;       % derivata unghiulară inițială
    l = c.l;
    m = c.m;
    tf = c.tf;

    % Sistemul de EDO pentru pendul: θ'' = -g/l * sin(θ)
    ode = @(t, Y) [Y(2); -g/l * sin(Y(1))];

    % Rezolvare cu ode23
    [t, sol] = ode23(ode, [0 tf], [theta0, omega0]);
    theta = sol(:,1);
    omega = sol(:,2);

    % Poziție reală în plan
    x = l * sin(theta);
    y = -l * cos(theta);

    % Viteza (modul): v = l * |θ̇|
    v = l * abs(omega);

    % Energii
    T = 0.5 * m * (l^2) .* omega.^2;              % energie cinetică
    V = m * g * (l - l * cos(theta));             % energie potențială
    E = T + V;                                    % energie totală

    % === Figura cu subploturi ===
    figure('Name', ['Pendul matematic - ' c.titlu], 'NumberTitle', 'off');

    % Subplot 1: Traiectoria reală cu comet
    subplot(1,2,1);
    comet(x, y);
    axis equal;
    xlabel('x'); ylabel('y');
    title(['Traiectoria pendulului - ' c.titlu]);
    grid on;

    % Subplot 2: Energiile
    subplot(1,2,2);
    plot(t, T, 'r', 'LineWidth', 1.5); hold on;
    plot(t, V, 'b', 'LineWidth', 1.5);
    plot(t, E, 'k--', 'LineWidth', 2);
    legend('T (Kinetic)', 'V (Potential)', 'E (Total)', 'Location', 'best');
    title('Energie pendul în timp');
    xlabel('t [s]'); ylabel('Energie [J]');
    grid on;
end
