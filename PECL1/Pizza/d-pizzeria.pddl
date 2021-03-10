(define  (domain d-pizzeria)
    (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality)

    (:types
        dough motorcycle dish location
    )

    (:predicates
        
        (PIZZERIA ?location)

        (KNEADED ?d - dough)
        (ADDED_T ?d - dough)
        (BAKED   ?d - dough)
        (COOKED  ?d - dish)

        (PREPARED  ?d - (either dish dough))

        (FULL   ?m - motorcycle)
        (LOADED ?m - motorcycle ?d - (either dish dough))

        (IN ?m - motorcycle ?loc - location)
        (DELIVERED ?d - (either dish dough) ?loc - location)
        (COLLECTED ?d - (either dish dough) ?loc - location)
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

        :precondition (and (ADDED_T ?d) (not (BAKED ?d)))

        :effect (and (BAKED ?d) (PREPARED ?d))
    )

    (:action cookDish
        
        :parameters (?d - dish)

        :precondition (and (not (COOKED ?d)))

        :effect (and (COOKED ?d) (PREPARED ?d))
    )

    (:action load
        
        :parameters (?m - motorcycle ?d - (either dish dough) ?loc - location)

        :precondition (and (PREPARED ?d) 
                           (IN ?m ?loc) (PIZZERIA ?loc) (not (FULL ?m)) (not (LOADED ?m ?d)))

        :effect (and (LOADED ?m ?d) (FULL ?m) (not (PREPARED ?d)))
    )

    (:action move
        
        :parameters (?m - motorcycle ?li ?lf - location)

        :precondition (and (not (= ?li ?lf)) (IN ?m ?li))
    
        :effect (and (not (IN ?m ?li)) (IN ?m ?lf))
    )

    (:action collectOrder
        
        :parameters (?m - motorcycle ?loc - location ?d - (either dish dough))

        :precondition (and (LOADED ?m ?d) (IN ?m ?loc) (not (COLLECTED ?d ?loc)))

        :effect (and (COLLECTED ?d ?loc))
    )

    (:action deliverOrder
        
        :parameters (?m - motorcycle ?loc - location ?d - (either dish dough))

        :precondition (and (LOADED ?m ?d) (IN ?m ?loc) (COLLECTED ?d ?loc) (not (DELIVERED ?d ?loc)))
        
        :effect (and (DELIVERED ?d ?loc) (not (FULL ?m)) (not (LOADED ?m ?d)))
    )

)

