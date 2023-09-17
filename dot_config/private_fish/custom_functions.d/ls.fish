if type -q eza
  function ls --wraps eza --description 'alias ls=eza'
    eza $argv
  end
end
