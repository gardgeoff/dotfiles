" Blade indentation: Vim's regex HTML indent plus a level for Blade block directives.
" Treesitter indent loses track inside @if/@foreach while a tag is still unclosed, so it's not used here.
if exists('b:did_indent')
  finish
endif

runtime! indent/html.vim

setlocal indentexpr=BladeIndent()
setlocal indentkeys+==@end,=@else,=@show,=@stop

let s:open = '^\s*@\%(if\|unless\|isset\|auth\|guest\|can\|cannot\|canany\|env\|production\|error\|session'
      \ . '\|foreach\|forelse\|for\|while\|switch\|push\|pushOnce\|prepend\|once\|fragment\|component\|slot\|verbatim'
      \ . '\|empty\s*(\|php\s*$\|section\s*(\s*[''"][^''"]*[''"]\s*)\s*$\)\>'
let s:middle = '^\s*@\%(else\a*\|empty\s*$\)'
let s:close = '^\s*@\%(end\a*\|show\|stop\|overwrite\|append\)\>'

function! BladeIndent() abort
  let ind = HtmlIndent()
  let prev = getline(prevnonblank(v:lnum - 1))
  let cur = getline(v:lnum)

  " Opening a block, unless it's closed on the same line: @if($x) foo @endif
  if (prev =~# s:open && prev !~# '@end\a*') || prev =~# s:middle
    let ind += shiftwidth()
  endif
  if cur =~# s:close || cur =~# s:middle
    let ind -= shiftwidth()
  endif

  return max([ind, 0])
endfunction
