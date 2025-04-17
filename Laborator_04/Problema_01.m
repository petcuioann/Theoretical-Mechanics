% Date de testare
cazuri = {
    struct('R', 5, 'omega', 3, 'titlu', 'R = 5, \omega = 3'),
    struct('R', 3, 'omega', 1, 'titlu', 'R = 3, \omega = 1')
};

for i = 1:2
    R = cazuri{i}.R;
    omega = cazuri{i}.omega;

    t = linspace(0, 2*pi, 1000);

    % Traiectoria absoluta
    x = R * sin(omega * t) .* cos(omega * t);
    y = R * sin(omega * t) .* sin(omega * t);
    z = zeros(size(t));

    % Derivata pentru viteza absoluta (numeric)
    dt = t(2) - t(1);
    vx = gradient(x, dt);
    vy = gradient(y, dt);
    vz = zeros(size(t));

    % Derivata pentru acceleratie absoluta (numeric)
    ax = gradient(vx, dt);
    ay = gradient(vy, dt);
    az = zeros(size(t));

    % Modulul vitezei si acceleratiei
    v_mod = sqrt(vx.^2 + vy.^2);
    a_mod = sqrt(ax.^2 + ay.^2);

    % === Reprezentari grafice ===
    figure('Name', cazuri{i}.titlu, 'NumberTitle', 'off');

    subplot(2,2,1);
    plot(x, y, 'b', 'LineWidth', 2);
    axis equal;
    title(['Traiectoria punctului M - ' cazuri{i}.titlu]);
    xlabel('x'); ylabel('y'); grid on;

    subplot(2,2,2);
    plot(t, v_mod, 'r', 'LineWidth', 2);
    title('Modulul vitezei absolute');
    xlabel('t'); ylabel('|v(t)|'); grid on;

    subplot(2,2,3);
    plot(t, a_mod, 'g', 'LineWidth', 2);
    title('Modulul acceleratiei absolute');
    xlabel('t'); ylabel('|a(t)|'); grid on;

    subplot(2,2,4);
    plot(t, atan2(y, x), 'm', 'LineWidth', 2);
    title('Unghi polar \theta(t)');
    xlabel('t'); ylabel('\theta'); grid on;
end
