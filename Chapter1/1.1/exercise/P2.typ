= P1.1.2 

In a conventional 2-by-2 matrix multiplication C=AB, there are eight multiplication. Make a table indicates the order that these multiplications are performed for the _ijk_, _jik_, _kij_, _ikj_, _jki_ and _kji_ matrix multiplication algorithms

$ a_(i k) b_(k j) $
#figure(
  table(
    columns: 7,
    align: center,
    [], [_ijk_], [_jik_], [_kij_], [_ikj_], [_jki_], [_kji_],
    [$a_11b_11$], [1], [1], [1], [1], [1], [1],
    [$a_11b_12$], [3], [5], [2], [2], [5], [3],
    [$a_21b_11$], [5], [3], [3], [5], [2], [2],
    [$a_21b_12$], [7], [7], [4], [6], [6], [4],
    [$a_12b_21$], [2], [2], [5], [3], [3], [5],
    [$a_12b_22$], [4], [6], [6], [4], [7], [7],
    [$a_22b_21$], [6], [4], [7], [7], [4], [6],
    [$a_22b_22$], [8], [8], [8], [8], [8], [8],
  ),
  caption: [Results],
)

