(define (problem blocks-world)
    (:domain blocks)
    (:objects C D E F B I J A N O K M P H G L Q - block)
    (:init (handempty)
    
           (clear A) (clear B) (clear C) (clear D) (clear E) (clear F)
           (clear G) (clear H) (clear I) (clear J) (clear K) (clear L)
           (clear M) (clear N) (clear O) (clear P) (clear Q)
           
           (ontable A) (ontable B) (ontable C) (ontable D) (ontable E) (ontable F)
           (ontable G) (ontable H) (ontable I) (ontable J) (ontable K) (ontable L)
           (ontable M) (ontable N) (ontable O) (ontable P) (ontable Q))

    (:goal (and (on Q N) (on N L) (on L O) (on O J) (on J H) (on H C) (on C E)
     (on E M) (on M P) (on P A) (on A G) (on G B) (on B I) (on I K)
     (on K F) (on F D)))
 )