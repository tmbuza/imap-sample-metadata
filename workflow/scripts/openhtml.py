import subprocess
import platform

# Open HTML files using Bash command
system = platform.system()
commands = {"Darwin": ["open", "images/mymap.html"],
            "Windows": ["start", "images/mymap.html"],
            "Linux": ["xdg-open", "images/mymap.html"]}

if system in commands:
    subprocess.run(commands[system])
else:
    print(f"Unsupported operating system ({system}). Please open the 'html' file manually.")

# # Alternative code
# import subprocess
# import platform

# # Open html files using Bash command
# if platform.system() == "Darwin":  # macOS
#     subprocess.run(["open", "images/mymap.html"])
# elif platform.system() == "Windows":  # Windows
#     subprocess.run(["start", "images/mymap.html"])
# elif platform.system() == "Linux":  # Linux
#     subprocess.run(["xdg-open", "images/mymap.html"])
# else:  # Other systems
#     print("Unsupported operating system. Please open the 'html' file manually.")


