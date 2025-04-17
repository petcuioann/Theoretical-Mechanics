% Interval comun de timp
t = linspace(0, 20*pi, 2000);
r = 1;

% a) Epicicloide
k_vals_epi = [1, 3, 3.8, 2.1];
figure('Name', 'Epicicloide', 'NumberTitle', 'off');

for i = 1:length(k_vals_epi)
    k = k_vals_epi(i);

    x = r * (k + 1) * cos(t) - r * cos((k + 1) * t);
    y = r * (k + 1) * sin(t) - r * sin((k + 1) * t);

    subplot(2, 2, i);
    plot(x, y, 'LineWidth', 2);
    title(['k = ' num2str(k)]);
    axis equal;
    grid on;
    xlabel('x'); ylabel('y');
end

% b) Hipocicloide
k_vals_hipo = [4, 6, 3.8, 7.2];
figure('Name', 'Hipocicloide', 'NumberTitle', 'off');

for i = 1:length(k_vals_hipo)
    k = k_vals_hipo(i);

    x = r * (k - 1) * cos(t) + r * cos((k - 1) * t);
    y = r * (k - 1) * sin(t) - r * sin((k - 1) * t);

    subplot(2, 2, i);
    plot(x, y, 'LineWidth', 2);
    title(['k = ' num2str(k)]);
    axis equal;
    grid on;
    xlabel('x'); ylabel('y');
end
