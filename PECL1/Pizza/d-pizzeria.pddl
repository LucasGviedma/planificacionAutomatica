(define  (domain d-pizzeria)
    (:requirements :strips :typing
     :negative-preconditions :disjunctive-preconditions)

    (:types
        dough motorcycle dish destination
    )

    (:predicates
        
        (KNEADED ?d - dough)
        (ADDED_T ?d - dough)
        (BAKED   ?d - dough)
        (COOKED  ?d - dish)

        (PREPARED  ?d - (either dish dough))

        (READY  ?m - motorcycle)
        (FULL   ?m - motorcycle)
        (LOADED ?m - motorcycle ?d - (either dish dough))

        (IN ?m - motorcycle ?d - destination)
        (DELIVERED ?d - (either dish dough) ?des - destination)
        (COLLECTED ?d - (either dish dough) ?des - destination)
    )

    (:action kneadDough
        
        :parameters (?d - dough)

        :precondition (and (not (KNEADED ?d)))

        :effect (and (KNEADED ?d))
    )

    (:action addToping
        
        :parameters (?d - dough)

        :precondition (and (KNEADED ?d) (not (ADDED_T ?d)))

        :effect (and (ADDED_T ?d))
    )
    
    (:action bakeDough
        
        :parameters (?d - dough)

        :precondition (and (KNEADED ?d) (ADDED_T ?d) (not (BAKED ?d)))

        :effect (and (BAKED ?d) (PREPARED ?d))
    )

    (:action cookDish
        
        :parameters (?d - dish)

        :precondition (and (not (COOKED ?d)))

        :effect (and (COOKED ?d) (PREPARED ?d))
    )

    (:action loadDough
        
        :parameters (?m - motorcycle ?d -  dough)

        :precondition (and (not (FULL ?m)) (BAKED ?d) (PREPARED ?d))

        :effect (and (LOADED ?m ?d) (FULL ?m) (not (PREPARED ?d)))
    )

    (:action loadDish
        
        :parameters (?m - motorcycle ?d - dish)

        :precondition (and (not (FULL ?m)) (COOKED ?d) (PREPARED ?d))

        :effect (and (LOADED ?m ?d) (FULL ?m) (not (PREPARED ?d)))
    )

    (:action depart
        
        :parameters (?m - motorcycle ?df - destination)

        :precondition (and (not (IN ?m ?df)) (READY ?m) (FULL ?m))
        
        :effect (and (IN ?m ?df) (not (READY ?m)))
    )

    (:action return
        
        :parameters (?m - motorcycle ?d - destination)

        :precondition (and (IN ?m ?d))

        :effect (and (READY ?m) (not (IN ?m ?d)))
    )

    (:action collectOrder
        
        :parameters (?m - motorcycle ?des - destination ?d - (either dish dough))

        :precondition (and (LOADED ?m ?d) (IN ?m ?des) (not (COLLECTED ?d ?des)) (not (DELIVERED ?d ?des)))

        :effect (and (COLLECTED ?d ?des))
    )

    (:action deliverOrder
        
        :parameters (?m - motorcycle ?des - destination ?d - (either dish dough))

        :precondition (and (LOADED ?m ?d) (IN ?m ?des) (COLLECTED ?d ?des) (not (DELIVERED ?d ?des)))
        
        :effect (and (DELIVERED ?d ?des) (not (FULL ?m)) (not (LOADED ?m ?d)))
    )
    
    
    
    


)