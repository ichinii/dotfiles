#!/usr/bin/python

import sys
import os
import pathlib

files = [
    '.bashrc',
    '.vimrc',
    '.Xresources',
    '.config/i3/config',
    '.config/i3status/config',
    '.vim/ycm_extra_conf.py',
    '.try/cpp',
    '.try/cpp_src',
    '.bin/try',
    '.bin/brightness'
]

dry = False

for i in range(1, len(sys.argv)):
    arg = sys.argv[i]
    if arg == '--dry':
        dry = True
    else:
        print('unknown argument \'' + arg + '\'')
        exit(1)

def source(f):
    return os.path.join( os.path.dirname( os.path.realpath(__file__) ), f )

def home(f):
    return os.path.join(home_dir, f)

def backup(f):
    return os.path.join(backup_dir, f)

home_dir = os.path.expanduser('~')
backup_dir = source('backup')
print('using home directory \'' + home_dir + '\'')
print('using backup directory: \'' + backup_dir + '\'')

def install():
    # backup existing files
    for f in files:
        src = source(f)
        dst = home(f)
        bak = backup(f)

        if os.path.exists(dst):
            if os.path.islink(dst):
                print('removing existing link \'' + dst + '\'')
                if not dry:
                    os.remove(dst)
            else:
                print('backing up \'' + dst + '\' -> \'' + bak + '\'')
                pathlib.Path(os.path.dirname(bak)).mkdir(parents=True, exist_ok=True)
                if not dry:
                    os.rename(dst, bak)

        # create directory if doesnt exist
        dst_dir = os.path.dirname(dst)
        if not os.path.exists(dst_dir):
            print('creating directory \'' + dst_dir + '\'')
            if not dry:
                os.makedirs(dst_dir)

    # create symbolic links
    for f in files:
        src = source(f)
        dst = home(f)

        print('creating symbolic link \'' + src + '\' -> \'' + dst + '\'')
        if not dry:
            os.symlink(src, dst)

def uninstall():
    pass

install()
