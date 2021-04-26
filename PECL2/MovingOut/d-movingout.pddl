(define (domain d-movingout)

 (:requirements :typing :fluents :negative-preconditions :conditional-effects :durative-actions :equality)

 (:types object location)

 (:constants contenedor_const - object)

 (:functions (dur_takeout ?o - object))

 (:predicates
     (in ?o - object)
     (at ?o - object ?l - location)
 )

; -- CON FORALL COMENTADO --
;
;(:action move_contenedor 
;    
;     :parameters (?li ?lf - location)
;
;     :precondition (and (at contenedor_const ?li) (not (= ?li ?lf)))
;
;     :effect 
;     (and (at contenedor_const ?lf) (not (at contenedor_const ?li)))
;     (forall (?o - object) (when (and (not (= ?o contenedor_const)) (in ?o)) (and (not (at ?o ?li)) (at ?o ?lf)))))
;              
;)

 (:action move_contenedor
     
     :parameters (?li ?lf - location)

     :precondition (and (at contenedor_const ?li) (not (= ?li ?lf)))

     :effect (and (not (at contenedor_const ?li)) (at contenedor_const ?lf))
              
 )

 (:action put_in
     
     :parameters (?o - object ?lo - location)

     :precondition (and (not (= ?o contenedor_const)))

     :effect (when (and (at ?o ?lo) (at contenedor_const ?lo)) (in ?o))
 )
     
 (:durative-action take_out
     
     :parameters (?x - object ?l - location)

     :duration (= ?duration 1)

     :condition (at start (and (in ?x) (at contenedor_const ?l)))

     :effect (and (at start (not (in ?x)))
                  (at end (at ?x ?l)))
 )

)