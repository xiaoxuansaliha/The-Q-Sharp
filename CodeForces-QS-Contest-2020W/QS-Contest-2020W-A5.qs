// Warm-Up 2020 Question A5: Distinguish Z from -Z
// idea from the Editorial Solutions, accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using(qs = Qubit[2]){
            // prepare a +0 array
            H(qs[0]);
            Controlled unitary(qs[0..0], qs[1]);
            H(qs[0]);
            let ans = M(qs[0]);
            if(ans == Zero){
                return 0;
            }else{
                X(qs[0]);
                return 1;
            }
        }
    }
}