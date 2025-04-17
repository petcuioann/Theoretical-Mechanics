% Date de testare
cazuri = {
    struct('t', linspace(0, 2*pi, 1000), 'titlu', 't \in [0, 2\pi]'),
    struct('t', linspace(0, 10*pi, 1000), 'titlu', 't \in [0, 10\pi]')
};

for i = 1:length(cazuri)
    t = cazuri{i}.t;

    % Pozitie
    x = t .* cos(t);
    y = t .* sin(t);
    z = log(t + 1);

    % Viteza
    vx = cos(t) - t .* sin(t);
    vy = sin(t) + t .* cos(t);
    vz = 1 ./ (t + 1);

    % Acceleratia
    ax = -2 * sin(t) - t .* cos(t);
    ay = 2 * cos(t) - t .* sin(t);
    az = -1 ./ (t + 1).^2;

    % Vectori viteza si acceleratie
    v = [vx; vy; vz];
    a = [ax; ay; az];

    % Modulul vitezei
    v_mod = sqrt(sum(v.^2, 1));

    % Modulul acceleratiei
    a_mod = sqrt(sum(a.^2, 1));

    % Produsul vectorial v × a (pe coloane)
    vx_a = cross(v', a')';  % transpunem pentru a face calculele pe linii

    % Modulul v × a
    norm_vxa = sqrt(sum(vx_a.^2, 1));

    % Raza de curbura
    rho = v_mod.^3 ./ norm_vxa;

    % === Afisare ===
    figure('Name', cazuri{i}.titlu, 'NumberTitle', 'off');

    % Traiectoria 3D
    subplot(2,2,1);
    plot3(x, y, z, 'b', 'LineWidth', 2);
    title(['Traiectorie 3D - ' cazuri{i}.titlu]);
    xlabel('x'); ylabel('y'); zlabel('z');
    grid on; axis tight; view(3);

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
    plot(t, rho, 'm', 'LineWidth', 2);
    title('\rho(t) - Raza de curbura');
    xlabel('t'); ylabel('\rho(t)');
    grid on;
end
