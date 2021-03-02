(define  (domain d-pizzeria)
    (:requirements :strips :typing
     :negative-preconditions :disjunctive-preconditions)

    (:types
        dough topping pizza motorcycle dish destination
    )

    (:predicates
        (KNEADED ?d - dough)
        (ADDED ?t - topping ?d - dough)
        (BAKED ?d - dough)
        (COOKED ?d - dish)
        (LOADED ?m - motorcycle ?d - (either dish dough))
        (IN ?m - motorcycle ?d - destination)
        (DELIVERED ?m ?d)
        (COLLECTED ?d)
        (READY ?m)
    )

    (:action kneadDough
        :parameters (?d - dough)
        :precondition (and (not (KNEADED ?d)) (not (BAKED ?d)))
        :effect (and (KNEADED ?d))
    )

    (:action addToping
        :parameters (?t - topping ?d - dough)
        :precondition (and (KNEADED ?d) (not (BAKED ?d)) (not (ADDED ?t ?d)))
        :effect (and (ADDED ?t ?d))
    )
    
    (:action bakeDough
        :parameters (?d - dough)
        :precondition (and (KNEADED ?d) (not (BAKED ?d)))
        :effect (and (BAKED ?d))
    )

    (:action cookDish
        :parameters (?d - dish)
        :precondition (and (not (COOKED ?d)))
        :effect (and (COOKED ?d))
    )

    (:action load
        :parameters (?m - motorcycle ?d - (either dish dough))
        :precondition (and (READY ?m) (or (COOKED ?d) (BAKED ?d)))
        :effect (and (LOADED ?m ?d) (not (READY ?m)))
    )

    (:action depart
        :parameters (?m - motorcycle ?di ?df - destination)
        :precondition (and (IN ?m ?di) (not (IN ?m ?df)))
        :effect (and (IN ?m ?df) (not (IN ?m ?di)))
    )

    (:action return
        :parameters (?m - motorcycle ?d - destination)
        :precondition (and (IN ?m ?d))
        :effect (and (READY ?m) (not (IN ?m ?d)))
    )

    (:action collectOrder
        :parameters (?m - motorcycle ?des - destination ?d - (either dish dough))
        :precondition (and (LOADED ?m ?d) (IN ?m ?des) (not (COLLECTED ?d)) (not (DELIVERED ?d)))
        :effect (and (COLLECTED ?d))
    )

    (:action deliverOrder
        :parameters (?m - motorcycle ?des - destination ?d - (either dish dough))
        :precondition (and (LOADED ?m ?d) (IN ?m ?des) (COLLECTED ?d) (not (DELIVERED ?d)))
        :effect (and (DELIVERED ?d) (not (LOADED ?m ?d)))
    )
    
    
    
    


)