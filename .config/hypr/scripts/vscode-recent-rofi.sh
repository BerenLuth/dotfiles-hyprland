recent=$(jq -r '.profileAssociations.workspaces' ~/.config/Code/User/globalStorage/storage.json | tr ' ' '\n')
recent=$(echo "$recent" | grep -o '"file://.*"' | sed 's|^"file://||; s|"$||')
recent=$(echo "$recent" | tac)

selected=$(echo "$recent" | rofi -theme ~/.config/rofi/launchers/type-1/style-8-vscode -lines 7 -dmenu -i -p 'a' \
		-columns 1)

if [ -z "$selected" ]; then
  exit 1
fi
code "$selected"