#!/usr/bin/env zsh

STAFF="^ +<?[cdefegab](?:is|es)?[,']*"

echo '** Missing first note octave check (FNOC)'
rg $STAFF $@ | rg -v '[+@=]'

echo '** Missing end line bar check (ELBC)'
rg $STAFF $@ | rg -v '\bar "|."$' | rg '[^|{}<>]$'
