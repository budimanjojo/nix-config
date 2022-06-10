syn clear gitcommitSummary
syn match gitcommitSummary "^.\{0,72}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
