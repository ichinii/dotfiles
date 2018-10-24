#!/usr/bin/python

import os
import pathlib

files = [
    '.bashrc',
    '.vimrc',
    '.Xresources',
    '.config/i3/config',
    '.config/i3status/config',
    '.vim/ycm_extra_conf.py'
]

def source(f):
    return os.path.join( os.path.dirname( os.path.realpath(__file__) ), f )

home_dir = os.path.expanduser('~')
backup_dir = source('backup')
print('using home directory \'' + home_dir + '\'')
print('using backup directory: \'' + backup_dir + '\'')

def home(f):
    return os.path.join(home_dir, f)

def backup(f):
    return os.path.join(backup_dir, f)

def install():
    # backup existing files
    for f in files:
        src = source(f)
        dst = home(f)
        bak = backup(f)

        if os.path.exists(dst):
            if os.path.islink(dst):
                print ('removing existing link \'' + dst + '\'')
                os.remove(dst)
            else:
                print ('backing up \'' + dst + '\' -> \'' + bak + '\'')
                pathlib.Path(os.path.dirname(bak)).mkdir(parents=True, exist_ok=True)
                os.rename(dst, bak)

    # create symbolic links
    for f in files:
        src = source(f)
        dst = home(f)

        print ('creating symbolic link \'' + src + '\' -> \'' + dst + '\'')
        os.symlink(src, dst)

def uninstall():
    pass

install()
