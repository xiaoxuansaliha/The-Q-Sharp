// Formal 2020 Question A2: Distinguish I, CNOTs and SWAP
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation ApplyAndMeasure(unitary : (Qubit[] => Unit is Adj+Ctl), qs: Qubit[]): Int {
        // input is 01, apply unitary
        unitary(qs);

        if(M(qs[1]) == Zero){ // SWAP
            return 3;
        }elif(M(qs[0]) == One){ // CNOT21
            return 2;
        }else{
            X(qs[0]); // set the bits to 11
            unitary(qs);

            if(M(qs[1]) == One){
                return 0; // I
            }else{
                return 1; //CNOT12
            }
        }
    }

    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        // brute force solution
        using(qs = Qubit[2]){

            // prepare a 01 array
            X(qs[1]);

            let ans = ApplyAndMeasure(unitary, qs);
            if(ans == 0 or ans == 2){
                X(qs[0]); // reset the bits to 0
                X(qs[1]);
            }else{
                X(qs[0]);
            }
            return ans;
        }
    }

}