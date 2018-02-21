" ==========================================================================
" File:        darth
" Description: Vim color scheme file
" Maintainer:  null.pointer (based "zazen.vim" by Zoltan Dezso and
" 					"goodwolf.vim" by Steve Losh)
" ==========================================================================
" Preamble {{{
"
" Don't work {{{
"if !has("gui_running") && &t_Co != 88 && &t_Co != 256
"    finish
"endif
" }}}
"
set background=dark

if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "darth"
" }}} end Preable

if !exists( "g:darth_html_link_underline" ) " {{{
    let g:darth_html_link_underline = 1
endif " }}}

" Palette {{{
let s:dh = {}

" The most basic of all our colors is a slightly tweaked version of the
" Molokai
" Normal text
let s:dh.plain          = [ 'f8f6f2',  15 ]
" Pure and simple
let s:dh.coal           = [ '010101',  16 ]
" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:dh.brightgravel   = [ 'd9cec3', 252 ]
let s:dh.lightgravel    = [ '998f84', 245 ]
let s:dh.gravel         = [ '857f78', 243 ]
let s:dh.mediumgravel   = [ '666462', 241 ]
let s:dh.deepgravel     = [ '45413b', 238 ]
let s:dh.deepergravel   = [ '35322d', 236 ]
let s:dh.darkgravel     = [ '242321', 235 ]
let s:dh.blackgravel    = [ '1c1b1a', 233 ]
let s:dh.blackestgravel = [ '141413', 232 ]

let s:dh.taffy          = [ 'ff2c4b',  88 ]
let s:dh.blackhole      = [ '000000',   0 ] 
" }}} end Palette

" Highlighting Function {{{
function! DarthHL( group, fg, ... )
    " Arguments: group, guifg, guibg, gui, guisp
    
    let histring = 'hi ' . a:group . ' '

    if strlen( a:fg )
	if a:fg == 'fg'
	    let histring .= 'guifg=fg ctermfg=fg '
	else
	    let c = get( s:dh, a:fg )
	    let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
	endif
    endif

    if a:0 >= 1 && strlen( a:1 )
	if a:1 == 'bg'
	    let histring .= 'guibg=bg ctermbg=bg '
	else
	    let c = get( s:dh, a:1 )
	    let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
	endif
    endif

    if a:0 >= 2 && strlen( a:2 )
	let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >=3 && strlen( a:3 )
	let c = get( s:dh, a:3 )
	let histring .= 'guisp=#' . c[0] . ' '
    endif

    execute histring
endfunction
" }}} end Function

" Поле нумераций строк
" Configuration Options {{{
if exists( 'g:darth_darkgutter' ) && g:darth_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

if exists( 'g:darth_tabline' )
    if g:darth_tabline == 0
	let s:tabline = 'blackestgravel'
    elseif g:darth_tabline == 1
	let s:tabline = 'blackgravel'
    elseif g:darth_tabline == 2
	let s:tabline = 'darkgravel'
    elseif g:darth_tabline == 3
	let s:tabline = 'deepgravel'
    else
	let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif
" }}}


" Vanilla Vim {{{
" General/UI {{{
"call DarthHL( 'Normal', 'plain', 'blackgravel' )
call DarthHL( 'Normal', 'plain', 'blackestgravel' )
call DarthHL( 'Folded', 'mediumgravel', 'bg', 'none' )
call DarthHL( 'VertSplit', 'mediumgravel', 'bg', 'none' )
call DarthHL( 'CursorLine',   '', 'darkgravel', 'none' )
call DarthHL( 'CursorColumn', '', 'darkgravel' )
call DarthHL( 'ColorColumn',  '', 'darkgravel' )
call DarthHL( 'TabLine',     'plain', s:tabline, 'none' )
call DarthHL( 'TabLineFill', 'plain', s:tabline, 'none' )
call DarthHL( 'TabLineSel',  'coal',   'brightgravel', 'none' )
call DarthHL( 'MatchParen', 'blackhole', 'darkgravel', 'italic' )
call DarthHL( 'NonText',    'deepgravel', 'bg' )
call DarthHL( 'SpecialKey', 'deepgravel', 'bg' )
call DarthHL( 'Visual',    '',  'deepgravel' )
call DarthHL( 'VisualNOS', '',  'deepgravel' )
call DarthHL( 'Search',    'coal', 'gravel', 'bold' )
call DarthHL( 'IncSearch', 'coal', 'brightgravel',    'bold' )
call DarthHL( 'Underlined', 'fg', '', 'underline' )
" Status line split fg (active/deactive)
call DarthHL( 'StatusLine',   'blackhole', 'brightgravel',     'bold' )
call DarthHL( 'StatusLineNC', 'plain', 'darkgravel', 'none' )
call DarthHL( 'Directory', 'brightgravel', '', 'bold' )
call DarthHL( 'Title', 'brightgravel' )
call DarthHL( 'ErrorMsg',   'taffy',       'bg', 'bold' )
call DarthHL( 'MoreMsg',    'gravel',   '',   'bold' )
call DarthHL( 'ModeMsg',    'brightgravel', '',   'bold' )
call DarthHL( 'Question',   'brightgravel', '',   'bold' )
call DarthHL( 'WarningMsg', 'taffy',       '',   'bold' )
" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call DarthHL( 'Tag', '', '', 'bold' )
" }}} end General/UI

