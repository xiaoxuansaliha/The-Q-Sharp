// Warm-Up 2020 Question 2: Distinguish I from Z
// Accepted

namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation ApplyAndMeasure(unitary : (Qubit => Unit is Adj+Ctl), q: Qubit): Int {
        unitary(q);
        H(q);
        let res = M(q);
        if (res == One){
            return 1;
        }else{
            return 0;
        }
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
