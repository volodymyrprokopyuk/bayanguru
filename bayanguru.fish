set bgu bayanguru
set dbgu "Engrave, play, and publish bayan sheet music"
complete -c $bgu -d $dbgu --no-files

set dhlp "show help"
set dvrs "print the version"
complete -c $bgu -l help -d $dhlp -o h -d $dhlp
complete -c $bgu -l version -d $dvrs -o v -d $dvrs

set eng engrave
set deng "engrave pieces and books"
set dcat "read catalog files <catalog>"
set dboo "engrave books (false)"
set dpie "engrave individual pieces from books (false)"
set dini "initialize a new piece (false)"
set dlnt "lint pieces before engraving (false)"
set dopt "optimize PDF after engraving (false)"
set dmta "include piece meta information (true)"
complete -c $bgu -a $eng -d $deng
complete -c $bgu -a $eng -l catalog -s c -d $dcat -r
complete -c $bgu -a $eng -l book -s b -d $dboo
complete -c $bgu -a $eng -l piece -s p -d $dpie
complete -c $bgu -a $eng -l init -s i -d $dini
complete -c $bgu -a $eng -l lint -s l -d $dlnt
complete -c $bgu -a $eng -l optimize -s o -d $dopt
complete -c $bgu -a $eng -l meta -d $dmta

set ply play
set dply "play pieces from a catalog or a book"
complete -c $bgu -a $ply -d $dply

set pub publish
set dpub "publish pieces on the web"
complete -c $bgu -a $pub -d $dpub
