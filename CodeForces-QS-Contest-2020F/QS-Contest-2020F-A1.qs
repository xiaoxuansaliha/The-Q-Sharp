// Formal 2020 Question A1: Figure out direction of CNOT
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation ApplyAndMeasure(unitary : (Qubit[] => Unit is Adj+Ctl), qs: Qubit[]): Int {
        unitary(qs);
        if(M(qs[0]) == Zero){
            return 0;
        }else{
            return 1;
        }
    }

    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using(qs = Qubit[2]){

            // prepare a 01 array
            X(qs[1]);
            let ans = ApplyAndMeasure(unitary, qs);
            if(ans == 1){
                X(qs[0]); // reset the bits to 0
                X(qs[1]);
            }else{
                X(qs[1]);
            }
            return ans;
        }
    }
}