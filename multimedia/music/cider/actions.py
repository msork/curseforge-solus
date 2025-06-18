#!/usr/bin/python

# Created For Solus Operating System

from pisi.actionsapi import get, pisitools, shelltools

NoStrip = ["/usr"]
IgnoreAutodep = True

Version = get.srcVERSION()

def setup():
    shelltools.system("pwd")
    shelltools.system("ar xf cider-v%s-linux-x64.deb" % Version)
    shelltools.system("tar --zstd -xvf data.tar.zst")

def install():
    pisitools.insinto("/", "usr")
