(define  (problem p-pizzeria)
    (:domain d-pizzeria)

    (:objects dish1 - dish
              dough1 - dough
              destino1 destino2 - destination
              motorcycle1 motorcycle2 - motorcycle
    )

    (:init
        (READY motorcycle1) (READY motorcycle2)
    )

    (:goal
        (and (DELIVERED dish1 destino1) (DELIVERED dough1 destino2) (READY motorcycle1))
    )

    
    
    
    


)