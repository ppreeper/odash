" ----------
" Status-Line
" ----------
let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·Line ',
    \ ''   : 'V·Block ',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ }
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#StatusLine#
set statusline+=\ %F
set statusline+=\ %r
set statusline+=\%m
set statusline+=%= "Right side settings
set statusline+=%#FoldColumn#
set statusline+=\ %y
set statusline+=\ %#StatusLine#
set statusline+=\ %p%%
set statusline+=\ %l/%L
set statusline+=\ cl:%c
