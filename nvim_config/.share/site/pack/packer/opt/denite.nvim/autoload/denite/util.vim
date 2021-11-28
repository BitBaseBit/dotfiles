"=============================================================================
" FILE: util.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

let s:is_windows = has('win32') || has('win64')

function! s:check_wsl() abort
  if has('nvim')
    return has('wsl')
  endif
  if has('unix') && executable('uname')
    return match(system('uname -r'), "\\cMicrosoft") >= 0
  endif
  return v:false
endfunction

function! denite#util#set_default(var, val, ...)  abort
  if !exists(a:var) || type({a:var}) != type(a:val)
    let alternate_var = get(a:000, 0, '')

    let {a:var} = exists(alternate_var) ?
          \ {alternate_var} : a:val
  endif
endfunction
function! denite#util#print_error(string) abort
  echohl Error | echomsg '[denite] ' . a:string | echohl None
endfunction
function! denite#util#print_warning(string) abort
  echohl WarningMsg | echomsg '[denite] ' . a:string | echohl None
endfunction

function! denite#util#convert2list(expr) abort
  return type(a:expr) ==# v:t_list ? a:expr : [a:expr]
endfunction

function! denite#util#execute_path(command, path) abort
  let dir = denite#util#path2directory(a:path)
  " Auto make directory.
  if dir !~# '^\a\+:' && !isdirectory(dir)
        \ && denite#util#input_yesno(
        \       printf('"%s" does not exist. Create?', dir))
    call mkdir(dir, 'p')
  endif

  try
    execute a:command fnameescape(s:expand(a:path))
  catch /^Vim\%((\a\+)\)\=:E325\|^Vim:Interrupt/
    " Ignore swap file error
  catch
    call denite#util#print_error(v:throwpoint)
    call denite#util#print_error(v:exception)
  endtry
endfunction
function! denite#util#execute_command(command, is_capture) abort
  let msg = ''
  try
    if a:is_capture
      let msg = execute(a:command, 'silent!')
    else
      execute a:command
    endif
  catch /^Vim\%((\a\+)\)\=:E/
    call denite#util#print_error(v:errmsg)
  endtry
  return msg
endfunction

function! denite#util#echo(color, string) abort
  execute 'echohl' a:color
  echon a:string
  echohl NONE
endfunction

function! denite#util#getchar(...) abort
  try
    return call('getchar', a:000)
  catch /^Vim:Interrupt/
    return 3
  catch
    return 0
  endtry
endfunction

function! denite#util#open(filename) abort
  let filename = fnamemodify(a:filename, ':p')

  let is_cygwin = has('win32unix')
  let is_mac = !s:is_windows && !is_cygwin
        \ && (has('mac') || has('macunix') || has('gui_macvim') ||
        \   (!isdirectory('/proc') && executable('sw_vers')))
  let is_wsl = s:check_wsl()

  " Detect desktop environment.
  if s:is_windows
    " For URI only.
    " Note:
    "   # and % required to be escaped (:help cmdline-special)
    silent execute printf(
          \ '!start rundll32 url.dll,FileProtocolHandler %s',
          \ escape(filename, '#%'),
          \)
  elseif is_cygwin
    " Cygwin.
    call system(printf('%s %s', 'cygstart',
          \ shellescape(filename)))
  elseif executable('xdg-open')
    " Linux.
    call system(printf('%s %s &', 'xdg-open',
          \ shellescape(filename)))
  elseif executable('lemonade')
    call system(printf('%s %s &', 'lemonade open',
          \ shellescape(filename)))
  elseif exists('$KDE_FULL_SESSION') && $KDE_FULL_SESSION ==# 'true'
    " KDE.
    call system(printf('%s %s &', 'kioclient exec',
          \ shellescape(filename)))
  elseif exists('$GNOME_DESKTOP_SESSION_ID')
    " GNOME.
    call system(printf('%s %s &', 'gnome-open',
          \ shellescape(filename)))
  elseif executable('exo-open')
    " Xfce.
    call system(printf('%s %s &', 'exo-open',
          \ shellescape(filename)))
  elseif is_mac && executable('open')
    " Mac OS.
    call system(printf('%s %s &', 'open',
          \ shellescape(filename)))
  elseif is_wsl && executable('cmd.exe')
    " WSL and not installed any open commands

    " Open the same way as Windows.
    " I don't know why, but the method using execute requires redraw <C-l>
    " after execution in vim.
    call system(printf('cmd.exe /c start rundll32 %s %s',
          \ 'url.dll,FileProtocolHandler',
          \ escape(filename, '#%')))
  else
    " Give up.
    throw 'Not supported.'
  endif
endfunction

function! denite#util#cd(path) abort
  if exists('*chdir')
    call chdir(a:path)
  else
    silent execute 'lcd' fnameescape(a:path)
  endif
endfunction

function! denite#util#split(string) abort
  return split(a:string, '\s*,\s*')
endfunction

function! denite#util#substitute_path_separator(path) abort
  return s:is_windows ? substitute(a:path, '\\', '/', 'g') : a:path
endfunction
function! denite#util#path2directory(path) abort
  return denite#util#substitute_path_separator(
        \ isdirectory(a:path) ? a:path : fnamemodify(a:path, ':p:h'))
