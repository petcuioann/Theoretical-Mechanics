% Date de testare
c = 9;         % viteza totala
cr = 2;        % componenta radiala
r0 = 1;        % pozitia initiala radiala

% Componenta transversala
ctheta = sqrt(c^2 - cr^2);  % v_theta

% Timpul
t = linspace(0, pi, 1000);

% Raza
r = r0 + cr * t;

% Integram pentru theta(t)
theta = ctheta * log(r ./ r0);   % integrarea analitica a v_theta/r(t)

% Plot in coordonate polare
figure('Name', 'Problema 2 - Traiectorie in polar', 'NumberTitle', 'off');
polarplot(theta, r, 'LineWidth', 2);
title('Traiectoria in coordonate polare');
