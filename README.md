# kwguo-vim

[![Build Status](https://travis-ci.com/shana0440/kwguo-vim.svg?branch=master)](https://travis-ci.com/shana0440/kwguo-vim)

> This repository inspired by [spf13-vim](https://github.com/spf13/spf13-vim)

spf13-vim is great, but too heavy for me, so I create my own Vim Distribution

I highly recommend spf13-vim if your device are powerful

## Requirement
- vim with lua for neocomplete
- Java8+ for vim-grammarous

## Installation

> !! This script only works on mac & ubuntu

**Make sure you vim support lua, otherwise neocomplete.vim wouldn't install**

```bash
bash <(curl https://bit.ly/2Ojwlzi -L)
```

## Keyboard shortcut

| Key                | Command               |
| :----------------- | :-------------------- |
| Ctrl + e           | :NERDTreeToggle       |
| &lt;Leader&gt; + t | :tabedit              |
| Ctrl + p           | :FZF                  |
| Ctrl + d           | :sh                   |
| Ctrl + f           | :OverCommandLine      |
| Ctrl + m           | :NERDComToggleComment |

> &lt;Leader&gt; is mapping to `\` by default
