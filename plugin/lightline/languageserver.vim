augroup lightline#languageserver
  autocmd!
  autocmd User LanguageClientDiagnosticsChanged call lightline#update()
augroup END

