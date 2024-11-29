#!/usr/bin/env python
# coding: utf-8
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

VERSION = "0.1"
import cgi
import sys
import imp

if sys.version_info < (3, 0):
    sum = imp.load_source("sum","summary.cgi")
else:
    sum = imp.load_source("sum","summary3.cgi")

