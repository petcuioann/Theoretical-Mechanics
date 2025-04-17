% Date de testare
b = 3;
theta_span = [0 2*pi];
u0 = 1/b;     % u(0)
du0 = 0;      % u'(0)

% Sistemul de ecuatii: u'' + u = (3/4b)(1 - cos^2(theta))
% Transformam in sistem de ordin 1
odefun = @(theta, U) [U(2); (3/(4*b))*(1 - cos(theta).^2) - U(1)];

% Rezolvare cu ode45
[theta, U] = ode45(odefun, theta_span, [u0, du0]);

% Extragem u = 1/r
u = U(:,1);
r = 1 ./ u;

% Coordonate carteziene pentru afisare traiectorie
x = r .* cos(theta);
y = r .* sin(theta);

% Afisare traiectorie
figure('Name', 'Problema 1 - Traiectorie forta centrala Binet', 'NumberTitle', 'off');
plot(x, y, 'b', 'LineWidth', 2);
axis equal;
xlabel('x'); ylabel('y');
title('Traiectoria punctului M sub actiunea fortei F = -mk sin^2(\theta) / r^2');
grid on;
