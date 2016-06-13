command! ConvertToJavascriptMultiDeclaration call pagarme#refactor#convert_to_javascript_multi_declaration_function()
command! ConvertToJavascriptChaiExpect call pagarme#refactor#convert_to_javascript_chai_expect_function()
command! ConvertToPagarmeDefaultRequest call pagarme#refactor#convert_to_pagarme_default_request_function()
command! -range ConvertToJavascriptPlainProperty <line1>,<line2>s/\V['\(\.\{-}\)']/.\1/g
