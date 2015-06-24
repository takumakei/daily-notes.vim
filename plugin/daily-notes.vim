if exists('g:loaded_daily_notes')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let g:daily_notes_base = get(g:, 'daily_notes_base', '~/daily-notes')

function! g:DailyNotes(...)
  let diff = a:0 >= 1 ? a:1 : 0
  let now = localtime() + (diff * 24 * 60 * 60)
  let ary = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
  let day = ary[strftime("%w", now)]
  let txt = strftime("%Y-%m-%d", now) . "(" . day . ").md"
  let txt = strftime(g:daily_notes_base . "/%Y/", now) . txt
  execute ":e " . txt
  execute ":normal G"
endfunction

function! g:DailyNotesHeader()
  let a = line(".")
  let h = "----------------------------------------------------------------------"
  call append(a, [h,"","[".strftime('%Y-%m-%d %H:%M:%S', localtime())."]","",""])
  call cursor(a + 5, 0)
endfunction

function! g:DailyNotesTimeStamp()
  call append(line(".") - 1, ["[".strftime('%Y-%m-%d %H:%M:%S', localtime())."]"])
endfunction

command! -nargs=? DailyNotes          call DailyNotes(<q-args>)
command! -nargs=0 DailyNotesHeader    call DailyNotesHeader()
command! -nargs=0 DailyNotesTimeStamp call DailyNotesTimeStamp()

nnoremap <Leader>dh :call DailyNotesHeader()<CR>
nnoremap <Leader>dt :call DailyNotesTimeStamp()<CR>
inoremap <C-]>h <C-o>:call DailyNotesHeader()<CR>
inoremap <C-]>t <C-o>:call DailyNotesTimeStamp()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_daily_notes = 1
