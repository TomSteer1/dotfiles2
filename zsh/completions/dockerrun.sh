if ! command -v dr >/dev/null 2>&1
then
	exit 0
fi


# bash completion for dockerrun.sh
_dockerrun_completions() {
    local cur prev opts images
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Flags
    opts="--help --rebuild --list --mount"

    # If the previous word is --mount, suggest directories
    if [[ "$prev" == "--mount" ]]; then
        COMPREPLY=( $(compgen -d -- "$cur") )
        return 0
    fi

    # If no image yet (first non-flag argument), suggest available docker images
    # (directories inside ~/scripts/dockerfiles)
    if [[ ! " ${COMP_WORDS[*]} " =~ " --list " ]]; then
        # collect list of images
				images=$(compgen -W "$(dr --list | tail -n +2 | awk '{print $1}')" -- "$cur")
    fi

    # Add flags + images
    COMPREPLY=( $(compgen -W "${opts} ${images}" -- "$cur") )
    return 0
}

# Register completion
complete -F _dockerrun_completions dockerrun dr

