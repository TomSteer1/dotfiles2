_dockerrun_script()
{
  _script_commands=$(dr list | tail -n +2)

  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

  return 0
}
complete -F _dockerrun_script dr
