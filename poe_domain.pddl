;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; typed version of the ferry domain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain ferry)

  (:requirements :strips :equality :typing :fluents :durative-actions :constraints :preferences :negative-preconditions)

  (:types auto place ferry)

  (:functions
         (carga_actual ?f - ferry)
         (capacidad ?f - ferry)
         (boarding_time)
         (distance ?x ?y - place)
         (speed ?f - ferry)     
  )
  
  (:predicates 
         (at-ferry ?f - ferry ?l - place)
         (at ?x - auto  ?y - place)
         (on ?x - auto  ?f - ferry)
         (permiso_salida ?f - ferry ?x - place)
   )
  
  (:durative-action board
         :parameters (?f - ferry ?x - auto ?y - place)

         :duration (= ?duration (boarding_time))

         :condition (and (at start (and (at ?x ?y) (> (capacidad ?f) (carga_actual ?f))))
                         (over all (at-ferry ?f ?y)))

         :effect  (and (at start (and (not (at ?x ?y)) (increase (carga_actual ?f) 1)))
                       (at end (on ?x ?f)))  
  )
  
  (:action controlPuerto
          :parameters (?f - ferry ?x - place)
          :precondition (and (not (permiso_salida ?f ?x)) (at-ferry ?f ?x))
          :effect (permiso_salida ?f ?x)
   )
  
  (:durative-action sail
         :parameters (?f - ferry ?x ?y - place)

         :duration (= ?duration (/ (distance ?x ?y) (speed ?f)))

         :condition (at start (and (at-ferry ?f ?x) (permiso_salida ?f ?x) (not (= ?x ?y))))
         
         :effect (and (at start (and (not (at-ferry ?f ?x)) (not (permiso_salida ?f ?x)))) 
                      (at end (at-ferry ?f ?y)))
  )
  
  (:action debark
         
         :parameters (?f - ferry ?a - auto ?y - place)

         :precondition (and (on ?a ?f)(at-ferry ?f ?y))

         :effect (and (not (on ?a ?f))
                           (at ?a ?y)
                           (decrease (carga_actual ?f) 1))
  )
)