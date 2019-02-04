let g:lightline#languageserver#warnings  = get(g:, 'lightline#languageserver#warnings', 'W: ')
let g:lightline#languageserver#errors = get(g:, 'lightline#languageserver#errors', 'E: ')
let g:lightline#langaugeserver#ok = get(g:, 'lightline#langaugeserver#ok', 'OK')

"""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#languageserver#warnings()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'W'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:lightline#languageserver#warnings . '%d', count) : ''
endfunction

function! lightline#languageserver#errors()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'E'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:lightline#languageserver#errors . '%d', count) : ''
endfunction

function! lightline#languageserver#ok()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && (dict['type'] == 'E' || dict['type'] == 'W')})
  let count = len(current_buf_diagnostics)
  return count == 0 ? g:lightline#languageserver#ok : ''
endfunction
