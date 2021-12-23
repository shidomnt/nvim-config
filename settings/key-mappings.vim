"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Open New Tab
noremap tt :tab split<CR>

"Close Current Tab
noremap tw :wq<CR>

"Switch Current Tab
noremap tp :tabnext<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Format
nnoremap <Leader>fd :FormatCode<CR>

" Complier C/C++
nmap <Leader>g++ :!g++ %:t -g -o %:r<CR><CR>

" Auto indent
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

"Remove Search Highlight
noremap <C-h> :nohl<CR>

"Not auto close window when wipe a buffer
function! BufferDelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            echo "Buffer deleted. Created new buffer."
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction
map <silent> <Leader>q :call BufferDelete()<cr>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" Open a new terminal 
nnoremap   <silent>   <leader>to    :FloatermNew<CR>
tnoremap   <silent>   <leader>to    <C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
nnoremap <silent> 	<leader>tk 		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<leader>tk 		<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

" Navigation next and previous terminal 
nnoremap <silent> 	<leader>tn 		:FloatermNext<CR>
tnoremap <silent> 	<leader>tn 		<C-\><C-n>:FloatermNext<CR>
nnoremap <silent> 	<leader>tp 		:FloatermPrev<CR>
tnoremap <silent> 	<leader>tp 		<C-\><C-n>:FloatermPrev<CR>

" Toggle terminal
nnoremap <silent> 	<leader>tt 		:FloatermToggle<CR>
tnoremap <silent> 	<leader>tt 		<C-\><C-n>:FloatermToggle<CR>

nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
