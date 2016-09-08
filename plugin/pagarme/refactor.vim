command! -range ConvertToJavascriptMultiDeclaration <line1>,<line2>s/,\_W\+/\rvar /g
command! ConvertToJavascriptChaiExpect call pagarme#refactor#convert_to_javascript_chai_expect_function()
command! ConvertToPagarmeDefaultRequest call pagarme#refactor#convert_to_pagarme_default_request_function()
command! ConvertToPagarmeGatewayWrap call pagarme#refactor#convert_to_pagarme_gateway_wrap()
command! -range ConvertToJavascriptPlainProperty <line1>,<line2>s/\V['\(\.\{-}\)']/.\1/g
command! ConvertToJavascriptCoroutineBlock call pagarme#refactor#convert_to_javascript_coroutine_block_function()
command! ConvertToJavascriptLambdaExpression execute "normal! [{b%db%wva{J%d2Wi=> " | execute "normal! ``X"
