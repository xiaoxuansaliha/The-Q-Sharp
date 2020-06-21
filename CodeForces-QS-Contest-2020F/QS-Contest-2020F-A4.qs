// Formal 2020 Question A4: Distinguish Rz from R1
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation Solve (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        using(qs = Qubit[2]){
            // prepare a +0 array
            H(qs[0]);
            Controlled unitary(qs[0..0], (-2.0*PI(),qs[1]));
            H(qs[0]);
            let ans = M(qs[0]);
            if(ans == Zero){
                return 1;
            }else{
                X(qs[0]);
                return 0;
            }
        }
    }
}