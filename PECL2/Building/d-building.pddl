(define (domain d-building)

(:requirements :fluents :durative-actions :typing :negative-preconditions :equality)

(:types 
        lift - object 
        slowlift fastlift - lift
        person - object
        number - object
)

(:predicates 
    (at-floor  ?p - (either person lift) ?f - number)
    (at-lift   ?p - person ?l - lift)
    (sanitized ?l - lift)
 	(current_capacity ?l - lift ?n - number)
    (sucesor_1 ?fi ?ff - number)
    (sucesor_2 ?fi ?ff - number)
)


(:functions 
    (dur_move_fast)
    (dur_move_slow)
)

(:durative-action move_up_fast
    
    :parameters (?l - fastlift ?li ?lf - number)
    
    :duration (= ?duration (dur_move_fast))

    :condition (at start (and (at-floor ?l ?li) (sucesor_2 ?li ?lf)))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_up_slow
    
    :parameters (?l - slowlift ?li ?lf - number)
    
    :duration (= ?duration (dur_move_slow))

    :condition (at start (and (at-floor ?l ?li) (sucesor_1 ?li ?lf)))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_down_fast
    
    :parameters (?l - fastlift ?li ?lf - number)
    
    :duration (= ?duration (dur_move_fast))

    :condition (at start (and (at-floor ?l ?li) (sucesor_2 ?lf ?li)))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_down_slow
    
    :parameters (?l - slowlift ?li ?lf - number)
    
    :duration (= ?duration (dur_move_slow))

    :condition (at start (and (at-floor ?l ?li) (sucesor_1 ?lf ?li)))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action board
    
    :parameters (?p - person ?l - lift ?f ?n1 ?n2 - number)

    :duration (= ?duration 1)

    :condition (and (at start (and (at-floor ?p ?f) (current_capacity ?l ?n1) (sucesor_1 ?n1 ?n2) (sanitized ?l)))
                    (over all (at-floor ?l ?f)))

    :effect (and (at start (not (at-floor ?p ?f)))
                 (at end (and (at-lift ?p ?l) (not (current_capacity ?l ?n1)) (current_capacity ?l ?n2))))

)

(:durative-action leave
    
    :parameters (?p - person ?l - lift ?f ?n1 ?n2 - number)

    :duration (= ?duration 1)

    :condition (and (at start (and (at-lift ?p ?l) (current_capacity ?l ?n1) (sucesor_1 ?n2 ?n1)))
                    (over all (at-floor ?l ?f)))
    
    :effect (and (at start (not (at-lift ?p ?l)))
                 (at end (and (at-floor ?p ?f) (not (current_capacity ?l ?n1)) (current_capacity ?l ?n2))))

)

(:durative-action sanitize
    
    :parameters (?l - lift ?f - number)

    :duration (= ?duration 1)

    :condition (and (at start (not (sanitized ?l)))
                 	(over all (at-floor ?l ?f)))

    :effect (at end (sanitized ?l))
)
)