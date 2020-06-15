// Warm-Up 2020 Question 3: Distinguish Z from S
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    // output: 0 means +, 1 means -
    operation PlusOrMinus(q: Qubit): Int{
        H(q);
        let res = M(q);
        if(res == Zero){
            return 0;
        }else{
            return 1;
        }
    }

    // output: 0 means Z, 1 means S
    operation ApplyAndMeasure(unitary : (Qubit => Unit is Adj+Ctl), q: Qubit): Int {
        unitary(q);
        unitary(q);
        return PlusOrMinus(q);
    }

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit())  {

            // input a + bit into the ApplyAndMeasure Operation
            H(q);
            let res = ApplyAndMeasure(unitary, q);

            if(res == 1){
                X(q);
                return 1;
            }else{
                return 0;
            }
        }
    }
}