/* Signature Object */
fof(sigo1, axiom,
   ( ! [X] : (object(X) | auto(X)))).
fof(sigo2, axiom,
   (~ ? [X] : (object(X) & auto(X)))).

/* Signatures root, a, b, c, d */
fof(sigr1, axiom, (?[X] : root(X))).
fof(sigr2, axiom, 
    ( ! [X] : (root(X) => (object(X) & ( ! [Y] : (root(Y) => (X = Y)))))) ).
fof(siga1, axiom, (?[X] : a(X))).
fof(siga2, axiom, 
    ( ! [X] : (a(X) => (object(X) & ( ! [Y] : (a(Y) => (X = Y)))))) ).
fof(sigb1, axiom, (?[X] : b(X))).
fof(sigb2, axiom, 
    ( ! [X] : (b(X) => (object(X) & ( ! [Y] : (b(Y) => (X = Y)))))) ).
fof(sigc1, axiom, (?[X] : c(X))).
fof(sigc2, axiom, 
    ( ! [X] : (c(X) => (object(X) & ( ! [Y] : (c(Y) => (X = Y)))))) ).
fof(sigd1, axiom, (?[X] : d(X))).
fof(sigd2, axiom, 
    ( ! [X] : (d(X) => (object(X) & ( ! [Y] : (d(Y) => (X = Y)))))) ).

/* Root, A-D partition Object */
fof(sigosubs, axiom,
    ( ! [X] : ( object(X) =>
              ( (root(X) | a(X) | b(X) | c(X) | d(X))
                & ~(root(X) & a(X))
                & ~(root(X) & b(X))
                & ~(root(X) & c(X))
                & ~(root(X) & d(X))
                & ~(a(X) & b(X))
                & ~(a(X) & c(X))
                & ~(a(X) & d(X))
                & ~(b(X) & c(X))
                & ~(b(X) & d(X))
                & ~(c(X) & d(X)))))).

/* fact OneRoot */
fof(oneroot, axiom,
   (![X]: (root(X) <=> (~?[Y]: (pc(Y,X)))))).

/* definition of tcpc (^b) */
fof(deftcpc, axiom,
   (![X, Y]: (tcpc(X, Y) <=> ((pc(X, Y))|(?[Z]:(pc(X, Z) & tcpc(Z, Y))))))).

/* fact b_acyclic */
fof(b_acyclic, axiom,
  (~?[X, Y]:(tcpc(X,Y) & (X = Y)))).

/* fact 3 (nameless) */
fof(fact3, axiom,
   (![X,Y,Z] : ((b(X) & c(Y) & d(Z)) => (pc(X, Y) & pc(Y, Z))))).

/* Definition of example */
fof(example1, definition,
  (example <=> ?[X, Y, Z, W, V] :
               (root(X) & a(Y) & b(Z) & c(W) & d(V)
                & pc(X,Y) & pc(X,Z) & pc(Z,W) & pc(W,V)))).

/* fof(example1b, definition,
    (![X, Y, Z, W, V]:
     (example(X, Y, Z, W, V)
     <=> 
     (root(X) & a(Y) & b(Z) & c(W) & d(V)
      & pc(X,Y) & pc(X,Z) & pc(Z,W) & pc(W,V))))).
*/
fof(ex1nogo, hypothesis, example).
