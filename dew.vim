if exists("b:current_syntax")
  finish
endif

syntax case ignore

" Machine comments 
syntax match TodoMachineComment /^:.*$/
syntax match TodoWarning /WARN/
syntax match TodoError /ERR/

" Human comments 
syntax match TodoHumanComment /^;.*$/

" Projects 
syntax match TodoProject /^p\s/

" Next Actions
syntax match TodoNextAction /^\s*[>#]\s/

" Outcomes
syntax match TodoOutcome /^\s*o\s/

" Waiting-on tags
syntax match TodoWaitingOn /%[a-zA-Z0-9_]\+/

" Start dates: >YYYY-MM-DD
syntax match TodoStartDate />\d\{4}-\d\{2}-\d\{2}/

" Due dates: !YYYY-MM-DD
syntax match TodoDueDate /!\d\{4}-\d\{2}-\d\{2}/

" Reminder dates: ^YYYY-MM-DD
syntax match TodoReminderDate /\^\d\{4}-\d\{2}-\d\{2}/

" Someday/Maybe
syntax match TodoSomeday /^&/

" Context tags: @word
syntax match TodoContext /@[a-zA-Z0-9_]\+/

" Set highlight groups
highlight link TodoMachineComment Comment
highlight link TodoHumanComment Comment
highlight link TodoProject Identifier
highlight link TodoNextAction Statement
highlight link TodoOutcome Type
highlight link TodoWaitingOn Constant
highlight link TodoStartDate PreProc
highlight link TodoDueDate PreProc
highlight link TodoReminderDate PreProc
highlight link TodoSomeday Underlined
highlight link TodoContext Special
highlight link TodoWarning WarningMsg
highlight link TodoError ErrorMsg

let b:current_syntax = "dew"

