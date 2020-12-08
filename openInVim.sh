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

:tabe submod/pdjson/pdjson.h

:call OpenCTab("submod/cstl/tmpl/arr")

:tabe res/conf.json
:set foldmethod=indent

:call OpenCTab("tests/tests")
:call OpenCTab("main")
:call OpenCTab("conf")
:call OpenCTab("parse")
:call OpenCTab("state")
:call OpenCTab("ship")
:call OpenCTab("ship_TTU")
:call OpenCTab("smodule")
:call OpenCTab("smodule_TTU")
:call OpenCTab("cmenu")
:call OpenCTab("dialogTree")
:call OpenCTab("ui_term")
:call OpenCTab("encounter")
:call OpenCTab("map")
:call OpenCTab("mapCpoint")
:call OpenCTab("mapCpointTTU")
:call OpenCTab("player")
:call OpenCTab("playerTTU")
:call OpenCTab("vec2")
:call OpenCTab("genTypes")
:call OpenCTab("genTypesTTU")
:call OpenCTab("cvlarr")
:call OpenCTab("resources")


	'|sed 's/\t//')
# sed in the last line removes tabs which caused problems to vim. 
# tabs make this mess more visible
