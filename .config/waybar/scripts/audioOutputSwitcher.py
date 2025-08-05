#!/usr/bin/env python 
import subprocess

# function to parse output of command "wpctl status" and return a dictionary of sinks with their id and name.
def parse_wpctl_status():
    # Execute the wpctl status command and store the output in a variable.
    output = str(subprocess.check_output("wpctl status", shell=True, encoding='utf-8'))

    # remove the ascii tree characters and return a list of lines
    lines = output.replace("├", "").replace("─", "").replace("│", "").replace("└", "").splitlines()

    # get the index of the Sinks line as a starting point
    sinks_index = None
    for index, line in enumerate(lines):
        if "Sinks:" in line:
            sinks_index = index
            break

    # start by getting the lines after "Sinks:" and before the next blank line and store them in a list
    sinks = []
    for line in lines[sinks_index +1:]:
        if not line.strip():
            break
        sinks.append(line.strip())

    # remove the "[vol:" from the end of the sink name
    for index, sink in enumerate(sinks):
        sinks[index] = sink.split("[vol:")[0].strip()
    
    # strip the * from the default sink and instead append "- Default" to the end. Looks neater in the wofi list this way.
    for index, sink in enumerate(sinks):
        if sink.startswith("*"):
            sinks[index] = sink.strip().replace("*", "").strip() + " - Default"

    # make the dictionary in this format {'sink_id': <int>, 'sink_name': <str>}
    sinks_dict = [{"sink_id": int(sink.split(".")[0]), "sink_name": sink.split(".")[1].strip()} for sink in sinks]

    return sinks_dict

# get the list of sinks ready to put into wofi - highlight the current default sink
output = ''
sinks = parse_wpctl_status()

position = 0
for i, items in enumerate(sinks):
    if items['sink_name'].endswith(" - Default"):
        output += f"<b>-> {items['sink_name']}</b>\n"
        position = i
    else:
        output += f"{items['sink_name']}\n"

# check if pavucontrol is installed and add a "more..." option to the end of the list
try:
    subprocess.run("pavucontrol --version", shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    output += "<i>More options</i>\n"
except subprocess.CalledProcessError:
    # pavucontrol is not installed, so we don't add the "more..." option
    output += "<i>More options (requires pavucontrol)</i>\n"
    pass


# Call wofi and show the list. take the selected sink name and set it as the default sink
# wofi_command = f"echo '{output.strip()}' | wofi --show=dmenu --hide-scroll --allow-markup --define=hide_search=false --location=top_right --width=600 --height=250 --xoffset=-60 --insensitive --prompt=\"Choose audio output\""
wofi_command = f"echo '{output.strip()}' | rofi -dmenu -i -theme ~/.config/rofi/launchers/type-1/style-8-corner.rasi -window-title \"Audio Output Switcher\" -markup-rows -selected-row {position} -a {position} -p \"Choose audio output\" -l 4"
wofi_process = subprocess.run(wofi_command, shell=True, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

if wofi_process.returncode != 0:
    print("User cancelled the operation.")
    exit(0)

selected_sink_name = wofi_process.stdout.strip()
if selected_sink_name == "<i>More options</i>":
    # open pavucontrol
    subprocess.run("pavucontrol -t 3", shell=True)
    exit(0)
if selected_sink_name == "<i>More options (requires pavucontrol)</i>":
    # send a notification that pavucontrol is not installed
    subprocess.run("notify-send 'Audio Output Switcher' 'Please install pavucontrol to manage audio outputs.'", shell=True)
    exit(0)
sinks = parse_wpctl_status()
selected_sink = next(sink for sink in sinks if sink['sink_name'] == selected_sink_name)
subprocess.run(f"wpctl set-default {selected_sink['sink_id']}", shell=True)


