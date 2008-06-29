" HTML macros ----------------------------------------------------------
"let rhs= maparg("gh","")
"if rhs != "" | silent unmap gh | endif

" HTML Strict
map <leader>ghs ggO<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"><ESC>:set ft=html<CR>
" HTML Transitional
map <leader>ght ggO<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><ESC>:set ft=html<CR>
" HTML Framset
map <leader>ghf ggO<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd"><ESC>:set ft=html<CR>
" XHTML Strict
map <leader>ghxs ggO<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><ESC>:set ft=xhtml<CR>
" XHTML Transitional
map <leader>ghxt ggO<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><ESC>:set ft=xhtml<CR>
" XHTML Frameset
map <leader>ghxf ggO<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"><ESC>:set ft=xhtml<CR>

" XML macros -----------------------------------------------------------
" insert XML declaration
map <leader>gxd ggO<?xml version="1.0"?><ESC>:set ft=xml<CR>
