% Everything is an Object or automatically supplied by Alloy.
tff(sig_object, type, object: $tType).

% Nothing is both.
% (No statement necessary; follows automatically.)

% Root, A, B, C, D are subsignatures of Object.
% I.e. the predicates Root, A, B, C, D apply to objects.
% And they have one instance each.
tff(sig_root_extends_object, type,
    root: ( object ) > $o).
tff(sig_root_min1, axiom,
    ?[X : object]: (root(X))).
tff(sig_root_max1, axiom, 
    ![X : object]: (root(X) => ![Y : object]: (root(Y) => X = Y))).

tff(sig_a_extends_object, type,
    a: (object) > $o).
tff(sig_a_min1, axiom,
    ?[X : object]: (a(X))).
tff(sig_a_max1, axiom,
    ![X : object]: (a(X) => ![Y : object]: (a(Y) => X = Y))).

tff(sig_b_extends_object, type,
    b: (object) > $o).
tff(sig_b_min1, axiom,
    ?[X : object]: (b(X))).
tff(sig_b_max1, axiom,
    ![X : object]: (b(X) => ![Y : object]: (b(Y) => X = Y))).

tff(sig_c_extends_object, type,
    c: (object) > $o).
tff(sig_c_min1, axiom,
    ?[X : object]: (c(X))).
tff(sig_c_max1, axiom,
    ![X : object]: (c(X) => ![Y : object]: (c(Y) => X = Y))).

tff(sig_d_extends_object, type,
    d: (object) > $o).
tff(sig_d_min1, axiom,
    ?[X : object]: (d(X))).
tff(sig_d_max1, axiom,
    ![X : object]: (d(X) => ![Y : object]: (d(Y) => X = Y))).

%  The subsignatures partition the set of objects.
tff(subsigs_of_object, axiom, 
    ![X : object]:
            (((root(X) | a(X) | b(X) | c(X) | d(X))
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
tff(p_types, type, p: (object * object) > $o).

% p is functional
tff(p_functional, axiom,
    ![X : object, Y : object]:
    (p(X, Y) => ![Z : object]: (p(X, Z) => (Z = Y)))).

% definition of root-ness
tff(oneroot, axiom, 
    ![X : object]: (root(X) <=> ~?[Y : object]: (p(X, Y)))).

% TCP is the transitive closure of p.
tff(tcp_type, type, tcp : (object * object) > $o).
tff(tcp_def, definition,
    ![X : object, Y : object]:
        (tcp(X, Y) 
        <=> 
        (p(X,Y) | ?[Z : object]: (p(X,Z) & tcp(Z,Y))))).

% iden is the identity relation on objects.
% user-defined predicates cannot be polymorphic.
tff(iden_type, type, iden : (object * object) > $o).
tff(iden_def, definition, 
    ![X : object, Y : object]: (iden(X, Y) <=> X = Y)).

% tcp_and_iden is the intersection of tcp and iden.
tff(tcp_and_iden_type, type,
    tcp_and_iden : (object * object) > $o).
tff(tcp_and_iden_def, definition,
    ![X : object, Y : object]:
        (tcp_and_iden(X, Y) 
        <=>
        (tcp(X, Y) & iden(X, Y)))).

% The set tcp_and_iden is empty.
tff(p_acyclic, axiom,
    ~?[X : object, Y : object]: (tcp_and_iden(X, Y))).

% B is the parent of both C and D
tff(fact_4, axiom,
    (![X : object]: (c(X) => ?[Y : object]: (b(X) & p(X, Y)))
   & ![X : object]: (d(X) => ?[Y : object]: (b(X) & p(X, Y))))).
