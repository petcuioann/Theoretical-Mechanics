% Date de testare
h = 40;         % inaltime initiala
v0 = 5;         % viteza initiala
k = 0.1;        % coeficient de rezistenta
g = 9.8;        % constanta de greutate
tf = 3;         % timp final
t = linspace(0, tf, 1000);

% Ecuatii analitice
vx = v0 * exp(-k * t);
vy = (g / k) * (exp(-k * t) - 1);
x = (v0 / k) * (1 - exp(-k * t));
y = - (g / k^2) * exp(-k * t) - (g / k) * t + (g / k^2) + h;

% Reprezentare grafica
figure('Name', 'Problema 4 - Traiectorie cu rezistenta aerului', 'NumberTitle', 'off');
plot(x, y, 'b', 'LineWidth', 2);
xlabel('x [m]'); ylabel('y [m]');
title('Traiectoria proiectilului cu rezistenta aerului');
grid on; axis equal;

% Determinare moment impact (cand y ≈ 0)
idx_impact = find(y <= 0, 1);
x_impact = x(idx_impact);
vy_impact = vy(idx_impact);
vx_impact = vx(idx_impact);
v_impact = sqrt(vx_impact^2 + vy_impact^2);

% Afisare rezultate
fprintf('\n--- Problema 4 (cu rezistenta) ---\n');
fprintf('Bataie (x la impact): %.2f m\n', x_impact);
fprintf('Viteza la impact: %.2f m/s (vx = %.2f, vy = %.2f)\n', v_impact, vx_impact, vy_impact);
