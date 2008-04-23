" Licencing macros ----------------------------------------------------------
let rhs= maparg("gl","")
if rhs != "" | silent unmap gl | endif

" Creative Commons by-nc-sa 2.5
"-------------------------------
" HTML
map glch o<!--Creative Commons License--><a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/2.5/"><img alt="Creative Commons License" border="0" src="http://creativecommons.org/images/public/somerights20.png"/></a><br/>This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/2.5/">Creative Commons Attribution-NonCommercial-ShareAlike2.5 License</a>.<!--/Creative Commons License--><!-- <rdf:RDF xmlns="http://web.resource.org/cc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><CR><Work rdf:about=""><CR><license rdf:resource="http://creativecommons.org/licenses/by-nc-sa/2.5/" /><CR><dc:creator><Agent><dc:title>Dave Ingram</dc:title></Agent></dc:creator><CR><dc:rights><Agent><dc:title>Dave Ingram</dc:title></Agent></dc:rights><CR></Work><CR><License rdf:about="http://creativecommons.org/licenses/by-nc-sa/2.5/"><permits rdf:resource="http://web.resource.org/cc/Reproduction"/><permits rdf:resource="http://web.resource.org/cc/Distribution"/><requires rdf:resource="http://web.resource.org/cc/Notice"/><requires rdf:resource="http://web.resource.org/cc/Attribution"/><prohibits rdf:resource="http://web.resource.org/cc/CommercialUse"/><permits rdf:resource="http://web.resource.org/cc/DerivativeWorks"/><requires rdf:resource="http://web.resource.org/cc/ShareAlike"/></License></rdf:RDF> --><ESC>

" Perl-style code
map glcs ggo################################################################################<CR># This program is released under a Creative Commons<CR># Attribution-NonCommerical-ShareAlike2.5 License.<CR>#<CR># For more information, please see<CR>#   http://creativecommons.org/licenses/by-nc-sa/2.5/<CR># <CR># You are free:<CR># <CR># * to copy, distribute, display, and perform the work<CR># * to make derivative works<CR># <CR># Under the following conditions:<CR>#   Attribution:   You must attribute the work in the manner specified by the<CR>#                  author or licensor.<CR>#   Noncommercial: You may not use this work for commercial purposes.<CR>#   Share Alike:   If you alter, transform, or build upon this work, you may<CR>#                  distribute the resulting work only under a license identical<CR>#                  to this one.<CR># <CR># * For any reuse or distribution, you must make clear to others the license<CR>#   terms of this work.<CR># * Any of these conditions can be waived if you get permission from the<CR>#   copyright holder.<CR># <CR># Your fair use and other rights are in no way affected by the above.<CR>################################################################################<ESC>


" Text
map glct ggO################################################################################<CR>This program is released under a Creative Commons<CR>Attribution-NonCommerical-ShareAlike2.5 License.<CR><CR>For more information, please see<CR>  http://creativecommons.org/licenses/by-nc-sa/2.5/<CR><CR>You are free:<CR><CR>* to copy, distribute, display, and perform the work<CR>* to make derivative works<CR><CR>Under the following conditions:<CR>  Attribution:   You must attribute the work in the manner specified by the<CR>                 author or licensor.<CR>  Noncommercial: You may not use this work for commercial purposes.<CR>  Share Alike:   If you alter, transform, or build upon this work, you may<CR>                 distribute the resulting work only under a license identical<CR>                 to this one.<CR><CR>* For any reuse or distribution, you must make clear to others the license<CR>  terms of this work.<CR>* Any of these conditions can be waived if you get permission from the<CR>  copyright holder.<CR><CR>Your fair use and other rights are in no way affected by the above.<CR>################################################################################<ESC>

" GPL
"-----
" C-style code
map glgc ggO/*<CR>Copyright (C) <ESC>"=strftime("%Y")<CR>pa David Ingram<CR><CR>This program is free software; you can redistribute it and/or<CR>modify it under the terms of the GNU General Public License<CR>as published by the Free Software Foundation; either version 2<CR>of the License, or (at your option) any later version.<CR><CR>This program is distributed in the hope that it will be useful,<CR>but WITHOUT ANY WARRANTY; without even the implied warranty of<CR>MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<CR>GNU General Public License for more details.<CR><CR>You should have received a copy of the GNU General Public License<CR>along with this program; if not, write to the Free Software<CR>Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.<CR>/<ESC>

" Perl-style code
"map glgs
" Text
"map glgt
