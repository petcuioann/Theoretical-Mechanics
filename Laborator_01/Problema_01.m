t = linspace(0, 5, 500);            % Interval de timp
v = t ./ (t.^2 + 1);                % Viteza
a = (1 - t.^2) ./ (t.^2 + 1).^2;    % Acceleratia

% Modulul vitezei
subplot(2, 1, 1);
plot(t, v, 'b', 'LineWidth', 2);
xlabel('t [s]');
ylabel('|v(t)| [m/s]');
title('Modulul vitezei');
grid on;

% Acceleratia
subplot(2, 1, 2);
plot(t, a, 'r', 'LineWidth', 2);
xlabel('t [s]');
ylabel('a(t) [m/s^2]');
title('Acceleratia');
grid on;
