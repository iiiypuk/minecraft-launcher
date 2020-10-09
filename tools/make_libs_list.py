#!/usr/bin/env python3

import json
import click

__author__ = "Alexander Popov"
__version__ = "1.0.1"
__license__ = "Unlicense"


@click.command()
@click.option("--platform", default="win", help="Output platform (win, unix).")
def make_output(platform):
    """ Return libraries list """

    libraries = parse_libs()

    _ = {"win": ";", "unix": ":"}

    output = str()

    for lib in libraries:
        output = output + "$MC_DIR/libraries/{0}".format(lib) + _[platform]

    output = output + "$MC_DIR/versions/$GAME_VERSION/$GAME_VERSION.jar"

    if platform == "win":
        output = output.replace("$MC_DIR", "%MC_DIR%")
        output = output.replace("$GAME_VERSION", "%GAME_VERSION%")

    click.echo(output)

    if platform == "win":
        print("\nWindows generate libraries list complete!")
    elif platform == "unix":
        print("\nLinux generate libraries list complete!")


def parse_libs():
    """ Make libraries list from version.json file """

    _ = []

    with open("./version.json", "r", encoding="utf-8") as f:
        file_data = json.loads(f.read())

        for lib in file_data["libraries"]:
            _.append(lib["downloads"]["artifact"]["path"])

    return _


if __name__ == "__main__":
    make_output()
