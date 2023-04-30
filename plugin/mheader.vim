" **************************************************************************** "
"                                                                              "
"                                                  ++++++++       ++++++++     "
"    mheader.vim                                   ++++++++++   ++++++++++     "
"                                                    +++++++++++++++++++       "
"    By: ahmedxyz <ahmedxyz@umich.edu>               +++++ +++++++ +++++       "
"                                                    +++++   +++   +++++       "
"    Created: 2023/04/26 23:44:55 by ahmedxyz      +++++++++  +  +++++++++     "
"    Updated: 2023/04/29 20:11:18 by ahmedxyz      +++++++++     +++++++++     "
"                                                                              "
" **************************************************************************** "


" <3
let s:asciiart = [
			\" ++++++++       ++++++++ ",
			\" ++++++++++   ++++++++++ ",
			\"   +++++++++++++++++++   ",
			\"   +++++ +++++++ +++++   ",
			\"   +++++   +++   +++++   ",
			\" +++++++++  +  +++++++++ ",
			\" +++++++++     +++++++++ "
			\]

let s:start		= '/*'
let s:end		= '*/'
let s:fill		= '*'
let s:length	= 80
let s:margin	= 5

let s:types		= {
			\'\.c$\|\.h$\|\.cc$\|\.hh$\|\.cpp$\|\.hpp$\|\.tpp$\|\.php\|\.glsl':
			\['/*', '*/', '*'],
			\'\.htm$\|\.html$\|\.xml$':
			\['<!--', '-->', '*'],
			\'\.js$':
			\['//', '//', '*'],
			\'\.tex$':
			\['%', '%', '*'],
			\'\.ml$\|\.mli$\|\.mll$\|\.mly$':
			\['(*', '*)', '*'],
			\'\.vim$\|\vimrc$':
			\['"', '"', '*'],
			\'\.el$\|\emacs$':
			\[';', ';', '*'],
			\'\.f90$\|\.f95$\|\.f03$\|\.f$\|\.for$':
			\['!', '!', '/']
			\}

function! s:filetype()
	let l:f = s:filename()

	let s:start	= '#'
	let s:end	= '#'
	let s:fill	= '*'

	for type in keys(s:types)
		if l:f =~ type
			let s:start	= s:types[type][0]
			let s:end	= s:types[type][1]
			let s:fill	= s:types[type][2]
		endif
	endfor

endfunction

function! s:ascii(n)
	return s:asciiart[a:n - 3]
endfunction

function! s:textline(left, right)
	let l:left = strpart(a:left, 0, s:length - strlen(a:right) + 1)

	return s:start . repeat(' ', s:margin - strlen(s:start)) . l:left . repeat(' ', s:length - s:margin * 2 - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin - strlen(s:end)) . s:end
endfunction

function! s:line(n)
    if a:n == 1 || a:n == 11 " top and bottom line
        return s:start . ' ' . repeat(s:fill, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
    elseif a:n == 2 || a:n == 10 " blank line
        return s:textline('', '')
    elseif a:n == 3 || a:n == 5 || a:n == 7 " empty with ascii
        return s:textline('', s:ascii(a:n))
    elseif a:n == 4 " filename
        return s:textline(s:filename(), s:ascii(a:n))
    elseif a:n == 6 " author
        return s:textline("By: " . s:user() . " <" . s:mail() . ">", s:ascii(a:n))
    elseif a:n == 8 " created
        return s:textline("Created: " . s:date() . " by " . s:user(), s:ascii(a:n))
    elseif a:n == 9 " updated
        return s:textline("Updated: " . s:date() . " by " . s:user(), s:ascii(a:n))
    endif
endfunction

function! s:user()
	if exists('g:uniqname')
		let l:user = g:uniqname
    else
		let l:user = "user"
	endif
	return l:user
endfunction

function! s:mail()
	if exists('g:uniqname')
		let l:mail = g:uniqname . "@umich.edu"
    else
		let l:mail = "user@umich.edu"
	endif
	return l:mail
endfunction

function! s:filename()
	let l:filename = expand("%:t")
	if strlen(l:filename) == 0
		let l:filename = "< new >"
	endif
	return l:filename
endfunction

function! s:date()
	return strftime("%Y/%m/%d %H:%M:%S")
endfunction

function! s:insert()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:update()
	call s:filetype()
    if getline(9) =~ s:start . repeat(' ', s:margin - strlen(s:start)) . "Updated: "
        if &mod
            call setline(9, s:line(9))
        endif
        call setline(4, s:line(4))
        return 0
    endif
	return 1
endfunction

function! s:mheader()
	if s:update()
		call s:insert()
	endif
endfunction

" 183 IMPLEMENTATION "
function! s:ascii183(n)
	return s:asciiart[a:n - 2]
endfunction

function! s:textline183(left, right)
	let l:left = strpart(a:left, 0, s:length - strlen(a:right) + 1)
	return " * " . l:left . repeat(' ', s:length - 8  - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin)
endfunction

function! s:line183(n)
    let l:name = "your_name"
    let l:uniqname = "your_uniqname"
    let l:assignment = "assignment"
    let l:term = "term"
    let l:projectuid = "fde244392017fe65ebcc34f01c226b11f113bb3dc6dae8af4cb6ea11bf76f7c8"

    if a:n == 1 " top line
        return s:start . '*'
    elseif a:n == 2 " filename
        return s:textline183(s:filename(), s:ascii183(a:n))
    elseif a:n == 3 || a:n == 6 " empty with ascii
        return s:textline183('', s:ascii183(a:n))
    elseif a:n == 4 " name
        return s:textline183(l:name, s:ascii183(a:n))
    elseif a:n == 5 " uniqname
        return s:textline183(l:uniqname, s:ascii183(a:n))
    elseif a:n == 7 " class and assignment
        return s:textline183("EECS 183: " . l:assignment, s:ascii183(a:n))
    elseif a:n == 8 " term
        return s:textline183(l:term, s:ascii183(a:n))
    elseif a:n == 9 " empty without ascii
        return s:textline183('', '')
    elseif a:n == 10 " project uid
        return " * Project UID: " . l:projectuid
    elseif a:n == 11 " bottom line
        return ' ' . s:end
    endif
endfunction

function! s:mheader183()
    call s:filetype()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line183(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

" Bind command and shortcut
command! Mheader call s:mheader ()
command! Mheader183 call s:mheader183 ()
map <f1> <esc>:Mheader<CR>
autocmd BufWritePre * call s:update ()
