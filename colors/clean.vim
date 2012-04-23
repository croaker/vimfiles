" Vim color file
" Converted from Textmate theme Clean using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "clean"

hi Cursor ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#c6deff gui=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=244 ctermbg=254 cterm=NONE guifg=#808080 guibg=#e6e6e6 gui=NONE
hi VertSplit ctermfg=249 ctermbg=249 cterm=NONE guifg=#b5b5b5 guibg=#b5b5b5 gui=NONE
hi MatchParen ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi StatusLine ctermfg=0 ctermbg=249 cterm=bold guifg=#000000 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE guifg=#000000 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#c6deff gui=NONE
hi IncSearch ctermfg=NONE ctermbg=223 cterm=NONE guifg=NONE guibg=#f5d4b5 gui=NONE
hi Search ctermfg=NONE ctermbg=223 cterm=NONE guifg=NONE guibg=#f5d4b5 gui=NONE
hi Directory ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi Folded ctermfg=248 ctermbg=15 cterm=NONE guifg=#adada5 guibg=#ffffff gui=NONE

hi Normal ctermfg=0 ctermbg=15 cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi Boolean ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi Character ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi Comment ctermfg=248 ctermbg=NONE cterm=NONE guifg=#adada5 guibg=NONE gui=italic
hi Conditional ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi Constant ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi Define ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e07e1f guibg=NONE gui=NONE
hi Function ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi Identifier ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi Keyword ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi Label ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi NonText ctermfg=248 ctermbg=231 cterm=NONE guifg=#adada5 guibg=#f2f2f2 gui=NONE
hi Number ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e07e1f guibg=NONE gui=NONE
hi Operator ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi PreProc ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=248 ctermbg=254 cterm=NONE guifg=#adada5 guibg=#e6e6e6 gui=NONE
hi Statement ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi StorageClass ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi String ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi Tag ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=248 ctermbg=NONE cterm=inverse,bold guifg=#adada5 guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=25 ctermbg=NONE cterm=bold,underline guifg=#21439c guibg=NONE gui=bold,underline
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi rubyFunction ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi rubyConstant ctermfg=97 ctermbg=NONE cterm=bold guifg=#8959a8 guibg=NONE gui=bold
hi rubyStringDelimiter ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=31 ctermbg=NONE cterm=NONE guifg=#0076ad guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=97 ctermbg=NONE cterm=NONE guifg=#8959a8 guibg=NONE gui=NONE
hi rubyInclude ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi rubyGlobalVariable ctermfg=97 ctermbg=NONE cterm=NONE guifg=#8959a8 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi rubyEscape ctermfg=178 ctermbg=NONE cterm=NONE guifg=#eab700 guibg=NONE gui=NONE
hi rubyControl ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi rubyException ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi rubyPseudoVariable ctermfg=97 ctermbg=NONE cterm=NONE guifg=#8959a8 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=97 ctermbg=NONE cterm=bold guifg=#8959a8 guibg=NONE gui=bold
hi rubyRailsARAssociationMethod ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi rubyRailsARMethod ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi rubyRailsRenderMethod ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi rubyRailsMethod ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=248 ctermbg=NONE cterm=NONE guifg=#adada5 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi htmlTag ctermfg=59 ctermbg=NONE cterm=NONE guifg=#68685b guibg=NONE gui=NONE
hi htmlEndTag ctermfg=59 ctermbg=NONE cterm=NONE guifg=#68685b guibg=NONE gui=NONE
hi htmlTagName ctermfg=59 ctermbg=NONE cterm=NONE guifg=#68685b guibg=NONE gui=NONE
hi htmlArg ctermfg=59 ctermbg=NONE cterm=NONE guifg=#68685b guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi javaScriptFunction ctermfg=172 ctermbg=NONE cterm=bold guifg=#e07e1f guibg=NONE gui=bold
hi javaScriptRailsFunction ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi yamlAnchor ctermfg=97 ctermbg=NONE cterm=NONE guifg=#8959a8 guibg=NONE gui=NONE
hi yamlAlias ctermfg=97 ctermbg=NONE cterm=NONE guifg=#8959a8 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=64 ctermbg=NONE cterm=NONE guifg=#4c9100 guibg=NONE gui=NONE
hi cssURL ctermfg=31 ctermbg=NONE cterm=NONE guifg=#0076ad guibg=NONE gui=NONE
hi cssFunctionName ctermfg=25 ctermbg=NONE cterm=bold guifg=#21439c guibg=NONE gui=bold
hi cssColor ctermfg=160 ctermbg=NONE cterm=bold guifg=#c82829 guibg=NONE gui=bold
hi cssPseudoClassId ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssClassName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssValueLength ctermfg=172 ctermbg=NONE cterm=NONE guifg=#e07e1f guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=102 ctermbg=NONE cterm=bold guifg=#91917d guibg=NONE gui=bold
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
