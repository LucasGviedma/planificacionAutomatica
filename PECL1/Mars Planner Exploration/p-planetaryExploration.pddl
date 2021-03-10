(define (problem p-planetaryExploration) 

    (:domain d-planetaryExploration)
    (:objects 
        cord1 cord2 cord3 cord4 cord5 - coord
        rober1 - rober
    )

    (:init
        (IN cord1 rober1)
    )

    (:goal (and (COMMUNICATION cord3 rober1)
                (ANALYSIS cord4 rober1)
                (COMMUNICATION cord2 rober1)
                (DRILL cord1 rober1)
    ))

)
