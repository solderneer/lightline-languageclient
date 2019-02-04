let g:lightline#languageclient#warnings  = get(g:, 'lightline#languageclient#warnings', 'W: ')
let g:lightline#languageclient#errors = get(g:, 'lightline#languageclient#errors', 'E: ')
let g:lightline#langaugeclient#ok = get(g:, 'lightline#langaugeclient#ok', 'OK')

"""""""""""""""""""""""""""""""""""""""""
" Lightline components

function! lightline#languageclient#warnings()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'W'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:lightline#languageclient#warnings . '%d', count) : ''
endfunction

function! lightline#languageclient#errors()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'E'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:lightline#languageclient#errors . '%d', count) : ''
endfunction

function! lightline#languageclient#ok()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && (dict['type'] == 'E' || dict['type'] == 'W')})
  let count = len(current_buf_diagnostics)
  return count == 0 ? g:lightline#languageclient#ok : ''
endfunction
