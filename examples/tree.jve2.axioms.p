% Everything is an Object or automatically supplied by Alloy.
% Nothing is both.
fof(top_signatures_1, axiom,
    ![X]: (object(X) | auto(X))).
fof(top_signatures_disjoint, axiom, 
    ~(?[X]: (object(X) & auto(X)))).

% Subsignatures Root, A, B, C, D have one instance each.
fof(sig_root_extends_object, axiom, 
    ![X]: (root(X) => object(X))).
fof(sig_root_min1, axiom, ?[X]: (root(X))).
fof(sig_root_max1, axiom, 
    ![X]: (root(X) => ![Y]: (root(Y) => X = Y))).

fof(sig_a_extends_object, axiom,
    ![X]: (a(X) => object(X))).
fof(sig_a_min1, axiom, ?[X]: (a(X))).
fof(sig_a_max1, axiom,
    ![X]: (a(X) => ![Y]: (a(Y) => X = Y))).

fof(sig_b_extends_object, axiom,
    ![X]: (b(X) => object(X))).
fof(sig_b_min1, axiom, ?[X]: (b(X))).
fof(sig_b_max1, axiom,
    ![X]: (b(X) => ![Y]: (b(Y) => X = Y))).

fof(sig_c_extends_object, axiom,
    ![X]: (c(X) => object(X))).
fof(sig_c_min1, axiom, ?[X]: (c(X))).
fof(sig_c_max1, axiom,
    ![X]: (c(X) => ![Y]: (c(Y) => X = Y))).

fof(sig_d_extends_object, axiom,
    ![X]: (d(X) => object(X))).
fof(sig_d_min1, axiom, ?[X]: (d(X))).
fof(sig_d_max1, axiom,
    ![X]: (d(X) => ![Y]: (d(Y) => X = Y))).

%  The subsignatures partition the set of objects.
fof(subsigs_of_object, axiom, 
    ![X]: (object(X) =>
            ((root(X) | a(X) | b(X) | c(X) | d(X))
             & ~(root(X) & a(X))
             & ~(root(X) & b(X))
             & ~(root(X) & c(X))
             & ~(root(X) & d(X))
             & ~(a(X) & b(X))
             & ~(a(X) & c(X))
             & ~(a(X) & d(X))
             & ~(b(X) & c(X))
             & ~(b(X) & d(X))
             & ~(c(X) & d(X))))).

% p takes objects as arguments
fof(p_types, axiom, 
    ![X, Y]: (p(X, Y) => (object(X) & object(Y)))).

% p is functional
fof(p_functional, axiom,
    ![X, Y]: (p(X, Y) => ![Z]: (p(X, Z) => (Z = Y)))).

% definition of root-ness
fof(oneroot, axiom, 
    ![X]: (object(X) => (root(X) <=> ~?[Y]: (p(X, Y))))).

% TCP is the transitive closure of p.
fof(tcp_def, definition,
    ![X, Y]: (tcp(X, Y) 
              <=> 
              (p(X,Y) | ?[Z]: (p(X,Z) & tcp(Z,Y))))).

% iden is the identity relation.
fof(iden_def, definition, 
    ![X, Y]: (iden(X, Y) <=> X = Y)).

% tcp_and_iden is the intersection of tcp and iden.
fof(tcp_and_iden_def, definition,
    ![X, Y]: (tcp_inter_iden(X, Y) 
              <=>
              (tcp(X, Y) & iden(X, Y)))).

% The set tcp_and_iden is empty.
fof(p_acyclic, axiom,
    ~?[X, Y]: (tcp_and_iden(X, Y))).

% B is the parent of both C and D
fof(fact_4, axiom,
    (![X]: (c(X) => ?[Y]: (b(Y) & p(X, Y)))
   & ![X]: (d(X) => ?[Y]: (b(Y) & p(X, Y))))).
