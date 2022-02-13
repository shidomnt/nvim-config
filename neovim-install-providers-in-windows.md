# Install provider-* for Neovim (nvim) in Windows

## :h provider-python

First, add those lines in your `%LocalAppData%\nvim\init.vim`:

```vim
" Source local init.vim {{{1
let s:local_vimrc = expand('$LOCALAPPDATA\nvim\init.local.vim')
if filereadable(fnameescape(s:local_vimrc))
  execute 'source ' . fnameescape(s:local_vimrc)
endif
unlet! s:local_vimrc
```

### For Python 3

```dosbatch
> cd /d %UserProfile%
> mkdir venv
> cd venv
> "C:\Program Files\Python37\python.exe" -m pip list -l
> "C:\Program Files\Python37\python.exe" -m pip install -U pip
> "C:\Program Files\Python37\python.exe" -m pip install -U setuptools
> "C:\Program Files\Python37\python.exe" -m venv neovim3
> neovim3\Scripts\activate.bat
(neovim3) > python --version    ::--> Should see "Python 3.7.XX"
(neovim3) > pip list -l
(neovim3) > ::pip install -U pip
(neovim3) > python -m pip install -U pip
(neovim3) > ::pip install -U setuptools
(neovim3) > python -m pip install -U setuptools
(neovim3) > pip list -l
(neovim3) > pip install pynvim
(neovim3) > pip install bashate
(neovim3) > pip install language-check
(neovim3) > pip install vim-vint
(neovim3) > pip install yapf
(neovim3) > pip install zdict
```

Then, add those lines in your `%LocalAppData%\nvim\init.local.vim`:

```vim
" Providers configuration {{{1

" Python 3 provider {{{2
let s:python3_host_prog = expand('$USERPROFILE\venv\neovim3\Scripts\python.exe')
if filereadable(fnameescape(s:python3_host_prog))
  let g:python3_host_prog = fnameescape(s:python3_host_prog)
else
  unlet! g:python3_host_prog
endif
```

### For Python 2

```dosbatch
> cd /d %UserProfile%
> mkdir venv
> cd venv
> "C:\Python27\python.exe" -m pip list -l
> "C:\Python27\python.exe" -m pip install -U pip
> "C:\Python27\python.exe" -m pip install -U setuptools
> "C:\Python27\python.exe" -m pip install -U virtualenv
> "C:\Python27\Scripts\virtualenv.exe" neovim2
> neovim2\Scripts\activate.bat
(neovim2) > python --version    ::--> Should see "Python 2.7.XX"
(neovim2) > pip list -l
(neovim2) > pip install -U pip
(neovim2) > pip install -U setuptools
(neovim2) > pip install -U wheel
(neovim2) > pip list -l
(neovim2) > pip install pynvim
```

Then, add those lines in your `%LocalAppData%\nvim\init.local.vim`:

```vim
" Providers configuration {{{1

" Python 2 provider {{{2
let s:python_host_prog = expand('$USERPROFILE\venv\neovim2\Scripts\python.exe')
if filereadable(fnameescape(s:python_host_prog))
  let g:python_host_prog = fnameescape(s:python_host_prog)
else
  unlet! g:python_host_prog
endif
```

## :h provider-ruby

Ref: <http://lee.logdown.com/posts/165890/ruby-on-windows-7-to-install-ruby-on-rails>
Download and Install "rubyinstaller-X.X.X-X-x64.exe" from <https://rubyinstaller.org/downloads/>

```dosbatch
> gem update --system
> gem install neovim
```

Then, add those lines in your `%LocalAppData%\nvim\init.local.vim`:

```vim
" Providers configuration {{{1

" Ruby provider {{{2
let s:ruby_host_prog = expand('C:\Ruby25-x64\bin\neovim-ruby-host.bat')
if filereadable(fnameescape(s:ruby_host_prog))
  let g:ruby_host_prog = fnameescape(s:ruby_host_prog)
else
  unlet! g:ruby_host_prog
endif
```

## :h provider-nodejs

Download and Install "node-vX.X.X-x64.msi" (LTS) from <https://nodejs.org/en/download/>

```dosbatch
> npm install -g neovim
```

Then, by default, `prefix=${APPDATA}\npm` this line should be already set in
`C:\Program Files\nodejs\node_modules\npm\npmrc`.

Then, add those lines in your `%LocalAppData%\nvim\init.local.vim`:

```vim
" Providers configuration {{{1

" Node.js provider {{{2
let s:node_host_prog = expand('$APPDATA\npm\node_modules\neovim\bin\cli.js')
if filereadable(fnameescape(s:node_host_prog))
  let g:node_host_prog = fnameescape(s:node_host_prog)
else
  unlet! g:node_host_prog
endif
```
