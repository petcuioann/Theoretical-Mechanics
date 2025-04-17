% Date de testare
R = 7;         % distanta de la origine la centru
rC = 3;        % raza cercului
zC = 0;        % zC este constant si egal cu 0

% Generam plasa de puncte
[theta, phi] = meshgrid(linspace(0, 2*pi, 100), linspace(0, 2*pi, 100));

% Coordonatele punctelor pe suprafata
x = (R + rC * cos(theta)) .* cos(phi);
y = (R + rC * cos(theta)) .* sin(phi);
z = zC + rC * sin(theta);

% Afisarea suprafetei
figure('Name', 'Problema 1 - Suprafata generata de cercul C');
surf(x, y, z);
shading interp;
colormap jet;
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
title('Suprafata generata de rotatia cercului C in jurul axei Oz');
grid on;
