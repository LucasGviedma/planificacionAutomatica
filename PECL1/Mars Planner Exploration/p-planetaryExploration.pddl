(define (problem p-robotPlanningMotion) 

    (:domain d-robotPlanningMotion)
    (:objects 
        room1 room2 room3 room4 corridor1 - room
        box1 box2 - box
    )

    (:init
        (SHAKEY_FLOOR)
        (SHAKEY_IN room1)
        (IN room1 box1)
        (IN room1 box2)
        (DOOR room1 corridor1)
        (DOOR room2 corridor1)
        (DOOR room3 corridor1)
        (DOOR room4 corridor1)
    )

    (:goal (and (LIGHT room1)
                (LIGHT room2)
                (LIGHT room3)
                (LIGHT room4)
    ))

)
