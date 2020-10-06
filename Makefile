develop:
	cd ${project} && erlc ${module}.erl && erl --noshell -s ${module} ${method} -s init stop
