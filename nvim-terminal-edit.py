#!/usr/bin/env python
"""Edit a file in the host nvim instance."""
from __future__ import print_function
import os
import sys

from neovim import attach

args = sys.argv[1:]
if not args:
    args = ["."]

addr = os.environ.get("NVIM_LISTEN_ADDRESS", None)
if not addr:
    os.execvp('nvim', args)

nvim = attach("socket", path=addr)


def _setup():
    nvim.input('<c-\\><c-n>')  # exit terminal mode
    chid = nvim.channel_id
    nvim.command('augroup EDIT')
    nvim.command('au BufEnter <buffer> call rpcnotify({0}, "n")'.format(chid))
    nvim.command('au BufEnter <buffer> startinsert'.format(chid))
    nvim.command('augroup END')
    cwd = os.getcwd()
    abs_args = [os.path.join(cwd, x) for x in args]
    nvim.vars['files_to_edit'] =  abs_args

    for x in abs_args:
        nvim.command('exe "drop ".remove(g:files_to_edit, 0)')


def _exit(*args):
    nvim.vars['files_to_edit'] = None
    nvim.command('augroup EDIT')
    nvim.command('au!')
    nvim.command('augroup END')
    nvim.stop_loop()


nvim.run_loop(_exit, _exit, _setup)