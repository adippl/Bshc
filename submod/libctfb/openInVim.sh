#!/bin/bash
vim -s <(echo '
:function SynC()
	:syn keyword cOperator keyword this
	:syn keyword cType keyword T
	:syn keyword cType keyword obj_ctfb
	:syn keyword cType keyword fwchar
	:syn keyword cType keyword ctvc2
	:endfunction

:function OpenCTab(name)
	:execute "tabe ".fnameescape(a:name).".h"
	:call SynC()
	:set nornu
	:set foldlevel=20

	:execute "vs ".fnameescape(a:name).".c"
	:call SynC()
	:set rnu
	:set foldlevel=0
	:endfunction

:e test/test.c
	:call SynC()
:tabe ctfb.h
	:call SynC()
:tabe mkfile
:tabe README

:tabe cstl/tmpl/tmpl.h
	:call SynC()
:tabe cstl/tmpl/obj.h
	:call SynC()

:set foldmethod=indent
:call OpenCTab("templateTU")
:call OpenCTab("cstl/tmpl/arr")
:call OpenCTab("conf")
:call OpenCTab("term")
:call OpenCTab("draw")
:call OpenCTab("ui")
:call OpenCTab("input")



	'|sed 's/\t//')
# sed in the last line removes tabs which caused problems to vim. 
# tabs make this mess more visible
