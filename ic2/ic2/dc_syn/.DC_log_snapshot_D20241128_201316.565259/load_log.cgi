#!/usr/bin/env python
# coding: utf-8
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

VERSION = "0.1"
import cgi
import sys
import imp

if sys.version_info < (3, 0):
    log = imp.load_source("log","log.cgi")
else:
    log = imp.load_source("log","log3.cgi")

