nnoremap 	<Leader>dl :call vimspector#Launch()<CR>
nnoremap 	<Leader>ds :call vimspector#Reset()<CR>
nnoremap 	<Leader>dc :call vimspector#Continue()<CR>

nnoremap 	<Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap 	<Leader>dT :call vimspector#ClearBreakpoints()<CR>

nnoremap 	<Leader>de :call vimspector#StepOut()<CR>
nnoremap 	<Leader>di :call vimspector#StepInto()<CR>
nnoremap 	<Leader>do :call vimspector#StepOver()<CR>

nmap 		<Leader>dr <Plug>VimspectorRestart

