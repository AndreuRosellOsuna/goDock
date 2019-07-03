#/usr/bin/env bash

# Script cr��e � partir du tuto https://iridakos.com/tutorials/2018/03/01/bash-programmable-completion-tutorial.html
# Instaler ce fichier sur le r�pertoire /etc/bash_completion.d/
# ajouter la ligne suivante dans le fichier ~/.profile ou ~/.bashrc : export PATH="$PATH:/path/to/dir"

_goDock_completions()
{
  # COMP_WORDS : array avec les arguments saisis

  # Si au moins un argument est d�j� saisi, on ne rend pas l'autocomplete
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  SAISIE="COMP_WORDS[1]"

  #REPERTOIRE=$(ls -c)
  REPERTOIRE=$(docker ps --format {{.Names}})

  # COMPREPLY est la variable o� stocker les option d'autocomplete
  COMPREPLY=($(compgen -W "$REPERTOIRE" "${COMP_WORDS[1]}"))
}

complete -F _goDock_completions goDock
