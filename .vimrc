execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set sw=4
set ts=4

"新建.c,.h,.sh,.java文件，自动插入文件头

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

""定义函数SetTitle，自动插入文件头

func SetTitle()

        call append(line("."), "//File Name: ".expand("%"))
        call append(line(".")+1, "//Author: fox")
        call append(line(".")+2, "//mail: 664088852@qq.com")
        call append(line(".")+3, "//Created Time: ".strftime("%c"))
	call append(line(".")+4, "")

    if &filetype == 'cpp'
        call append(line(".")+5, "#include<iostream>")
        call append(line(".")+6, "using namespace std;")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main(int argc, char *argv[])")
        call append(line(".")+9, "{")
        call append(line(".")+10, "    return 0;")
	    call append(line(".")+11, "}")
    endif

    if &filetype == 'c'
        call append(line(".")+5, "#include<stdio.h>")
        call append(line(".")+6, "#include<stdlib.h>")
        call append(line(".")+7, "#include<string.h>")
        call append(line(".")+8, "#include<errno.h>")
        call append(line(".")+9, "")
        call append(line(".")+10, "int main(int argc, char *argv[])")
        call append(line(".")+11, "{")
        call append(line(".")+12, "    return 0;")
	    call append(line(".")+13, "}")
	
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

map <C-f> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 15
