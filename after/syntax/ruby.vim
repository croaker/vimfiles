let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @SQL syntax/sql.vim

unlet b:current_syntax
syntax include @SHELL syntax/sh.vim

unlet b:current_syntax
syntax include @GRAPHQL syntax/graphql.vim

let b:current_syntax = s:bcs

syntax region hereDocText    matchgroup=Statement start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE

syntax region hereDocDashSQL matchgroup=Statement start=+<<[-~.]*\z(SQL\)+  end=+^\s*\z1+ contains=@SQL

syntax region hereDocDashShell matchgroup=Statement start=+<<[-~.]*\z(SHELL\)+  end=+^\s*\z1+ contains=@SHELL

syntax region hereDocDashGql matchgroup=Statement start=+<<[-~.]*\z(GQL\)+  end=+^\s*\z1+ contains=@GRAPHQL
