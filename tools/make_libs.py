#!/usr/bin/env python3

## Requirements PIP: click

"""Parse Minecraft version.json file and return using libs"""

__version__ = "1.0.5"

import sys
import json
import click


@click.command()
@click.option("-p", "--platform", default=sys.platform, help="Output platform (win32, linux, darwin).")
@click.option("-o", "--output", default="tty", help="Output option (tty, txt).")
def make_output(platform, output):
    """Return libraries list"""

    libraries = parse_libs()

    # OS libs separate
    _ = {"win32": ";", "linux": ":", "darwin": ":"}

    out_lib = str()

    # Generate libraries list
    for lib in libraries:
        out_lib = out_lib + "$MC_DIR/libraries/{0}".format(lib) + _[platform]

    out_lib = out_lib + "$MC_DIR/versions/$GAME_VERSION/$GAME_VERSION.jar"

    # Replace for OS shell variable symbol
    if platform == "win32":
        out_lib = out_lib.replace("$MC_DIR", "%MC_DIR%")
        out_lib = out_lib.replace("$GAME_VERSION", "%GAME_VERSION%")

    if output == "tty":
        click.echo(out_lib)

        if platform == "win32":
            print("\nWindows generate libraries list complete!")
        elif platform in ("linux", "darwin"):
            print("\nUnix generate libraries list complete!")
    elif output == "txt":
        with open("./libs.txt", "w", encoding="utf-8") as f:
            f.write(out_lib)

        if platform == "win32":
            print("\nWindows generate libraries list complete!\n" "See libs.txt file.")
        elif platform in ("linux", "darwin"):
            print("\nUnix generate libraries list complete!\n" "See libs.txt file.")


def parse_libs():
    """Make libraries list from version.json file"""

    _ = []

    try:
        with open("./version.json", "r", encoding="utf-8") as f:
            file_data = json.loads(f.read())

            for lib in file_data["libraries"]:
                _.append(lib["downloads"]["artifact"]["path"])
    except FileNotFoundError:
        print("ERROR: File version.json not found.")
        sys.exit(-1)

    return _


if __name__ == "__main__":
    # pylint: disable=no-value-for-parameter
    make_output()
