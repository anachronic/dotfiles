let s:error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
let s:warning_sign = get(g:, 'coc_status_warning_sign', has('mac') ? '⚠️ ' : 'W')

function! ach#coc#status()
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, s:error_sign . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, s:warning_sign . info['warning'])
  endif

  let status = &filetype == 'python' ? s:virtualenv() : get(g:, 'coc_status', '')
  return s:trim(join(msgs, ' ') . ' ' . status)
endfunction

function! s:virtualenv()
  let status = get(g:, 'coc_status', '')
  let returnvalue = matchlist(status, '''\(.*\)''')
  " echom returnvalue

  if returnvalue == []
    return status
  endif

  return 'env: ' . returnvalue[1]
endfunction

function! s:trim(str)
  if exists('*trim')
    return trim(a:str)
  endif
  return substitute(a:str, '\s\+$', '', '')
endfunction
