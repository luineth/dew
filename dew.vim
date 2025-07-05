autocmd BufRead,BufNewFile *.dew set filetype=dew

syntax match comment /^\s*;.*$/
syntax match context /@\w\+/
syntax match deadline /\v<d\d{4}-\d{2}-\d{2}>/
syntax match done /^\s*x\s\+.*$/
syntax match inbox /^\s*?.*$/
syntax match lint /^\s*!.*$/
syntax match nextInactive /^\s*#/
syntax match nextActive /^\s*>\s\+.*$/
syntax match outcome /^\s\+o\s\+/
syntax match projectActive /^\s*P\s\+.*$/
syntax match projectInactive /^\s*p\s\+/
syntax match reminderActive /\v<R\d{4}-\d{2}-\d{2}>/
syntax match reminderInactive /\v<r\d{4}-\d{2}-\d{2}>/
syntax match scheduleActive /\v<S\d{4}-\d{2}-\d{2}>/
syntax match scheduleInactive /\v<s\d{4}-\d{2}-\d{2}>/
syntax match waitingOn /%\w\+/

hi def link context Special
hi def link deadline Constant
hi def link done Type
hi def link inbox Todo
hi def link lint Todo
hi def link nextActive Conditional
hi def link nextInactive Conditional
hi def link outcome Conditional
hi def link projectActive Conditional
hi def link projectInactive Conditional
hi def link reminderActive Todo
hi def link reminderInactive Constant
hi def link scheduleActive Todo
hi def link scheduleInactive Constant
hi def link waitingOn Preproc