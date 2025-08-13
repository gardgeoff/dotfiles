highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

let s:Color8 = '#e0e0e0'
let s:Color5 = '#8fa1b3'
let s:Color1 = '#B081B9'
let s:Color10 = '#24292a'
let s:Color0 = '#9876AA'
let s:Color2 = '#9FB3C2'
let s:Color4 = '#d8d29a'
let s:Color7 = '#282e2f'
let s:Color9 = '#1e2324'
let s:Color6 = '#62706a'
let s:Color3 = '#b4b4b4'
let s:Color11 = '#403744'
let s:Color12 = '#434949'
let s:Color13 = '#949695'

call s:highlight('Constant', '', s:Color0, '')
call s:highlight('Number', '', s:Color1, '')
call s:highlight('Keyword', '', s:Color2, '')
call s:highlight('Operator', '', s:Color3, '')
call s:highlight('Conditional', '', s:Color4, '')
call s:highlight('Repeat', '', s:Color4, '')
call s:highlight('Type', '', s:Color2, '')
call s:highlight('Type', '', s:Color5, '')
call s:highlight('StatusLine', s:Color6, s:Color7, '')
call s:highlight('WildMenu', s:Color9, s:Color8, '')
call s:highlight('Pmenu', s:Color9, s:Color8, '')
call s:highlight('PmenuSel', s:Color8, s:Color10, '')
call s:highlight('PmenuThumb', s:Color9, s:Color8, '')
call s:highlight('Normal', s:Color9, s:Color8, '')
call s:highlight('Visual', s:Color11, '', '')
call s:highlight('CursorLine', s:Color11, '', '')
call s:highlight('ColorColumn', s:Color11, '', '')
call s:highlight('SignColumn', s:Color9, '', '')
call s:highlight('LineNr', '', s:Color12, '')
call s:highlight('TabLine', s:Color7, s:Color13, '')
call s:highlight('TabLineSel', '', s:Color10, '')
call s:highlight('TabLineFill', s:Color7, s:Color13, '')
call s:highlight('TSPunctDelimiter', '', s:Color8, '')

highlight! link TSLabel Type
highlight! link TSTag MyTag
highlight! link TSConstant Constant
highlight! link Operator Keyword
highlight! link Conditional Operator
highlight! link TSParameter Constant
highlight! link TSField Constant
highlight! link TSOperator Operator
highlight! link Whitespace Comment
highlight! link TSConditional Conditional
highlight! link TSComment Comment
highlight! link TSProperty TSField
highlight! link TelescopeNormal Normal
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link TSNamespace TSType
highlight! link TSFloat Number
highlight! link TSRepeat Repeat
highlight! link TSTagDelimiter Type
highlight! link Macro Function
highlight! link Folded Comment
highlight! link NonText Comment
highlight! link TSParameterReference TSParameter
highlight! link TSType Type
highlight! link Repeat Conditional
highlight! link TSFuncMacro Macro
highlight! link TSKeyword Keyword
highlight! link TSPunctBracket MyTag
highlight! link TSString String
highlight! link TSPunctSpecial TSPunctDelimiter
highlight! link TSNumber Number
highlight! link CursorLineNr Identifier
highlight! link TSFunction Function
