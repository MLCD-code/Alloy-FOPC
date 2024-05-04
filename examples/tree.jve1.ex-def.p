/* Definition of example */
fof(example1, definition,
  (example <=> ?[X, Y, Z, W, V] :
               (root(X) & a(Y) & b(Z) & c(W) & d(V)
                & pc(X,Y) & pc(X,Z) & pc(Z,W) & pc(W,V)))).
