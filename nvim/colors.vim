" frankenstein.vim — dark gothic anime colorscheme for Neovim
" by arthurr-jpg

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "frankenstein"

" ── Palette ──────────────────────────────────────────────
let s:bg        = "#1e2424"
let s:bg2       = "#1a3020"
let s:border    = "#2a4a38"
let s:fg        = "#e8e0c8"
let s:fg_dim    = "#2bc08a"
let s:green     = "#3dd9a0"
let s:blue_kw  = "#60c8f0"   " keywords / statements
let s:yellow    = "#c87820"
let s:red       = "#c0392b"
let s:cyan      = "#5fffd4"
let s:orange    = "#e67e22"

" ── Editor UI ────────────────────────────────────────────
exe "hi Normal          guifg=".s:fg."       guibg=".s:bg
exe "hi NormalNC        guifg=".s:fg_dim."   guibg=".s:bg2
exe "hi LineNr          guifg=".s:border."   guibg=NONE"
exe "hi CursorLine      guifg=NONE           guibg=".s:bg2
exe "hi CursorLineNr    guifg=".s:green."    guibg=NONE      gui=bold"
exe "hi SignColumn      guifg=NONE           guibg=".s:bg
exe "hi ColorColumn     guifg=NONE           guibg=".s:bg2
exe "hi VertSplit       guifg=".s:border."   guibg=NONE"
exe "hi WinSeparator    guifg=".s:border."   guibg=NONE"
exe "hi Folded          guifg=".s:fg_dim."   guibg=".s:bg2
exe "hi StatusLine      guifg=".s:fg."       guibg=".s:bg2
exe "hi StatusLineNC    guifg=".s:fg_dim."   guibg=".s:bg
exe "hi TabLine         guifg=".s:fg_dim."   guibg=".s:bg2
exe "hi TabLineSel      guifg=".s:green."    guibg=".s:bg
exe "hi TabLineFill     guifg=NONE           guibg=".s:bg

" ── Search / Selection ───────────────────────────────────
exe "hi Search          guifg=".s:bg."       guibg=".s:green
exe "hi IncSearch       guifg=".s:bg."       guibg=".s:yellow
exe "hi Visual          guifg=NONE           guibg=#1a3020"
exe "hi VisualNOS       guifg=NONE           guibg=#1a3020"

" ── Popup / Float ────────────────────────────────────────
exe "hi Pmenu           guifg=".s:fg."       guibg=".s:bg2
exe "hi PmenuSel        guifg=".s:green."    guibg=#1a3020    gui=bold"
exe "hi PmenuSbar       guifg=NONE           guibg=".s:border
exe "hi PmenuThumb      guifg=NONE           guibg=".s:green
exe "hi FloatBorder     guifg=".s:green."    guibg=".s:bg
exe "hi NormalFloat     guifg=".s:fg."       guibg=".s:bg2

" ── Diagnostics ──────────────────────────────────────────
exe "hi DiagnosticError guifg=".s:red."      guibg=NONE"
exe "hi DiagnosticWarn  guifg=".s:yellow."   guibg=NONE"
exe "hi DiagnosticInfo  guifg=".s:cyan."     guibg=NONE"
exe "hi DiagnosticHint  guifg=".s:fg_dim."   guibg=NONE"

" ── Syntax ───────────────────────────────────────────────
exe "hi Comment         guifg=".s:border."   gui=italic"
exe "hi Constant        guifg=".s:blue_kw
exe "hi String          guifg=".s:cyan
exe "hi Character       guifg=".s:cyan
exe "hi Number          guifg=".s:yellow
exe "hi Boolean         guifg=".s:yellow
exe "hi Float           guifg=".s:yellow
exe "hi Identifier      guifg=".s:fg
exe "hi Function        guifg=".s:green."    gui=bold"
exe "hi Statement       guifg=".s:blue_kw
exe "hi Keyword         guifg=".s:blue_kw."   gui=bold"
exe "hi Conditional     guifg=".s:blue_kw
exe "hi Repeat          guifg=".s:blue_kw
exe "hi Operator        guifg=".s:green
exe "hi PreProc         guifg=".s:yellow
exe "hi Include         guifg=".s:yellow
exe "hi Type            guifg=".s:orange
exe "hi StorageClass    guifg=".s:orange
exe "hi Special         guifg=".s:green
exe "hi SpecialKey      guifg=".s:fg_dim
exe "hi Error           guifg=".s:red."      gui=bold"
exe "hi Todo            guifg=".s:yellow."   guibg=NONE  gui=bold"
exe "hi Underlined      guifg=".s:cyan."     gui=underline"
exe "hi MatchParen      guifg=".s:green."    guibg=#1a3020  gui=bold"

" ── TreeSitter (Neovim >= 0.8) ───────────────────────────
exe "hi @comment            guifg=".s:border."   gui=italic"
exe "hi @keyword            guifg=".s:blue_kw
exe "hi @keyword.function   guifg=".s:blue_kw
exe "hi @keyword.return     guifg=".s:blue_kw
exe "hi @function           guifg=".s:green."    gui=bold"
exe "hi @function.builtin   guifg=".s:green
exe "hi @function.call      guifg=".s:green
exe "hi @method             guifg=".s:green."    gui=bold"
exe "hi @string             guifg=".s:cyan
exe "hi @number             guifg=".s:yellow
exe "hi @float              guifg=".s:yellow
exe "hi @boolean            guifg=".s:yellow
exe "hi @type               guifg=".s:orange
exe "hi @type.builtin       guifg=".s:orange
exe "hi @variable           guifg=".s:fg
exe "hi @variable.builtin   guifg=".s:blue_kw
exe "hi @parameter          guifg=".s:fg
exe "hi @property           guifg=".s:cyan
exe "hi @operator           guifg=".s:green
exe "hi @punctuation        guifg=".s:fg_dim
exe "hi @tag                guifg=".s:green
exe "hi @tag.attribute      guifg=".s:cyan
exe "hi @constant           guifg=".s:blue_kw
exe "hi @constant.builtin   guifg=".s:yellow
exe "hi @namespace          guifg=".s:orange
exe "hi @markup.heading         guifg=".s:green."    gui=bold"
exe "hi @markup.strong        guifg=".s:fg."       gui=bold"
exe "hi @markup.italic      guifg=".s:fg."       gui=italic"
exe "hi @markup.link.url           guifg=".s:cyan."     gui=underline"

" ── Markup aliases (retrocompat < TreeSitter 0.9) ────────
exe "hi! link @text.title     @markup.heading"
exe "hi! link @text.strong    @markup.strong"
exe "hi! link @text.emphasis  @markup.italic"
exe "hi! link @text.uri       @markup.link.url"
