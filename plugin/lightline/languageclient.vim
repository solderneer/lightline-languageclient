augroup lightline#languageclient
  autocmd!
  autocmd User LanguageClientDiagnosticsChanged call lightline#update()
augroup END

