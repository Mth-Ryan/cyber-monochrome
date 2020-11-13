" Vim color scheme
"
" Name:       cmonochrome.vim
" Maintainer: Mateus Ryan <mthryan@protonmail.com>
" License:    MIT
"
"forked from https://github.com/fxn/vim-monochrome

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'cmonochrome'

let s:primary   = ['#83a8a8'  ,  72]
let s:black     = ['#0e1111'  ,  16]
let s:bgray     = ['#181818'  , 233]
let s:lgray     = ['LightGray', 255]
let s:cgray     = ['#737373'  , 243]
let s:dgray     = ['DarkGray' , 248]
let s:secundary = ['#67767e'  , 244]
let s:yellow    = ['#f2d361'  , 221]
let s:red       = ['#882f11'  , 124]
let s:green     = ['#a3ff9b'  , 120]
let s:bg        = ['1e1e1e'   , 236]

let s:default_fg = s:lgray
let s:default_bg = s:bg

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 0
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:default_str)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst && bg != s:default_bg
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
    endif

    exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"

call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:default_lst, s:bgray, s:none)
call s:hi('CursorLineNr', s:primary, s:default_bg, s:bold)
call s:hi('ColorColumn', s:default_fg, s:bgray)
call s:hi('Search', s:primary, s:secundary)
call s:hi('Visual', s:primary, s:secundary)
call s:hi('ErrorMsg', s:primary, s:red)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:secundary, s:default_bg, s:bold)

" File browsers.
call s:hi('Directory', s:primary, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:secundary, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:primary, s:secundary)
call s:hi('PmenuSel', s:secundary, s:primary)

" Notes.
call s:hi('Todo', s:black, s:yellow, s:bold)

" Signs.
call s:hi('SignColumn')

"
" --- Programming languages ----------------------------------------------------
"

call s:hi('Statement', s:primary, s:default_bg, s:bold)
call s:hi('PreProc', s:primary, s:default_bg, s:bold)
call s:hi('String', s:secundary)
call s:hi('Comment', s:cgray, s:default_bg, s:comment_attr)
call s:hi('Constant')
call s:hi('Type', s:primary, s:default_bg, s:bold)
call s:hi('Function', s:primary)
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:black, s:lgray)


"
" --- VimL ---------------------------------------------------------------------
"

call s:hi('vimOption')
call s:hi('vimGroup')
call s:hi('vimHiClear')
call s:hi('vimHiGroup')
call s:hi('vimHiAttrib')
call s:hi('vimHiGui')
call s:hi('vimHiGuiFgBg')
call s:hi('vimHiCTerm')
call s:hi('vimHiCTermFgBg')
call s:hi('vimSynType')
hi link vimCommentTitle Comment


"
" --- Ruby ---------------------------------------------------------------------
"

call s:hi('rubyConstant')
call s:hi('rubySharpBang', s:cgray)
call s:hi('rubyStringDelimiter', s:secundary)
call s:hi('rubyStringEscape', s:secundary)
call s:hi('rubyRegexpEscape', s:secundary)
call s:hi('rubyRegexpAnchor', s:secundary)
call s:hi('rubyRegexpSpecial', s:secundary)


"
" --- Elixir -------------------------------------------------------------------
"

call s:hi('elixirAlias', s:default_fg, s:default_bg, s:none)
call s:hi('elixirDelimiter', s:secundary)
call s:hi('elixirSelf', s:default_fg, s:default_bg, s:none)

" For ||, ->, etc.
call s:hi('elixirOperator')

" Module attributes like @doc or @type.
hi link elixirVariable Statement

" While rendered as comments in other languages, docstrings are strings,
" experimental.
hi link elixirDocString String
hi link elixirDocTest String
hi link elixirStringDelimiter String


"
" --- Perl ---------------------------------------------------------------------
"

call s:hi('perlSharpBang', s:cgray)
call s:hi('perlStringStartEnd', s:secundary)
call s:hi('perlStringEscape', s:secundary)
call s:hi('perlMatchStartEnd', s:secundary)


"
" --- Python -------------------------------------------------------------------
"

call s:hi('pythonEscape', s:secundary)


"
" --- JavaScript ---------------------------------------------------------------
"

call s:hi('javaScriptFunction', s:primary, s:default_bg, s:bold)


"
" --- Diffs --------------------------------------------------------------------
"

call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:primary, s:green)
call s:hi('diffRemoved', s:primary, s:red)


"
" --- Markdown -----------------------------------------------------------------
"

call s:hi('Title', s:primary, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:primary, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:primary, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:secundary, s:default_bg, s:underline)


"
" --- vim-fugitive -------------------------------------------------------------
"

call s:hi('gitcommitComment', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitOnBranch', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitBranch', s:secundary, s:default_bg, s:none)
call s:hi('gitcommitHeader', s:primary, s:default_bg, s:bold)
call s:hi('gitcommitSelected', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscarded', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitSelectedType', s:default_fg, s:default_bg, s:none)
call s:hi('gitcommitDiscardedType', s:default_fg, s:default_bg, s:none)


"
" --- NeoMake ------------------------------------------------------------------
"

call s:hi('NeomakeMessageSign')
call s:hi('NeomakeWarningSign', s:secundary)
call s:hi('NeomakeErrorSign', s:yellow)
call s:hi('NeomakeInfoSign')
call s:hi('NeomakeError', s:yellow)
call s:hi('NeomakeInfo', s:default_fg, s:default_bg, s:bold)
call s:hi('NeomakeMessage')
call s:hi('NeomakeWarning', s:yellow)
