set cmd bayanguru
set descBayanguru "Engrave, play and publish bayan sheet music"

complete -c $cmd -f -d $descBayanguru

set descHelp "show help"
set descVersion "print the version"

complete -c $cmd -l help -d $descHelp -s h -d $descHelp
complete -c $cmd -l version -d $descVersion -s v -d $descVersion

complete -c $cmd -a engrave -d "eng desc"
complete -c $cmd -a play -d "play desc"
complete -c $cmd -a publish -d "publish desc"
