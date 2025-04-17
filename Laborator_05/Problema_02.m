% Date de testare
b = 3;
m = 5;
c = 4 * b^2;
theta = linspace(0, 2*pi, 500);

% Traiectorie r(θ)
r = sqrt(2 * b^2 * (1 - cos(theta)));
x = r .* cos(theta);
y = r .* sin(theta);

% Setup figura
figure('Name', 'Animatie - Miscarea punctului M', 'NumberTitle', 'off');
hold on;
plot(x, y, 'k--', 'LineWidth', 1); % traseu
hPoint = plot(x(1), y(1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % punctul animat
axis equal;
xlabel('x'); ylabel('y');
title('Miscarea punctului M pe traiectorie');
grid on;

% Animatia propriu-zisa
for i = 1:length(theta)
    set(hPoint, 'XData', x(i), 'YData', y(i));
    pause(0.01);
end
