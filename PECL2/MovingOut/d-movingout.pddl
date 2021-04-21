(define (domain d-movingout)

 (:requirements :typing :negative-preconditions :conditional-effects :durative-actions :equality)

 (:types container location)

 (:constants O - container)

 (:predicates
     (in ?o ?c - container)
     (at ?c - container ?l - location)
 )

(:durative-action move_container
     
     :parameters (?li ?lf - location)

     :duration (= ?duration 1)

     :condition (at start (and (at O ?li) (not (= ?li ?lf))))

     :effect (and (at start (and (not (at O ?li)) (forall (?x - container) (when (in ?x O) (not (at ?x ?li))))))
                  (at end (and (at O ?lf) (forall (?x - container) (when (in ?x O) (at ?x ?lf))))))
 )

 (:durative-action put_in
     
     :parameters (?c ?o - container ?lo - location)

     :duration (= ?duration 1)

     :condition (at start (and (not (in ?o ?c)) (not (= ?o ?c))))

     :effect (at end (when (and (at ?c ?lo) (at ?o ?lo)) (in ?o ?c)))
 )
     
 (:durative-action take_out
     
     :parameters (?c ?o - container)

     :duration (= ?duration 1)

     :condition (at start (in ?o ?c))

     :effect (at end (not (in ?o ?c)))
 )

)