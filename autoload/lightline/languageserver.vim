let s:indicator_warnings = get(g:, 'lightline#languageserver#indicator_warnings', 'W: ')
let s:indicator_errors = get(g:, 'lightline#languageserver#indicator_errors', 'E: ')
let s:indicator_ok = get(g:, 'lightline#langaugeserver#indicator_ok', 'OK')

"""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#languageserver#warnings()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'W'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(s:indicator_warnings . '%d', count) : ''
endfunction

function! lightline#languageserver#errors()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'E'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(s:indicator_errors . '%d', count) : ''
endfunction

function! lightline#languageserver#ok()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && (dict['type'] == 'E' || dict['type'] == 'W')})
  let count = len(current_buf_diagnostics)
  return count == 0 ? s:indicator_ok : ''
endfunction
