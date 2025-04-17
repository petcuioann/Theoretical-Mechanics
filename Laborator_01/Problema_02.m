% Date de testare
cazuri = {
    struct('t', linspace(0, pi/2, 100), 'b', 2, 'c', 3),
    struct('t', linspace(0, pi, 100),   'b', 1, 'c', 4)
};

for i = 1:length(cazuri)
    % Extragem parametrii pentru cazul curent
    t = cazuri{i}.t;
    b = cazuri{i}.b;
    c = cazuri{i}.c;

    % Pozitie
    x = 2*b*sin(t).^2;
    y = c*sin(t).*cos(t);

    % Viteza
    vx = 4*b*sin(t).*cos(t);
    vy = c*cos(2*t);

    % Acceleratie
    ax = 4*b*cos(2*t);
    ay = -2*c*sin(2*t);

    % Modulul vitezei si raza de curbura
    v_mod = sqrt(vx.^2 + vy.^2);
    numarator = v_mod.^3;
    numitor = abs(vx.*ay - vy.*ax);
    rho = numarator ./ numitor;

    figure;

    % Traiectorie
    subplot(2,2,1);
    plot(x, y, 'b', 'LineWidth', 2);
    title(['Traiectoria (b=' num2str(b) ', c=' num2str(c) ')']);
    xlabel('x'); ylabel('y');
    axis equal; grid on;

    % Viteza
    subplot(2,2,2);
    plot(t, vx, 'r--', t, vy, 'g--', 'LineWidth', 2);
    legend('v_x', 'v_y');
    title('Componentele vitezei');
    xlabel('t'); ylabel('v [m/s]');
    grid on;

    % Acceleratie
    subplot(2,2,3);
    plot(t, ax, 'r', t, ay, 'g', 'LineWidth', 2);
    legend('a_x', 'a_y');
    title('Componentele acceleratiei');
    xlabel('t'); ylabel('a [m/s^2]');
    grid on;

    % Raza de curbura
    subplot(2,2,4);
    plot(t, rho, 'm', 'LineWidth', 2);
    title('Raza de curbura');
    xlabel('t'); ylabel('\rho(t)');
    grid on;
end
