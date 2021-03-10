(define (domain d-planetaryExploration)
    (:requirements :strips :equality :negative-preconditions :disjunctive-preconditions)
    (:predicates
        (PICTURE ?coord)
        (DRILL ?coord)
        (COMMUNICATION ?coord)
        (ANALYSIS ?coord)
        (IN ?coord)
    )

    (:action go_from_to
        
        :parameters (?coordi ?coordf)

        :precondition (and (not (= ?coordi ?coordf))
                           (IN ?coordi))
        
        :effect (and (not (IN ?coordi)) 
                     (IN ?coordf))
    )

    (:action take_pic
        
        :parameters (?coord)

        :precondition (and (IN ?coord) 
                           (not (PICTURE ?coord)))
       
        :effect (and (PICTURE ?coord))
    )

    (:action drill
        
        :parameters (?coord)

        :precondition (and (IN ?coord) 
                           (not (DRILL ?coord)))
       
        :effect (and (DRILL ?coord))
    )

    (:action communicate
        
        :parameters (?coord)

        :precondition (and (IN ?coord) 
                           (not (COMMUNICATION ?coord)))
       
        :effect (and (COMMUNICATION ?coord))
    )

    (:action analyse
        
        :parameters (?coord)

        :precondition (and (IN ?coord) 
                           (not (ANALYSIS ?coord)))
       
        :effect (and (ANALYSIS ?coord))
    )
)