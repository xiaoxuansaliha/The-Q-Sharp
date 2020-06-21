// Formal 2020 Question A3: Distinguish H from X
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation ApplyAndMeasure(unitary : (Qubit => Unit is Adj+Ctl), q: Qubit): Int {
        unitary(q);
        Z(q);
        unitary(q);
        let res = M(q);
        if (res == One){
            return 1;
        }else{
            return 0;
        }
    }

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit())  {

            // prepare a 1 bit
            X(q);

            let res = ApplyAndMeasure(unitary, q);

            if(res == 1){ // X gate
                X(q);
                return 1;
            }else{ // H gate
                return 0;
            }
        }
    }
}