" LaTeX macros ----------------------------------------------------------
let rhs= maparg("gt","")
if rhs != "" | silent unmap gt | endif

map gth ggO\documentclass[a4paper,10pt]{article}<CR>\usepackage[margin=2cm]{geometry}<CR>%%%%%%%%%%%%%%%%%%%%%%%%%<CR>\begin{document}<ESC>:set ft=tex<CR>Go\end{document}<ESC>ki
