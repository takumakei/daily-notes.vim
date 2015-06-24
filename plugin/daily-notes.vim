"=============================================================================
" FILE: daily-notes.vim
" AUTHOR: takumakei@gmail.com
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

if exists('g:loaded_daily_notes')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" Global options definition. "{{{
let g:daily_notes_base = get(g:, 'daily_notes_base', '~/daily-notes')
"}}}

function! s:dailynotes_edit(...) "{{{
  let diff = a:0 >= 1 ? a:1 : 0
  let now = localtime() + (diff * 24 * 60 * 60)
  let ary = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
  let day = ary[strftime("%w", now)]
  let txt = strftime("%Y-%m-%d", now) . "(" . day . ").md"
  let txt = strftime(g:daily_notes_base . "/%Y/", now) . txt
  execute ":e " . txt
  execute ":normal G"
endfunction"}}}

function! s:dailynotes_header() "{{{
  let a = line(".")
  let h = "----------------------------------------------------------------------"
  call append(a, [h,"","[".strftime('%Y-%m-%d %H:%M:%S', localtime())."]","",""])
  call cursor(a + 5, 0)
endfunction"}}}

function! s:dailynotes_timestamp() "{{{
  call append(line(".") - 1, ["[".strftime('%Y-%m-%d %H:%M:%S', localtime())."]"])
endfunction"}}}

command! -nargs=? DailyNotes          call <SID>dailynotes_edit(<q-args>)
command! -nargs=0 DailyNotesHeader    call <SID>dailynotes_header()
command! -nargs=0 DailyNotesTimestamp call <SID>dailynotes_timestamp()

" Keymappings "{{{
nnoremap <Leader>dh :DailyNotesHeader<CR>
nnoremap <Leader>dt :DailyNotesTimestamp<CR>
inoremap <C-]>h <C-o>:DailyNotesHeader<CR>
inoremap <C-]>t <C-o>:DailyNotesTimestamp<CR>
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_daily_notes = 1

" vim: foldmethod=marker
