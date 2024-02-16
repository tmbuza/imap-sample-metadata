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

