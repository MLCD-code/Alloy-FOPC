fof(soc, axiom, (![X]: (is_socrates(X) => philosopher(X)))).
fof(pla, axiom, (![X]: (is_plato(X) => philosopher(X)))).
fof(hum, axiom, (![X]: (is_hume(X) => philosopher(X)))).
fof(philosophers_exist,axiom,(?[X]:(philosopher(X)))).
