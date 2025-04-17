% Date de testare
cazuri = {
    struct('t', linspace(0, 3, 500), 'b', 1,   'k', 3,   'titlu', 't \in [0, 3], b = 1, k = 3'),
    struct('t', linspace(0, 6, 600), 'b', 5,   'k', 2,   'titlu', 't \in [0, 6], b = 5, k = 2'),
    struct('t', linspace(0, 9, 900), 'b', 0.5, 'k', 4,   'titlu', 't \in [0, 9], b = 0.5, k = 4')
};

figure('Name', 'Traiectorii in coordonate polare', 'NumberTitle', 'off');

for i = 1:length(cazuri)
    % Datele cazului
    t = cazuri{i}.t;
    b = cazuri{i}.b;
    k = cazuri{i}.k;
    titlu = cazuri{i}.titlu;

    % Calcul polar
    r = b + b * cos(t);
    theta = k * t;

    % Subplot cu polarplot
    subplot(1, 3, i);
    polarplot(theta, r, 'LineWidth', 2);
    title(titlu);
end
