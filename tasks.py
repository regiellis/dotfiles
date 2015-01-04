#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""
.dotfiles.task

:author: Regi Ellis <regi@persona.io>
:desc: Setup task for my .dotfiles
:created: Jan 04, 2015
:req: invoke
"""

from invoke import task, run, Collection

BREW_APPS = []
CASK_APPS = []
PIP_APPS = []
