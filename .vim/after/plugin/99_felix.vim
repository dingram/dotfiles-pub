let rhs= maparg("gf","")
if rhs != "" | silent unmap gf | endif

map gfx :g/<C-L>/s/<C-L>//g<CR>:g/&/s/&/\&amp;/g<CR>:2,$g/\"/s/\"/\&quot;/g<CR>:g/[\'`]/s/[\'`]/\&apos;/g<CR>:g/£/s/£/\&pound;/g<CR>:set ft=xml<CR>ggO<?xml version="1.0"?><CR><articles><CR><article><ESC>Go      </paras><CR></article><CR></articles><ESC>gg
map gfh I<headline><ESC>A</headline><ESC>
map gfan O</paras><CR></article><CR><article><ESC>
map gfaa I<author><ESC>A</author><ESC>
map gfab I<abstract><ESC>A</abstract><ESC>
map gfpS O<paras><ESC>
map gfps o<paras><ESC>
map gfpp I<para><ESC>A</para><ESC>
map gfpb I<parab><ESC>A</parab><ESC>
map gfpi I<parai><ESC>A</parai><ESC>
map gfl hs<CR><ESC>
map gfr :%s/&/\&amp;/g<CR>:2,$s/"/\&quot;/g<CR>:%s/['`]/\&apos;/g<CR>:%s/£/\&pound;/g<CR>
