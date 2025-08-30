" copy/symlink to $HOME/.vim/syntax/dew.vim
if exists("b:current_syntax")
  finish
endif

colorscheme evening

" Define keystone characters at start of line
syn match todoInbox "^?"
syn match todoSomeday "^&"
syn match todoScheduled "^\$"
syn match todoWaiting "^%"
syn match todoMachineComment "^:.*"


" Define lines
syn match todoActiveLine "^>.*$" contains=todoDate,todoContext, todoRepeat
syn match todoScheduledLine "^\$.*" contains=todoScheduled,todoDate,todoContext, todoRepeat
syn match todoHeaderLine "^#.*"
syn match todoDoneLine "^\~.*"

" Highlight dates/repeats in workable (active) items only
syn match todoDate "\d\{4\}-\d\{2\}-\d\{2\}" contained
syn match todoRepeat /\v\{(([,\-/*0-9]+ ){2}[L#,\-/*0-9]+|[0-9]+)\}/ contained

" Context tags (@context)
syn match todoContext "@\w\+" contained

" Lint warnings (:!WORD)
syn match todoLint ":!.*" 

" Define highlight groups
hi def link todoInbox Special
hi def link todoSomeday Identifier  
hi def link todoHeaderLine Title
hi def link todoDoneLine Comment
hi def link todoActiveLine Keyword
hi def link todoScheduled Constant
hi def link todoWaiting Type
hi def link todoMachineComment Preproc
hi def link todoDate Number
hi def link todoRepeat Number
hi def link todoContext Tag
hi def link todoLint Error

let b:current_syntax = "dew"