# nvim -- config for neovim

## lsp

from https://stackoverflow.com/questions/75665675/how-to-properly-source-use-lua-file-in-init-vim-config-for-neovim#75665834

    If you have an existing init.vim and you don't want to immediately convert everything into lua, you can add to your init.vim:

    lua require('init')

    And this will load the file .config/nvim/lua/init.lua.

## getting started

 - place plug.vim in dir. ./autoload
 - in nvim, run

        :PlugInstall

 - should be ready to go!


## dir. autoload

Fetch plug.vim, see autoload/readme.md


## dir. colors

Color scheme bluegray.vim; add others?

## plugins

Might want

    Plug 'jakwings/vim-pony'

or

    Plug 'plasticboy/vim-markdown'
    Plug 'gabrielelana/vim-markdown'

somewhere between `call plug#begin()` and `call plug#end()`.

### markdown 

for vim-markdown (see github.com/plasticboy/vim-markdown), might want (i.e. I think I used to have) the following

    let g:vim_markdown_folding_disabled=1

## terminal mode

still messing around with binding for <C-\><C-n> i.e. switch to normal mode, considering the following

    tnoremap <Esc> <C-\><C-n> " does this work?
    tnoremap <S-Space> <C-\><C-n> " does this work?
    tnoremap <C-Space> <C-\><C-n> " is this good enough?
    " tnoremap <M-j> <C-\><C-n>

## vim-slime

After installing plugins, may need to change keybindings in plugged/vim-slime/plugin/slime.vim

Consider adding binding for send to <M-Enter> and shifting that binding in dwm to modkey-shift xk_return.

### quoting in vim-slime

handling of quote marks in shell and/or markdown not always as expected (?)



#### end
