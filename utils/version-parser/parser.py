#!/usr/bin/env python3

import sys
import json

TYPE = 'linux'
# TYPE='windows'
# TYPE='osx'

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('add file')
        exit(-1)
    else:
        version_file = sys.argv[1]

    with open(version_file, 'r') as f:
        a = json.loads(f.read())

    print('Game ID: {0}'.format(a['id']))
    print('Main class: {0}'.format(a['mainClass']))
    print('Assets index: {0}'.format(a['assetIndex']['id']))

    for library in a['libraries']:
        if 'rules' in library:
            if 'os' in library['rules'][0]:
                if TYPE == library['rules'][0]['os']['name']:
                    print(library['downloads']['artifact']['path'])
        else:
            print(library['downloads']['artifact']['path'])
