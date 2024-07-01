" Vim syntax file
" Language: tpmd

if exists("b:current_syntax")
  finish
endif

syn match tpmdTitle "^#\{1,6\}\s\?.\+$"

syn match tpmdKeyword "`GET`"
syn match tpmdKeyword "`POST`"
syn match tpmdKeyword "`HEAD`"
syn match tpmdKeyword "`PUT`"
syn match tpmdKeyword "`DELETE`"
syn match tpmdKeyword "`CONNECT`"
syn match tpmdKeyword "`OPTIONS`"
syn match tpmdKeyword "`TRACE`"
syn match tpmdKeyword "`PATCH`"

hi def link tpmdTitle Title
hi def link tpmdKeyword Keyword

syn region tpmdCodeBlock start="^\s*```\s*$" end="^\s*```\s*$" contains=tpmdKey keepend fold

syn match tpmdKey /\v(\w|\[|\]|\{|\}|'|")*\ze\s*(\=|:|\/\/)/   nextgroup=tpmdAssignOp,tpmdCommentTag contained oneline
syn match tpmdAssignOp /\v(\=\=|\=|:)/                         nextgroup=tpmdValue  contained oneline
syn match tpmdValue /[a-zA-Z0-9_'" ]\+/                        nextgroup=tpmdCommentTag contained oneline
syn match tpmdCommentTag "//"                                  nextgroup=tpmdMandatoryTag,tpmdType contained oneline
syn match tpmdMandatoryTag /\s*\*\?/                           nextgroup=tpmdGroupTag contained oneline
syn match tpmdGroupTag /\v(\~|[0-9]+)?/                        nextgroup=tpmdGroupDuty contained oneline
syn match tpmdGroupDuty /[+-]\?/                               nextgroup=tpmdType contained oneline
syn match tpmdType /\v\s+(str|int)\s+/ contained oneline

hi def link tpmdCodeBlock    Comment
hi def link tpmdKey          NONE
hi def link tpmdAssignOp     Operator
hi def link tpmdValue        None
hi def link tpmdCommentTag   Comment
hi def link tpmdMandatoryTag Identifier
hi def link tpmdGroupTag     Constant
hi def link tpmdGroupDuty    Identifier
hi def link tpmdType         Type

syn match tpmdRespondName /\v^\s*- `.+`/
hi def link tpmdRespondName Title

let b:current_syntax = "tpmd"
