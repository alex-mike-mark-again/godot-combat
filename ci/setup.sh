# home it up
cd ~

# all the downloads in the universe
curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
curl -L -o godot.zip https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_linux.x86_64.zip
# curl -L -o templates.zip https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_export_templates.tpz

# set up butler
unzip butler.zip
chmod +x butler

# set up godot
unzip godot.zip
mv Godot_v4.1.1-stable_linux.x86_64 godot

# set up templates
# mkdir -p ~/.local/share/godot/export_templates
# unzip templates.zip
# mv templates ~/.local/share/godot/export_templates/4.1.1.stable