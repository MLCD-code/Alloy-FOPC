% conjecture SingleParent
tff(singleparent, conjecture,
    ![X : object, Y : object, Z : object]:
        ((p(X, Y) & p(X, Z))
         =>
         (Y = Z))).
