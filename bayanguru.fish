set bgu bayanguru
set dbgu "engrave, play, and publish bayan sheet music"
complete -c $bgu -d $dbgu --no-files

set eng engrave
set deng "engrave pieces and books"
complete -c $bgu -a $eng -d $deng

set ply play
set dply "play pieces from a catalog or a book"
complete -c $bgu -a $ply -d $dply

set pub publish
set dpub "publish pieces on the web"
complete -c $bgu -a $pub -d $dpub
