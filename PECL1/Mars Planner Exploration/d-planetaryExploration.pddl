(define (domain d-planetaryExploration)
    (:requirements :strips :equality :negative-preconditions :disjunctive-preconditions :typing)
    (:types
        rober coord
    )
    (:predicates
        (PICTURE ?coord - coord ?rober - rober)
        (DRILL ?coord - coord ?rober - rober)
        (COMMUNICATION ?coord - coord ?rober - rober)
        (ANALYSIS ?coord - coord ?rober - rober)
        (IN ?coord - coord ?rober - rober)
    )

    (:action go_from_to
        
        :parameters (?coordi ?coordf - coord ?rober - rober)

        :precondition (and (not (= ?coordi ?coordf))
                           (IN ?coordi ?rober))
        
        :effect (and (not (IN ?coordi ?rober)) 
                     (IN ?coordf ?rober))
    )

    (:action take_pic
        
        :parameters (?coord - coord ?rober - rober)

        :precondition (and (IN ?coord ?rober) 
                           (not (PICTURE ?coord ?rober)))
       
        :effect (and (PICTURE ?coord ?rober))
    )

    (:action drill
        
        :parameters (?coord - coord ?rober - rober)

        :precondition (and (IN ?coord ?rober) 
                           (not (DRILL ?coord ?rober)))
       
        :effect (and (DRILL ?coord ?rober))
    )

    (:action communicate
        
        :parameters (?coord - coord ?rober - rober)

        :precondition (and (IN ?coord ?rober) 
                           (not (COMMUNICATION ?coord ?rober)))
       
        :effect (and (COMMUNICATION ?coord ?rober))
    )

    (:action analyse
        
        :parameters (?coord - coord ?rober - rober)

        :precondition (and (IN ?coord ?rober) 
                           (not (ANALYSIS ?coord ?rober)))
       
        :effect (and (ANALYSIS ?coord ?rober))
    )
)