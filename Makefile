# vim: noexpandtab filetype=make

.SUFFIXES: .erl .beam	

.erl.beam:
	erlc -W $<


ERL_OPTION = +P 1048576 +Q 1048576 -noshell -config sys
ERL = erl ${ERL_OPTION}


MODS = lb lb_sup proxy trait config metric

all: compile
	${ERL} -eval "application:ensure_all_started(lb,permanent)"

compile: ${MODS:%=%.beam}

clean:
	rm -rf *.beam erl_crash.dump
