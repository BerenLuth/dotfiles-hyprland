#!/usr/bin/env python3

import argparse
import os

ALLOWED_THEMES = [
    "arcdark", "atomdark", "catppuccin", "cyberpunk", "dracula", "everforest",
    "github-light", "gruvbox", "material", "monokai", "night-owl", "nord",
    "oceanic-next", "onedark", "rose-pine", "shades-of-purple", "solarized",
    "srcery", "sunset-aurant", "sunset-saffron", "sunset-tangerine",
    "synthwave-84", "tokyo-dark", "tokyo-moon", "tokyo-storm"
]


def main():
    parser = argparse.ArgumentParser(description='Set background script')
    parser.add_argument('input', type=str, help='input image file')
    parser.add_argument('-t', '--theme', type=str,
                        help='theme name\nvalid themes are: ' + ", ".join(ALLOWED_THEMES))
    parser.add_argument('-o', '--output', type=str,
                        help='path to save the final image')
    parser.add_argument('-p', '--pixelate', type=int,
                        help='pixelate the background [1-25]')
    parser.add_argument('-n', '--negative',
                        action='store_true', help='apply negative effect')
    parser.add_argument('-s', '--set', action='store_true',
                        help='set the final image as background')

    args = parser.parse_args()

    if args.theme:
        print(f"Theme: {args.theme}")
        if args.theme not in ALLOWED_THEMES:
            print(f"Error: '{args.theme}' is not an allowed theme.")
            print("\nPlease choose one of the following themes:\n",
                  ", ".join(ALLOWED_THEMES))
            return
    if args.pixelate:
        if args.pixelate < 1 or args.pixelate > 25 or int(args.pixelate) != args.pixelate:
            print("Error: Pixelate value must be an int between 1 and 25.")
            return
        args.pixelate = int(args.pixelate)
        print(f"Pixelate: {args.pixelate}")

    if not os.path.isfile(args.input):
        print(f"Error: The file '{args.input}' does not exist.")
        return

    output_path = os.path.expanduser('~/Pictures/gowall')
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    result = os.popen(f'gowall convert "{args.input}" -f png').read()
    output_path = result.split("saved as ")[1].split("\n")[0].strip()

    if not os.path.isfile(output_path):
        print(f"Error: The output file '{output_path}' does not exist.")
        return

    if args.negative:
        cmd = f'gowall invert "{output_path}"'
        print("Negative:", cmd)
        os.system(cmd)

    if args.pixelate:
        cmd = f'gowall pixelate "{output_path}" -s {args.pixelate}'
        print("Pixelating:", cmd)
        os.system(cmd)

    if args.theme:
        cmd = f'gowall convert "{output_path}" -t {args.theme}'
        print("Theming:", cmd)
        os.system(cmd)

    if args.output:
        dir = os.path.dirname(os.path.expanduser(args.output))
        cmd = f'cp {output_path} {args.output}'
        print("Saving a copy to:", args.output)
        if not os.path.isdir(dir):
            os.makedirs(dir, exist_ok=True)
        os.system(cmd)

    if args.set:
        cmd = f'set-background {output_path}'
        print("Setting background:", cmd)
        os.system(cmd)
    else:
        print("You can set the image as background by adding the -s flag")


if __name__ == "__main__":
    main()
