#!/usr/bin/env bash

function check_dependency() {
    if ! (builtin command -V "$1" >/dev/null 2>&1); then
        echo "Missing dependency: can't find $1" 1>&2
        exit 1
    fi
}

function process_line() {
  # echo "Accessing line: $*, total $#"
  if [[ "$1" == "#" ]]; then
    return
    # echo "Comment: $*"
  # elif [[ "$1" == "DUPTYPE_FIRST_OCCURRENCE" ]]; then
  #   echo "FIRST OCCURRENCE: ${@:8}"
  else
    file="${@:8}"
    echo "Deleting: $file"
    trash "$file"
  fi
}

function process_file() {
  while IFS='' read -r LineFromFile || [[ -n "${LineFromFile}" ]]; do
    process_line ${LineFromFile}
  done < "$1"
}
       
check_dependency awk
check_dependency trash

# Look for command line flags.
while [ $# -gt 0 ]; do
    case "$1" in
    -*)
        error "Unknown option flag: $1"
        exit 1
        ;;
    *)
        if [ -r "$1" ]; then
            has_stdin=f
            # print_image "$1" 1 "$(b64_encode <"$1")" "$print_filename"
            # file="$1"
            process_file $1
        else
            error "$1: No such file or directory"
            exit 2
        fi
        ;;
    esac
    shift
done

exit 0
