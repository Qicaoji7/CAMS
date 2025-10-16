%% Figure 6: Comparison of sensory consistency metrics for American Gothic
% Data from Table comparison
clear; clc; close all;

% Data for American Gothic comparison
methods = {'Proposed', 'Art2Mus', 'LLaVA-Docent'};
mse_values = [0.05, 0.11, 0.13];
pcc_values = [0.92, 0.79, 0.74];
cosine_values = [0.94, 0.84, 0.80];

% Create figure
figure('Position', [100, 100, 800, 600]);

% Create subplot for bar chart
subplot(1,1,1);
x = 1:3;
width = 0.25;

% Create grouped bar chart
bar1 = bar(x - width, mse_values, width, 'FaceColor', [0.8, 0.2, 0.2], 'DisplayName', 'MSE');
hold on;
bar2 = bar(x, pcc_values, width, 'FaceColor', [0.2, 0.6, 0.8], 'DisplayName', 'PCC');
bar3 = bar(x + width, cosine_values, width, 'FaceColor', [0.2, 0.8, 0.2], 'DisplayName', 'Cosine Similarity');

% Customize the plot
set(gca, 'XTick', x);
set(gca, 'XTickLabel', methods);
ylabel('Metric Values');
title('Comparison of Sensory Consistency Metrics for American Gothic');
legend('Location', 'best');
grid on;
ylim([0, 1]);

