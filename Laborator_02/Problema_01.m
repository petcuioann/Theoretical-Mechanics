% Intervalul de timp
t = linspace(0, 2*pi, 1000);
dt = t(2) - t(1);

% Acceleratia data
ax = 2 * sin(2*t);
ay = exp(-t);
az = 4 * cos(2*t);

% Integram numeric acceleratia pentru a obtine viteza
v0 = [2; -3; 1];
vx = v0(1) + cumtrapz(t, ax);
vy = v0(2) + cumtrapz(t, ay);
vz = v0(3) + cumtrapz(t, az);

% Integram numeric viteza pentru a obtine pozitia
r0 = [-3; 2; 1];
x = r0(1) + cumtrapz(t, vx);
y = r0(2) + cumtrapz(t, vy);
z = r0(3) + cumtrapz(t, vz);

% Modulul vitezei si acceleratiei
v_mod = sqrt(vx.^2 + vy.^2 + vz.^2);
a_mod = sqrt(ax.^2 + ay.^2 + az.^2);

% Produs vectorial v x a
v = [vx; vy; vz];
a = [ax; ay; az];
v_cross_a = cross(v', a')';  % vectori coloana -> linii

% Modulul lui v x a
vxa_mod = sqrt(sum(v_cross_a.^2, 1));

% Raza de curbura
R = v_mod.^3 ./ vxa_mod;


figure('Name', 'Problema 1 - Laborator 2', 'NumberTitle', 'off');

% Traiectorie 3D
subplot(2,2,1);
plot3(x, y, z, 'b', 'LineWidth', 2);
title('Traiectorie 3D');
xlabel('x'); ylabel('y'); zlabel('z');
grid on; view(3);

% Modul vitezei
subplot(2,2,2);
plot(t, v_mod, 'r', 'LineWidth', 2);
title('|v(t)| - Modulul vitezei');
xlabel('t'); ylabel('|v(t)|');
grid on;

% Modul acceleratiei
subplot(2,2,3);
plot(t, a_mod, 'g', 'LineWidth', 2);
title('|a(t)| - Modulul acceleratiei');
xlabel('t'); ylabel('|a(t)|');
grid on;

% Raza de curbura
subplot(2,2,4);
plot(t, R, 'm', 'LineWidth', 2);
title('R(t) - Raza de curbura');
xlabel('t'); ylabel('R(t)');
grid on;
