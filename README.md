# My Vim Environment Setting

## vim8 설치

```bash
# Vim Compile (python3 need by coc.nvim)
$ yum install python3-6-devel	# required
$ git clone https://github.com/vim/vim.git && cd vim
$ ./configure --prefix=/usr/local --enable-python3interp --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu --with-python3-command=python3 --enable-fail-if-missing=yes
$ make && make install
```



## Vundle 설치

```bash
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Repository에 있는 vim 디렉토리 전체 옮기면 필요 없음



## molokai 다운로드

```bash
$ git clone github.com/molokai
$ mkdir ~/.vim/colors && mv molokai.vim ~/.vim/colors
```

Repository에 있는 vim 디렉토리 전체 옮기면 필요 없음



## Vim Plugin 설치

vimrc을 $HOME/.vimrc 로 옮긴 후 `:PluginInstall`. 



## coc.nvim 세팅

javascript 관련 에러 시 `:call coc#util#install()` 으로 에러 잡기

`:CocConfig` 로 각 언어 별 LSP 서버 등록 [참고](https://www.joinc.co.kr/w/man/12/neovim)

`:CocInstall coc-go` 형태로 각 언어 별 바이너리 설치

