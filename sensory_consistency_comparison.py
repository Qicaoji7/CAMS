import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import numpy as np

# Use a professional, soft color palette
blue_gray_palette = ["#89a5c3", "#adb9c9", "#ced6e0", "#526d82"]
sns.set_palette(blue_gray_palette)
sns.set_style("whitegrid")

# Data from Table 1: Technical Metrics
data_tech = {
    'Content Type': ['Calming/Focus', 'Calming/Focus', 'Engagement-Oriented', 'Engagement-Oriented'],
    'Model': ['CAMS', 'Baseline', 'CAMS', 'Baseline'],
    'MSE': [0.08, 0.17, 0.10, 0.19],
    'SCC': [0.86, 0.65, 0.82, 0.61]
}
df_tech = pd.DataFrame(data_tech)

# Data from Table 2: Performance Metrics
data_perf = {
    'Content Type': ['Calming/Focus', 'Calming/Focus', 'Engagement-Oriented', 'Engagement-Oriented'],
    'Model': ['CAMS', 'Baseline', 'CAMS', 'Baseline'],
    'Generation Time (s)': [2.6, 3.0, 2.8, 3.2],
    'User Preference (%)': [88, 12, 91, 9]
}
df_perf = pd.DataFrame(data_perf)


# --- Create Figure ---
fig, axes = plt.subplots(2, 2, figsize=(16, 14))
fig.suptitle('Performance Comparison of CAMS Framework vs. Baseline Model', fontsize=20, y=1.02)


# 1. Mean Squared Error (MSE) Comparison
sns.barplot(ax=axes[0, 0], x='Content Type', y='MSE', hue='Model', data=df_tech, zorder=3)
axes[0, 0].set_title('Mean Squared Error (MSE) Comparison (Lower is Better)', fontsize=14)
axes[0, 0].set_ylabel('MSE', fontsize=12)
axes[0, 0].set_xlabel('')
axes[0, 0].grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
for p in axes[0, 0].patches:
    axes[0, 0].annotate(f'{p.get_height():.2f}',
                       (p.get_x() + p.get_width() / 2., p.get_height()),
                       ha = 'center', va = 'center',
                       xytext = (0, 9),
                       textcoords = 'offset points',
                       fontsize=10)


# 2. Supportive Characteristic Correlation (SCC) Comparison
sns.barplot(ax=axes[0, 1], x='Content Type', y='SCC', hue='Model', data=df_tech, zorder=3)
axes[0, 1].set_title('Supportive Characteristic Correlation (SCC) Comparison (Higher is Better)', fontsize=14)
axes[0, 1].set_ylabel('SCC', fontsize=12)
axes[0, 1].set_xlabel('')
axes[0, 1].grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
for p in axes[0, 1].patches:
    axes[0, 1].annotate(f'{p.get_height():.2f}',
                       (p.get_x() + p.get_width() / 2., p.get_height()),
                       ha = 'center', va = 'center',
                       xytext = (0, 9),
                       textcoords = 'offset points',
                       fontsize=10)


# 3. Generation Time Comparison
sns.barplot(ax=axes[1, 0], x='Content Type', y='Generation Time (s)', hue='Model', data=df_perf, zorder=3)
axes[1, 0].set_title('Content Generation Time Comparison (Lower is Better)', fontsize=14)
axes[1, 0].set_ylabel('Time (s)', fontsize=12)
axes[1, 0].set_xlabel('Content Type', fontsize=12)
axes[1, 0].grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
for p in axes[1, 0].patches:
    axes[1, 0].annotate(f'{p.get_height():.1f}s',
                       (p.get_x() + p.get_width() / 2., p.get_height()),
                       ha = 'center', va = 'center',
                       xytext = (0, 9),
                       textcoords = 'offset points',
                       fontsize=10)


# 4. User Preference Comparison
sns.barplot(ax=axes[1, 1], x='Content Type', y='User Preference (%)', hue='Model', data=df_perf, zorder=3)
axes[1, 1].set_title('User Preference Comparison (Higher is Better)', fontsize=14)
axes[1, 1].set_ylabel('Preference (%)', fontsize=12)
axes[1, 1].set_xlabel('Content Type', fontsize=12)
axes[1, 1].grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
for p in axes[1, 1].patches:
    axes[1, 1].annotate(f'{p.get_height()}%',
                       (p.get_x() + p.get_width() / 2., p.get_height()),
                       ha = 'center', va = 'center',
                       xytext = (0, 9),
                       textcoords = 'offset points',
                       fontsize=10)

# Adjust layout and display the figure
plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.show()
