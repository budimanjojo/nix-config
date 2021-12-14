if type -q exa
  function ls --wraps exa --description 'alias ls=exa'
    exa $argv
  end
end
