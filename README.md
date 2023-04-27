# vim-m-header
vim header for the UM community

![fancy header image](https://i.imgur.com/z4bjiyv.png)

## Features
* Adds cool block M to the top of your code file
* Updates filename line when changed
* Updates "Updated" line only when buffer is changed
* Works with variety of file types
* Binds to `F1` for easy access
* Easy to use in normal mode with `:Mheader`

## Usage 

### No plugin manager
Copy `mheader.vim` to your `~/.vim/plugin/` folder. You're set!

### vim-plug
If you use vim-plug or any other plugin manager, simply add this line to your
`.vimrc`:

```vim
Plug 'ahmedxyz/vim-m-header'
```

### Setting uniqname and email
Add these lines to your `.vimrc`:

```vim
let g:uniqname='your_uniqname'
let g:email='your_email'
```

## Credits
[42Paris](https://github.com/42Paris/42header)

[pbondoer](https://github.com/pbondoer/vim-42header)