" Поле для нумераций строк (gutter)
" Gutter {{{
call DarthHL( 'LineNr',     'mediumgravel', s:gutter )
call DarthHL( 'SignColumn', '',             s:gutter )
call DarthHL( 'FoldColumn', 'mediumgravel', s:gutter )
" }}} end Gutter

" Cursor {{{
call DarthHL( 'Cursor',  'coal', 'brightgravel', 'bold' )
call DarthHL( 'vCursor', 'coal', 'brightgravel', 'bold' )
call DarthHL( 'iCursor', 'coal', 'brightgravel', 'none' )
" }}}

" Syntax highlighting {{{
" Start with a simple base.
call DarthHL( 'Special', 'plain' )
" Comments are slightly brighter than folds, to make 'headers' easier 
" 								to see.
call DarthHL( 'Comment',        'gravel', 'bg', 'none' )
call DarthHL( 'Todo',           'plain',   'bg', 'bold' )
call DarthHL( 'SpecialComment', 'plain',   'bg', 'bold' )
" Strings are highlighted separately.
call DarthHL( 'String', 'lightgravel', '', 'none' )
" Turn off everything else
call DarthHL( 'Statement',    'plain', '', 'bold' )
call DarthHL( 'Keyword',      'plain', '', 'bold' )
call DarthHL( 'Conditional',  'plain', '', 'bold' )
call DarthHL( 'Operator',     'plain', '', 'bold' )
call DarthHL( 'Label',        'plain', '', 'bold' )
call DarthHL( 'Repeat',       'plain', '', 'bold' )

call DarthHL( 'Identifier',   'plain', '', 'none' )
call DarthHL( 'Function',     'plain', '', 'none' )

call DarthHL( 'PreProc',      'plain', '', 'underline' )
call DarthHL( 'Macro',        'plain', '', 'underline' )
call DarthHL( 'Define',       'plain', '', 'underline' )
call DarthHL( 'PreCondit',    'plain', '', 'underline' )

call DarthHL( 'Constant',     'mediumgravel', '', 'bold' )
call DarthHL( 'Number',       'mediumgravel', '', 'bold' )
call DarthHL( 'Float',        'mediumgravel', '', 'bold' )

call DarthHL( 'Character',    'plain', '', 'none' )
call DarthHL( 'Boolean',      'plain', '', 'none' )

call DarthHL( 'Type',         'plain', '', 'bold' )
call DarthHL( 'StorageClass', 'plain', '', 'bold' )
call DarthHL( 'Structure',    'plain', '', 'bold' )
call DarthHL( 'Typedef',      'plain', '', 'bold' )
call DarthHL( 'Exception',    'plain', '', 'bold' )
" Not sure what 'special character in a constant' means, but let's 
" 							make it pop.
call DarthHL( 'SpecialChar', 'plain', '', 'bold' )
" Misc
call DarthHL( 'Error',  'plain',   'taffy', 'bold' )
call DarthHL( 'Debug',  'plain',   '',      'bold' )
call DarthHL( 'Ignore', 'gravel', '',      '' )
" }}} end Syntax highlighting

" Completion Menu {{{
call DarthHL( 'Pmenu', 'plain', 'deepergravel' )
call DarthHL( 'PmenuSel', 'coal', 'brightgravel', 'bold' )
call DarthHL( 'PmenuSbar', '', 'deepergravel' )
call DarthHL( 'PmenuThumb', 'brightgravel' )
" }}} end Completion Menu

" Diffs {{{
call DarthHL( 'DiffDelete', 'coal', 'darkgravel' )
call DarthHL( 'DiffAdd',    '',     'deepergravel' )
call DarthHL( 'DiffChange', '',     'darkgravel' )
call DarthHL( 'DiffText',   'plain', 'deepergravel', 'bold' )
" }}} end Diffs

" Spelling {{{
if has("spell")
    call DarthHL( 'SpellCap', 'gravel', 'bg', 'undercurl,bold', 'gravel' )
    call DarthHL( 'SpellBad', '', 'bg', 'undercurl', 'gravel' )
    call DarthHL( 'SpellLocal', '', '', 'undercurl', 'gravel' )
    call DarthHL( 'SpellRare', '', '', 'undercurl', 'gravel' )
endif
" }}} end Spelling

" Status Line Utils {{{
call DarthHL( 'GWStatusLineMode', 'coal', 'brightgravel' )
call DarthHL( 'GWStatusLineModeX', 'brightgravel', 'deepergravel' )
" }}} end Status Line Utils
" }}} end Vanille Vim
