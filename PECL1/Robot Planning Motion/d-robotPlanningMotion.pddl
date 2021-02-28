(define (domain d-robotPlanningMotion)
    (:requirements :strips :typing :equality :negative-preconditions :disjunctive-preconditions)
    (:types
        room box 
    )
    (:predicates
        (DOOR ?ri ?rf - room)
        (LIGHT ?r - room)
        (OPEN ?ri ?rf - room)
        (IN ?r - room ?b - box)
        (SHAKEY_IN ?r - room)
        (SHAKEY_ON ?b - box)
        (SHAKEY_FLOOR)
    )

    (:action go_from_to
        
        :parameters (?ri ?rf - room)

        :precondition (and (not (= ?ri ?rf))
                           (SHAKEY_IN ?ri) 
                           (SHAKEY_FLOOR) 
                           (or (DOOR ?ri ?rf) 
                               (DOOR ?rf ?ri)) 
                           (or (OPEN ?ri ?rf) 
                               (OPEN ?rf ?ri)))
        
        :effect (and (not (SHAKEY_IN ?ri)) 
                     (SHAKEY_IN ?rf))
    )

    (:action push_from_to
        
        :parameters (?ri ?rf - room ?b - box)

        :precondition (and (not (= ?ri ?rf)) 
                           (SHAKEY_IN ?ri) 
                           (SHAKEY_FLOOR) 
                           (IN ?ri ?b) 
                           (or (DOOR ?ri ?rf) 
                               (DOOR ?rf ?ri)) 
                           (or (OPEN ?ri ?rf) 
                               (OPEN ?rf ?ri)))
       
        :effect (and (not (SHAKEY_IN ?ri)) 
                     (SHAKEY_IN ?rf) 
                     (not (IN ?ri ?b)) 
                     (IN ?rf ?b))
    )

    (:action climb_up
        
        :parameters (?r - room ?b - box)

        :precondition (and (SHAKEY_FLOOR) 
                           (IN ?r ?b) 
                           (SHAKEY_IN ?r))
        
        :effect (and (not (SHAKEY_FLOOR)) 
                     (SHAKEY_ON ?b))
    )
    
    (:action climb_down
        
        :parameters (?r - room ?b - box)

        :precondition (and (SHAKEY_ON ?b) 
                           (SHAKEY_IN ?r))

        :effect (and (not (SHAKEY_ON ?b))
                     (SHAKEY_FLOOR))
    )

    (:action light_on
        
        :parameters (?r - room)

        :precondition (and (not (SHAKEY_FLOOR)) 
                           (SHAKEY_IN ?r) 
                           (not (LIGHT ?r)))
        
        :effect (and (LIGHT ?r))
    )

    (:action light_off
        
        :parameters (?r - room)

        :precondition (and (not (SHAKEY_FLOOR)) 
                           (SHAKEY_IN ?r) 
                           (LIGHT ?r))

        :effect (and (not (LIGHT ?r)))
    )

    (:action open
        
        :parameters (?ri ?rf - room)

        :precondition (and (or (DOOR ?ri ?rf) 
                               (DOOR ?rf ?ri)) 
                           (or (not (OPEN ?ri ?rf))
                               (not (OPEN ?rf ?ri))) 
                           (SHAKEY_FLOOR) 
                           (or (SHAKEY_IN ?ri) 
                               (SHAKEY_IN ?rf)))
        
        :effect (and (OPEN ?ri ?rf) 
                     (OPEN ?rf ?ri))
    )

    (:action close
        
        :parameters (?ri ?rf - room)

        :precondition (and (or (DOOR ?ri ?rf) 
                               (DOOR ?rf ?ri))
                           (or (OPEN ?ri ?rf)
                               (OPEN ?rf ?ri))
                           (SHAKEY_FLOOR)
                           (or (SHAKEY_IN ?ri)
                               (SHAKEY_IN ?rf)))
        
        :effect (and (not (OPEN ?ri ?rf)) 
                     (not (OPEN ?rf ?ri)))
    )
)