% conjecture SingleParent
fof(singleparent, conjecture,
    ![X, Y, Z]: ((object(X) & object(Y) & object(Z))
      => ((p(X, Y) & p(X, Z))
          =>
          (Y = Z)))).
