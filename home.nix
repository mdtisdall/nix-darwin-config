{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dylan";
  home.homeDirectory = "/Users/dylan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-sensible
      vim-airline
      vim-fugitive 
      vim-surround
      vim-commentary
      vim-sleuth
      vim-pencil
    ];
    extraConfig = ''
      "filetype plugin indent on
      "set nocompatible
      "set modelines=0
      "set nocompatible

      "set modelines=0

      "set encoding=utf-8
      "set scrolloff=3
      "set autoindent
      "set showmode
      "set showcmd
      "set hidden
      "set wildmenu
      "set wildmode=list:longest
      "set visualbell
      "set cursorline
      "set ttyfast
      "set ruler
      "set backspace=indent,eol,start
      "set laststatus=2
      set number relativenumber
      "set undofile

      "set ignorecase
      "set smartcase

      "set wrap
      "set textwidth=0
      "set formatoptions=qrn1
      "set colorcolumn=80
      "set linebreak

      "set makeprg=make

      "nnoremap <leader><space> :noh<cr>
      "nnoremap <tab> %
      "vnoremap <tab> %

      "noremap <up> <nop>
      "noremap <down> <nop>
      "noremap <left> <nop>
      "noremap <right> <nop>
      "noremap j gj
      "noremap k gk

      syntax on
      "set statusline+=%{FugitiveStatusline()}"
      '';
  };

  programs.git = {
    enable = true;
    userName = "Dylan Tisdall";
    userEmail = "mtisdall@pennmedicine.upenn.edu";
    extraConfig.core.editor = "vim";
    extraConfig.diff.tool = "vimdiff";
    extraConfig.difftool.prompt = false;
  };

}
