alias rebuild="rm -rf build/; mkdir build; cd build; cmake -DBUILD_TESTS:BOOL=FALSE -DBUILD_PAYLOAD:STRING=NO_PAYLOAD ..;"

alias ve="source virtualenv/bin/activate > /dev/null 2>&1; source env/bin/activate > /dev/null 2>&1"
alias dsve="cd /var/dataserver; ve; cd dataserver;"

mkcd() { mkdir $1 && cd $1; }

# first arg is frequency, second is seconds
# e.g. "alarm 1000 1"
alarm() {
	( \speaker-test -f $1 -t sine > /dev/null 2>&1)&
	pid=$!
	\sleep ${2}s
	\kill -9 $pid
}

alias vims="vim -S .s"
alias 🌏="vim"

# CHRISTMAS TREE
alias christmas-tree="perl -MAcme::POE::Tree -e 'Acme::POE::Tree->new()->run()'"
