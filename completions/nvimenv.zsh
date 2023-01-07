if [[ ! -o interactive ]]; then
    return
fi

compctl -K _nvimenv nvimenv

_nvimenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(nvimenv commands)"
  else
    completions="$(nvimenv completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}