endfunction
function! s:expand(path) abort
  return denite#util#substitute_path_separator(
        \ (a:path =~# '^\~') ? fnamemodify(a:path, ':p') :
        \ a:path)
endfunction

function! denite#util#alternate_buffer() abort
  if len(filter(range(1, bufnr('$')), { _, val -> buflisted(val) })) <= 1
    enew
    return
  endif

  let cnt = 0
  let pos = 1
  let current = 0
  while pos <= bufnr('$')
    if buflisted(pos)
      if pos == bufnr('%')
        let current = cnt
      endif

      let cnt += 1
    endif

    let pos += 1
  endwhile

  if current > cnt / 2
    bprevious
  else
    bnext
  endif
endfunction
function! denite#util#delete_buffer(command, bufnr) abort
  if index(tabpagebuflist(), a:bufnr) < 0
    silent execute a:bufnr a:command
    return
  endif

  let buffers = filter(range(1, bufnr('$')), { _, val -> buflisted(val) })
  if len(buffers) == 1 && bufname(buffers[0]) ==# ''
    " Noname buffer only
    return
  endif

  " Not to close window, move to alternate buffer.
  let prev_winnr = winnr()
  for winnr in range(1, winnr('$'))
    if winbufnr(winnr) == a:bufnr
      execute winnr . 'wincmd w'
      call denite#util#alternate_buffer()
    endif
  endfor
  execute prev_winnr . 'wincmd w'
  silent execute a:bufnr a:command
endfunction

function! denite#util#input(prompt, ...) abort
  let text = get(a:000, 0, '')
  let completion = get(a:000, 1, '')
  try
    if completion !=# ''
      return input(a:prompt, text, completion)
    else
      return input(a:prompt, text)
    endif
  catch
    " ignore the errors
    return ''
  endtry
endfunction

function! denite#util#input_yesno(message) abort
  let yesno = input(a:message . ' [yes/no]: ')
  while yesno !~? '^\%(y\%[es]\|n\%[o]\)$'
    redraw
    if yesno ==# ''
      echo 'Canceled.'
      break
    endif

    " Retry.
    call denite#util#print_error('Invalid input.')
    let yesno = input(a:message . ' [yes/no]: ')
  endwhile

  redraw

  return yesno =~? 'y\%[es]'
endfunction

function! denite#util#has_yarp() abort
  return !has('nvim')
endfunction
function! denite#util#rpcrequest(method, args, is_async) abort
  if !denite#init#_check_channel()
    return -1
  endif

  if denite#util#has_yarp()
    if g:denite#_yarp.job_is_dead
      return -1
    endif
    if a:is_async
      return g:denite#_yarp.notify(a:method, a:args)
    else
      return g:denite#_yarp.request(a:method, a:args)
    endif
  else
    if a:is_async
      return rpcnotify(g:denite#_channel_id, a:method, a:args)
    else
      return rpcrequest(g:denite#_channel_id, a:method, a:args)
    endif
  endif
endfunction

function! denite#util#getreg(reg) abort
  " Note: Substitute <80><fd>
  return substitute(getreg(a:reg, 1), '[\xfd\x80]', '', 'g')
endfunction

function! denite#util#check_floating(context) abort
  return (a:context['split'] ==# 'floating' ||
        \ a:context['split'] ==# 'floating_relative_cursor' ||
        \ a:context['split'] ==# 'floating_relative_window' ||
        \ a:context['filter_split_direction'] ==# 'floating')
        \ && exists('*nvim_open_win')
endfunction
function! denite#util#check_matchdelete() abort
  if !exists('s:check_matchdelete')
    let s:check_matchdelete = v:false
    try
      call getmatches(win_getid())
      let s:check_matchdelete = v:true
    catch
      " Ignore error
    endtry
  endif

  return s:check_matchdelete
endfunction

function! denite#util#escape_match(str) abort
  return escape(a:str, '~\.^$[]')
endfunction

function! denite#util#truncate(str, max, footer_width, separator) abort
  let width = strwidth(a:str)
  if width <= a:max
    let ret = a:str
  else
    let header_width = a:max - strwidth(a:separator) - a:footer_width
    let ret = s:strwidthpart(a:str, header_width) . a:separator
         \ . s:strwidthpart_reverse(a:str, a:footer_width)
  endif
  return s:truncate(ret, a:max)
endfunction
function! s:truncate(str, width) abort
  " Original function is from mattn.
  " http://github.com/mattn/googlereader-vim/tree/master

  if a:str =~# '^[\x00-\x7f]*$'
    return len(a:str) < a:width
          \ ? printf('%-' . a:width . 's', a:str)
          \ : strpart(a:str, 0, a:width)
  endif

  let ret = a:str
  let width = strwidth(a:str)
  if width > a:width
    let ret = s:strwidthpart(ret, a:width)
    let width = strwidth(ret)
  endif

  return ret
endfunction
function! s:strwidthpart(str, width) abort
  let str = tr(a:str, "\t", ' ')
  let vcol = a:width + 2
  return matchstr(str, '.*\%<' . (vcol < 0 ? 0 : vcol) . 'v')
endfunction
function! s:strwidthpart_reverse(str, width) abort
  let str = tr(a:str, "\t", ' ')
  let vcol = strwidth(str) - a:width
  return matchstr(str, '\%>' . (vcol < 0 ? 0 : vcol) . 'v.*')
endfunction
