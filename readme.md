# nvim -- config for neovim

## nvim-lspconfig

See

    https://github.com/neovim/nvim-lspconfig


## julia lsp

```sh
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer"); Pkg.add("StaticLint")'
```

### julials, Project.toml and root directories

From Clod,

 The problem is that julials needs the Julia environment path passed dynamically as an argument to the  
  julia process — lspconfig does this via on_new_config. The new vim.lsp.config API doesn't have an      
  equivalent hook.                                                                                       
   
  You can check what config Neovim or lspconfig already provides:                                        
                  
  :lua print(vim.inspect(vim.lsp.config.julials))

  If lspconfig is installed, it registers its configs so vim.lsp.enable('julials') picks them up
  automatically. In that case, you can just override root_markers on top:

  vim.lsp.config('julials', {
    root_markers = { 'Project.toml', 'JuliaProject.toml', '.git' },
  })
  vim.lsp.enable('julials')

  lspconfig's underlying on_new_config for julials will still run and use the resolved root as the
  environment path — you're just overriding the root detection part.

  If lspconfig isn't providing the config, you'd have to hardcode the cmd with the full julia invocation
  including the environment path, which gets ugly. In that case it's more pragmatic to keep lspconfig for
   julials until the built-in configs mature.

I'll try the config for `julials` as suggested above.

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

NOTE: plugins are installed in dir. `~/.local/share/nvim/plugged`,

```sh
ls ~/.local/share/nvim/plugged
```
=>
    claude.vim  lean.nvim       plenary.nvim  vim-chpl   vim-table-mode  zig.vim
    julia-vim   nvim-lspconfig  rust.vim      vim-slime  vim-terra

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
