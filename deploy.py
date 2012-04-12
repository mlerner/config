#!/usr/bin/env python

import os
import time
import shutil

def is_config(f):
    not_config = ("README", "deploy.py")
    if f.startswith(".") or f in not_config:
        return False
    return True

if __name__ == "__main__":
    files = filter(is_config, os.listdir("."))
    backup = "/tmp/backup-%d" % time.time()
    os.mkdir(backup)
    backed_up = set()

    for f in files:
        src = os.path.join(os.getcwd(), f)
        dest = os.path.join(os.getenv("HOME"), "."+f)
        if os.path.islink(dest):
            os.remove(dest) 
        elif os.path.exists(dest):
            shutil.move(dest, backup)
            backed_up.add(dest)
        os.symlink(src, dest)

    if len(backed_up) > 0:
        print("The following files have been backed up to " + backup + ": ")
        print(" ".join(map(os.path.basename, backed_up)))

    #os.execlp("git", ("submodule --init update")) # don't want it to replace process though
