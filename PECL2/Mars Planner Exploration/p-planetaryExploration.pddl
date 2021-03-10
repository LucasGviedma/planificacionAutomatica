(define (problem p-planetaryExploration) 

    (:domain d-planetaryExploration)
    (:objects 
        cord1 cord2 cord3 cord4 cord5
    )

    (:init
        (IN cord1)
    )

    (:goal (and (COMMUNICATION cord3)
                (ANALYSIS cord4)
                (COMMUNICATION cord2)
                (DRILL cord1)
    ))

)