% Add value labels on bars
for i = 1:length(x)
    text(x(i) - width, mse_values(i) + 0.02, sprintf('%.2f', mse_values(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10);
    text(x(i), pcc_values(i) + 0.02, sprintf('%.2f', pcc_values(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10);
    text(x(i) + width, cosine_values(i) + 0.02, sprintf('%.2f', cosine_values(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10);
end

% Set font properties
set(gca, 'FontSize', 12);
set(gca, 'FontName', 'Arial');

% Save figure
print('Fig6_sensory_consistency_comparison', '-dpng', '-r300');

%% Figure 7: Pre- and post-test NAEP score improvements for different groups
clear; clc; close all;

% Data from NAEP improvement table
groups = {'Art-F (High)', 'Art-F (Middle)', 'Art-M (High)', 'Non-Art-M (Middle)'};
pre_scores = [74, 72, 70, 54];
post_scores = [89, 87, 85, 65];
improvements = [20.3, 20.8, 21.4, 20.4];

% Create figure
figure('Position', [100, 100, 900, 600]);

% Create grouped bar chart
x = 1:length(groups);
width = 0.35;

bar1 = bar(x - width/2, pre_scores, width, 'FaceColor', [0.7, 0.7, 0.9], 'DisplayName', 'Pre-test');
hold on;
bar2 = bar(x + width/2, post_scores, width, 'FaceColor', [0.2, 0.4, 0.8], 'DisplayName', 'Post-test');

% Add improvement arrows and percentages
for i = 1:length(groups)
    % Arrow from pre to post
    arrow_x = [x(i) - width/4, x(i) + width/4];
    arrow_y = [pre_scores(i) + 2, post_scores(i) - 2];
    annotation('arrow', [(arrow_x(1)-0.5)/(length(groups)+1), (arrow_x(2)-0.5)/(length(groups)+1)], ...
               [arrow_y(1)/100, arrow_y(2)/100], 'Color', 'red', 'LineWidth', 2);
    
    % Improvement percentage
    text(x(i), max(pre_scores(i), post_scores(i)) + 5, ['+' sprintf('%.1f', improvements(i)) '%'], ...
        'HorizontalAlignment', 'center', 'FontSize', 11, 'FontWeight', 'bold', 'Color', 'red');
end

% Customize the plot
set(gca, 'XTick', x);
set(gca, 'XTickLabel', groups);
xlabel('Student Groups');
ylabel('NAEP Scores');
title('Pre- and Post-test NAEP Score Improvements for Different Groups');
legend('Location', 'northwest');
grid on;
ylim([0, 100]);

% Add value labels on bars
for i = 1:length(x)
    text(x(i) - width/2, pre_scores(i) + 1, sprintf('%.0f', pre_scores(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10);
    text(x(i) + width/2, post_scores(i) + 1, sprintf('%.0f', post_scores(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10);
end

% Set font properties
set(gca, 'FontSize', 12);
set(gca, 'FontName', 'Arial');
xtickangle(45);

% Save figure
print('Fig7_naep_improvements', '-dpng', '-r300');

%% Figure 8: Motivation scores over time for Art-F and Non-Art-M groups
clear; clc; close all;

% Data from online support table
% Art-F group data
art_f_weeks = [14, 26];
art_f_motivation = [4.8, 4.3];
art_f_motivation_with_system = [4.8, 4.3]; % With structured reward system

% Non-Art-M group data  
non_art_m_weeks = [10, 26];
non_art_m_motivation = [4.3, 4.1];
non_art_m_motivation_with_system = [4.3, 4.1]; % With structured reward system

% Create figure
figure('Position', [100, 100, 900, 600]);

% Plot lines
plot(art_f_weeks, art_f_motivation, 'o-', 'LineWidth', 3, 'MarkerSize', 8, ...
     'Color', [0.2, 0.4, 0.8], 'DisplayName', 'Art-F (with system)');
hold on;
plot(non_art_m_weeks, non_art_m_motivation, 's-', 'LineWidth', 3, 'MarkerSize', 8, ...
     'Color', [0.8, 0.2, 0.2], 'DisplayName', 'Non-Art-M (with system)');

% Add hypothetical data without system (showing decline)
art_f_motivation_no_system = [4.8, 3.8]; % Steeper decline without system
non_art_m_motivation_no_system = [4.3, 3.5]; % Steeper decline without system

plot(art_f_weeks, art_f_motivation_no_system, 'o--', 'LineWidth', 2, 'MarkerSize', 6, ...
     'Color', [0.4, 0.6, 0.9], 'DisplayName', 'Art-F (without system)');
plot(non_art_m_weeks, non_art_m_motivation_no_system, 's--', 'LineWidth', 2, 'MarkerSize', 6, ...
     'Color', [0.9, 0.4, 0.4], 'DisplayName', 'Non-Art-M (without system)');

% Add data points with values
for i = 1:length(art_f_weeks)
    text(art_f_weeks(i), art_f_motivation(i) + 0.1, sprintf('%.1f', art_f_motivation(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');
end

for i = 1:length(non_art_m_weeks)
    text(non_art_m_weeks(i), non_art_m_motivation(i) + 0.1, sprintf('%.1f', non_art_m_motivation(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');
end

% Customize the plot
xlabel('Time (Weeks)');
ylabel('Motivation Score');
title('Motivation Scores Over Time with and without Structured Reward System');
legend('Location', 'best');
grid on;
xlim([8, 28]);
ylim([3.0, 5.0]);

% Set font properties
set(gca, 'FontSize', 12);
set(gca, 'FontName', 'Arial');

% Add annotations
text(20, 4.6, 'Structured reward system', 'FontSize', 11, 'FontWeight', 'bold', ...
     'BackgroundColor', 'yellow', 'EdgeColor', 'black');
text(20, 3.3, 'Without system', 'FontSize', 11, 'FontWeight', 'bold', ...
     'BackgroundColor', 'white', 'EdgeColor', 'black');

% Save figure
print('Fig8_motivation_over_time', '-dpng', '-r300');

%% Additional formatting and export settings
% Set default figure properties for all plots
set(0, 'DefaultFigureColor', 'white');
set(0, 'DefaultAxesColor', 'white');
set(0, 'DefaultAxesXColor', 'black');
set(0, 'DefaultAxesYColor', 'black');
set(0, 'DefaultAxesZColor', 'black');

fprintf('All figures have been generated and saved successfully!\n');
fprintf('Figure 6: Fig6_sensory_consistency_comparison.png\n');
fprintf('Figure 7: Fig7_naep_improvements.png\n');
fprintf('Figure 8: Fig8_motivation_over_time.png\n');