% Date de testare
c = 9;
cr = 2;
r0 = 1;
t = linspace(0, pi, 100);

% Componenta tangentiala (v_theta)
ctheta = sqrt(c^2 - cr^2);  % = sqrt(77)

% r(t) si theta(t)
r = r0 + cr * t;
theta = (ctheta / cr) * log(r / r0);   % => theta(t) = (sqrt(77)/2) * log(1 + 2t)

% Afisare grafic in coordonate polare
figure('Name', 'Traiectorie in coordonate polare', 'NumberTitle', 'off');
polarplot(theta, r, 'LineWidth', 2);
title('Traiectoria punctului P cu v = 9, v_r = 2');
