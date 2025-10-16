import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Data from Table 5: User Satisfaction and Adaptability
data = {
    "User Profile": [
        "East Asian Adolescent Female", "Diverse Adolescent Male", "Western Adult Female", 
        "General Adult Male", "African Youth Female", "African Youth Male", 
        "Diverse Middle-Aged Female"
    ],
    "Satisfaction (1-5)": [4.4, 4.3, 4.1, 4.0, 4.3, 4.2, 4.3],
    "Adaptability (%)": [90, 88, 86, 85, 89, 88, 89]
}
df = pd.DataFrame(data)

# --- Create Figure ---
fig, ax1 = plt.subplots(figsize=(14, 8))
fig.suptitle('Personalized Content Satisfaction and Adaptability of CAMS Across User Groups', fontsize=20, y=0.98)

# Define colors from a soft, professional palette
color_satis = '#89a5c3'
color_adapt = '#526d82'

# Set X-axis positions and bar width
x = np.arange(len(df["User Profile"]))
width = 0.4

# Plot Satisfaction bars on the primary y-axis
rects1 = ax1.bar(x - width/2, df["Satisfaction (1-5)"], width, label='Satisfaction (1-5)', color=color_satis, zorder=3)

# Create a secondary y-axis for Adaptability
ax2 = ax1.twinx()
rects2 = ax2.bar(x + width/2, df["Adaptability (%)"], width, label='Adaptability (%)', color=color_adapt, zorder=3)

# Add labels, title, and ticks
ax1.set_xlabel('User Profile', fontsize=14, labelpad=15)
ax1.set_ylabel('Satisfaction Score (1-5)', color=color_satis, fontsize=14)
ax2.set_ylabel('Adaptability Score (%)', color=color_adapt, fontsize=14)
ax1.set_xticks(x)
ax1.set_xticklabels(df["User Profile"], rotation=45, ha="right", fontsize=12)

# Set Y-axis limits
ax1.set_ylim(0, 5)
ax2.set_ylim(0, 100)

# Style the tick labels
ax1.tick_params(axis='y', labelcolor=color_satis, labelsize=12)
ax2.tick_params(axis='y', labelcolor=color_adapt, labelsize=12)

# Create a unified legend
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc='upper right')

# Function to add data labels on top of bars
def autolabel(rects, ax, is_percent=False):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        label = f'{height}%' if is_percent else f'{height:.1f}'
        ax.annotate(label,
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom', fontsize=11)

autolabel(rects1, ax1)
autolabel(rects2, ax2, is_percent=True)

# Add a light grid for better readability
ax1.grid(axis='y', linestyle='--', alpha=0.7, zorder=0)

# Adjust layout to prevent labels from overlapping
fig.tight_layout(rect=[0, 0, 1, 0.95])
plt.show()
