tspan = [0, 10];    % Domeniu de timp

% Date de testare
cazuri = {
    struct('m', 1, 'k', 1,   'x0', 0, 'v0', 1, 'titlu', 'Caz a: m=1, k=1, x₀=0, v₀=1'),
    struct('m', 5, 'k', 0.5, 'x0', 2, 'v0', 0, 'titlu', 'Caz b: m=5, k=0.5, x₀=2, v₀=0')
};

for i = 1:length(cazuri)
    c = cazuri{i};
    m = c.m;
    k = c.k;

    % Ecuatia: x'' = -k/m * x
    ode = @(t, Y) [Y(2); -k/m * Y(1)];

    % Rezolvare
    [t, sol] = ode23(ode, tspan, [c.x0, c.v0]);
    x = sol(:,1);
    v = sol(:,2);

    % Energii
    T = 0.5 * m * v.^2;
    V = 0.5 * k * x.^2;
    E = T + V;

    figure('Name', ['Oscilator - ' c.titlu], 'NumberTitle', 'off');

    % Traiectorie x(t)
    subplot(1,2,1);
    plot(t, x, 'b', 'LineWidth', 2);
    title('x(t) - Pozitia în timp');
    xlabel('t [s]'); ylabel('x(t)');
    grid on;

    % Energii
    subplot(1,2,2);
    plot(t, T, 'r', 'LineWidth', 1.5); hold on;
    plot(t, V, 'b', 'LineWidth', 1.5);
    plot(t, E, 'k--', 'LineWidth', 2);
    legend('T (Kinetic)', 'V (Potential)', 'E (Total)', 'Location', 'best');
    title('Energie în timp');
    xlabel('t [s]'); ylabel('Energie [J]');
    grid on;
end
