% Date de testare
c = sqrt(3);                            % moment cinetic specific
u0 = 1;                                 % u(0) = 1/r0
du0 = 0;                                % u'(0)
theta_span = linspace(0, 2*pi, 1000);   % domeniu θ

% Ecuatia lui Binet: u'' + u = 2/3
odefun = @(theta, U) [U(2); (2/3) - U(1)];

% Rezolvare numerica
[theta, U] = ode45(odefun, theta_span, [u0, du0]);
u = U(:,1);
r = 1 ./ u;

% Coordonate carteziene
x = r .* cos(theta);
y = r .* sin(theta);

% Derivare numerica pentru vector viteza
dt = theta(2) - theta(1);
dx = gradient(x, dt);
dy = gradient(y, dt);

% Normalizare vectori viteza pentru afisare (optional: scala adaptata)
v_scale = 0.3;  % scara vectorilor
vx = v_scale * dx ./ sqrt(dx.^2 + dy.^2);
vy = v_scale * dy ./ sqrt(dx.^2 + dy.^2);

% === ANIMATIE ===
figure('Name', 'Traiectorie + Animatie cu Vector Viteza', 'NumberTitle', 'off');
hold on;
plot(x, y, 'k--');                     % traiectorie fundal
h_point = plot(x(1), y(1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
h_vec = quiver(x(1), y(1), vx(1), vy(1), 0, 'r', 'LineWidth', 1.5);  % vector viteza

axis equal;
xlim([min(x)-1, max(x)+1]);
ylim([min(y)-1, max(y)+1]);
xlabel('x'); ylabel('y');
title('Animația punctului M cu vectorul vitezei');
grid on;

% Animatie propriu-zisa
for i = 1:10:length(theta)
    set(h_point, 'XData', x(i), 'YData', y(i));
    set(h_vec, 'XData', x(i), 'YData', y(i), 'UData', vx(i), 'VData', vy(i));
    pause(0.01);
end
