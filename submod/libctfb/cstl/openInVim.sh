#!/bin/bash
vim -s <(echo "
:function SynC()
	:syn keyword cOperator keyword this
	:syn keyword cType keyword T
	:endfunction

:e test.c
	:call SynC()
:tabe mkfile
:tabe README
:tabe test_templateTU.h
	:call SynC()
:vs test_templateTU.c

:tabe tmpl/tmpl.h
	:call SynC()
:tabe tmpl/obj.h
	:call SynC()

:tabe tmpl/harr.h
	:call SynC()
:vs tmpl/harr.c
	:call SynC()
	:set rnu

:tabe tmpl/arr.h
	:call SynC()
:vs tmpl/arr.c
	:call SynC()
	:set rnu
	"|sed 's/\t//')
# sed in the last line removes tabs which caused problems to vim. 
# tabs make this mess more visible
