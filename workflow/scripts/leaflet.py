import pandas as pd
import folium # Creates Web Maps from your data
import subprocess
import platform

# Read the DataFrame from your file (replace 'your_file.csv' with your actual file path)
df = pd.read_csv('data/metadata.csv')

# Create a base map
sample_gps = folium.Map(location=[df['latitude'].mean(), df['longitude'].mean()], zoom_start=3, tiles="cartodb positron")

# Add markers for each row in the DataFrame
for _, row in df.iterrows():
    folium.Marker(
        location=[row['latitude'], 
                  row['longitude']],
                  popup=f"Run: {row['run']}\nBioproject: {row['bioproject']}\nType: {row['type']}\nOrganism: {row['organism']}\nBases: {row['bases']}",
                  fill_color="RdYlGn_r",
                  fill_opacity=0.8,
                  line_opacity=0.3,
                  nan_fill_color="white",
                  legend_name="SRA Sample Metadata Analysis",
                  name="SRA sample locations",
                  ).add_to(sample_gps)

# Save the map
sample_gps.save("map/sample_gps.html")


# import subprocess
# import platform

# # Open HTML files using Bash command
# system = platform.system()
# commands = {"Darwin": ["open", "map/mymap.html"],
#             "Windows": ["start", "map/mymap.html"],
#             "Linux": ["xdg-open", "map/mymap.html"]}

# if system in commands:
#     subprocess.run(commands[system])
# else:
#     print(f"Unsupported operating system ({system}). Please open the 'html' file manually.")