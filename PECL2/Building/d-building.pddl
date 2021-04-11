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
)


(:functions 
    (dif ?fi ?ff - number)
)

(:durative-action move_up_fast
    
    :parameters (?l - fastlift ?li ?lf - number)
    
    :duration (= ?duration 1.5)

    :condition (at start (and (at-floor ?l ?li) (= -2 (dif ?li ?lf))))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_up_slow
    
    :parameters (?l - slowlift ?li ?lf - number)
    
    :duration (= ?duration 1)

    :condition (at start (and (at-floor ?l ?li) (= -1 (dif ?li ?lf))))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_down_fast
    
    :parameters (?l - fastlift ?li ?lf - number)
    
    :duration (= ?duration 1.5)

    :condition (at start (and (at-floor ?l ?li) (= 2 (dif ?li ?lf))))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action move_down_slow
    
    :parameters (?l - slowlift ?li ?lf - number)
    
    :duration (= ?duration 1)

    :condition (at start (and (at-floor ?l ?li) (= 1 (dif ?li ?lf))))

    :effect (and (at start (not (at-floor ?l ?li)))
                 (at end (at-floor ?l ?lf)))
)

(:durative-action board
    
    :parameters (?p - person ?l - lift ?f ?n1 ?n2 - number)

    :duration (= ?duration 1)

    :condition (and (at start (and (at-floor ?p ?f) (current_capacity ?l ?n1) (= (dif ?n1 ?n2) -1) (sanitized ?l)))
                    (over all (at-floor ?l ?f)))

    :effect (and (at start (not (at-floor ?p ?f)))
                 (at end (and (at-lift ?p ?l) (not (current_capacity ?l ?n1)) (current_capacity ?l ?n2))))

)

(:durative-action leave
    
    :parameters (?p - person ?l - lift ?f ?n1 ?n2 - number)

    :duration (= ?duration 1)

    :condition (and (at start (and (at-lift ?p ?l) (current_capacity ?l ?n1) (= (dif ?n1 ?n2) 1)))
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