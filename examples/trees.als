/* a really simple example of defining trees */
sig N {
  par: lone N
}{
  this not in this.^(@par)
}

fact one_root { one node: N | no par[node] }

pred show {}
run show for 3
