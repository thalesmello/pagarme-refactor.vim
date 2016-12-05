function! pagarme#refactor#convert_to_javascript_chai_expect_function()
  silent! %s /\v\s+\zs(.+)\.should/expect(\1).to/g
  silent! %s /\vhave\.status\((\d+)\)/have.property('statusCode', \1)/g
endfunction

function! pagarme#refactor#convert_to_pagarme_default_request_function()
  silent! mark a
  if getline('.') =~ 'common\.request'
    s/\vcommon.request\((\w+), \_.{-}path: '(.*)'\_.{-}method: '(.*)'\_.{-}\{(\_.{-})\}, (\w+)\)/common.defaultRequest('\2', '\3', {\4}).then(res => { \1 = res }).then(() => \5()):q
    " silent! execute "normal! ^2wcedefaultRequest\<esc>/(\\_./e\<cr>\"ad/\\ze, comm\<cr>d/path':/e\<cr>d/\\ze'\<cr>"
    " silent! execute "normal! /'method\<cr>d/method':\\_./e\<cr>2/'\\_./e\<cr>d/\\w\\|{\<cr>i, \<esc>"
    " silent execute "normal va,\<esc>a)\<cr>\<esc>"
    " silent! execute "normal! d/\\w\<cr>i.then(function (_\<c-r>a) { \<c-r>a = _\<c-r>a })\<cr>.then(\<esc>mb"
    " silent! 'a,'b s/(_{}) { {} = _{} /() {/
    " silent! 'a,'b normal! ==
  endif
endfunction

function! pagarme#refactor#convert_to_javascript_coroutine_block_function()
  execute "normal! ^/function\<cr>"
  execute "normal cafPromise.coroutine()"
  execute "normal! \"\"P"
  normal! ea *
  normal! ^
endfunction

function! pagarme#refactor#convert_to_pagarme_gateway_wrap()
  normal! ^cegatewayWrap
  normal! f(w
  normal da,
  execute "normal! idata: "
  execute "normal va,\<esc>"
  execute "normal! asecureData: "
  execute "normal va,\<esc>"
  execute "normal! /\\V{\<cr>"
  normal! di{
  normal! v%p
  execute "normal! /\\V\\.function\<cr>"
  normal! dge
  normal! i).spread(
  normal! ^
  normal ysi){
  normal! f(%f(%
  normal! A.catch(_err => { error = _err })
  normal! ^f)%f(
  normal wda,
endfunction
