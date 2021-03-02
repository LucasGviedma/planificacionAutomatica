(define (problem blocks-world)
    (:domain blocks)
    (:objects block1 block2 block3)
    (:init (handempty)
           (clear block3) (clear block2) (ontable block1) (ontable block2) (on block3 block1))

    (:goal (and (on block1 block2) (on block2 block3)))
 )