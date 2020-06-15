// Successful! My first quantum program is running smoothly :P
namespace Basic {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    // StateFlop operation. Copied from Kata and modified by me
    operation StateFlip (q : Qubit) : Int {
        X(q);

        let res = M(q);
        if(res == Zero){
            return 0;
        }else{
            return 1;
        }
    }

    // My plan: Flip a 0 bit and a 1 bit, print out the results
    @EntryPoint()
    operation HelloQ() : Unit {

        using (q = Qubit())  {

            // input 0 bit and see the result
            mutable res = StateFlip(q);
            Message($"The result should be 1: {res}");

            // input 1 and see the result
            set res = StateFlip(q);
            Message($"The result should be 0: {res}");

        }
    }
}