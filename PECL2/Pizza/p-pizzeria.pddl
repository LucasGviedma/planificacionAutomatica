(define  (problem p-pizzeria)
    (:domain d-pizzeria)

    (:objects dish1 - dish
              dough1 - dough
              destino1 destino2 pizzeria - location
              motorcycle1 motorcycle2 - motorcycle
    )

    (:init
        (IN motorcycle1 pizzeria) (IN motorcycle2 pizzeria) (PIZZERIA pizzeria)
    )

    (:goal
        (and (DELIVERED dish1 destino1) (DELIVERED dough1 destino2) (IN motorcycle1 pizzeria))
    )

)