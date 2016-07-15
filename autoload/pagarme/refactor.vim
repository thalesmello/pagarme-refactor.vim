function! pagarme#refactor#convert_to_javascript_multi_declaration_function()
   " This functionality depends on vim-indent-text-obj
   silent! normal vii
   silent! '<,'>s/,\_W\+/\rvar /g
endfunction

function! pagarme#refactor#convert_to_javascript_chai_expect_function()
  silent! %s /\v\s+\zs(.+)\.should/expect(\1).to/g
  silent! %s /\vhave\.status\((\d+)\)/have.property('statusCode', \1)/g
endfunction

function! pagarme#refactor#convert_to_pagarme_default_request_function()
   silent! mark a
   if getline('.') =~ 'common\.request'
      silent! execute "normal! ^2wcedefaultRequest\<esc>/(\\_./e\<cr>\"ad/\\ze, comm\<cr>d/path':/e\<cr>d/\\ze'\<cr>"
      silent! execute "normal! /'method\<cr>d/method':\\_./e\<cr>2/'\\_./e\<cr>d/\\w\\|{\<cr>i, \<esc>"
      if getline('.') =~ ',\(function ()\)\@!\_s\+{'
         silent! execute "normal! %a)\<cr>\<esc>"
      else
         silent! execute "normal! /,\<cr>i)\<cr>\<esc>"
      endif
      silent! execute "normal! d/\\w\<cr>i.then(function (_\<c-r>a) { \<c-r>a = _\<c-r>a })\<cr>.then(\<esc>mb"
      silent! 'a,'bs/(_{}) { {} = _{} /() {/
      silent! 'a,'bnormal! ==
   endif
endfunction

