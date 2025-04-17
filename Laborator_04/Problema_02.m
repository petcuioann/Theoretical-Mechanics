t = linspace(0, 5, 1000);   % Timpul

% Solutii analitice
x = cos(2 * t);             % x(t)
y = sin(t);                 % y(t)

% Reprezentare grafica a traiectoriei
figure('Name', 'Problema 2 - Traiectoria punctului M', 'NumberTitle', 'off');
plot(x, y, 'b', 'LineWidth', 2);
grid on;
axis equal;
xlabel('x(t)');
ylabel('y(t)');
title('Traiectoria punctului M sub actiunea fortei F = (-4x, -y)');
    