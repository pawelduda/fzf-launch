#/bin/bash

function fzf-launch {
  while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -f|--cmd)
        local CMD="$2"
        ;;
      -t|--filetype)
        local FILETYPE="$2"
        ;;
    esac
    shift
  done

  $CMD \
    $( \
      rg \
        ~/ \
        --files | \
          fzf \
            -m \
            -q ".$FILETYPE\$ " \
            --extended \
            --cycle \
            --prompt='Open file' \
            --history='.fzf-launch-history'
    )
}
