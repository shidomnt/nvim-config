"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>
" Buffer Switch
nmap <C-i> :bn<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Complier C/C++
nmap <Leader>g++ :!g++ %:t -g -o %:r<CR><CR>

" Format Document
nmap <Leader>format gg=G<C-o>


