#!/usr/bin/env python3

"""
    Script for generate Minecraft *.jar libraries
    from version.json file.

    usage^
        $ ./make_libs.py > libs.txt

    for windows need replace `$MC_DIR` to `%MC_DIR%`
    and `:` to `;`
"""

import json

__author__ = 'Alexander Popov'
__version__ = '0.1.0'
__license__ = 'Unlicense'


def parse_libs():
    """ Make libraries list from version.json file """

    _ = []

    with open('./version.json', 'r', encoding='utf-8') as f:
        file_data = json.loads(f.read())

        for lib in file_data['libraries']:
            _.append(lib['downloads']['artifact']['path'])

    return(_)


if __name__ == '__main__':
    libraries = parse_libs()

    for lib in libraries:
        print('$MC_DIR/libraries/{0}'.format(lib), end=':')

    print('$MC_DIR/versions/$GAME_VERSION/$GAME_VERSION.jar')
