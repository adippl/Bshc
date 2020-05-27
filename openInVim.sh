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


:e mkfile
:tabe README

:tabe submod/cstl/tmpl/tmpl.h
	:call SynC()
:tabe submod/cstl/tmpl/obj.h
	:call SynC()

:call OpenCTab("submod/cstl/tmpl/arr")
:set foldmethod=indent


:call OpenCTab("tests/tests")
:call OpenCTab("main")
:call OpenCTab("conf")
:call OpenCTab("state")
:call OpenCTab("ship")
:call OpenCTab("ship_templTU")
:call OpenCTab("module")
:call OpenCTab("module_templTU")
:call OpenCTab("ui_term")



	'|sed 's/\t//')
# sed in the last line removes tabs which caused problems to vim. 
# tabs make this mess more visible
