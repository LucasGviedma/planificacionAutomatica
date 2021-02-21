(define (domain testdomain)

   (:requirements :fluents :conditional-effects :disjunctive-preconditions)

   (:predicates (ROOM ?r)
                (ROOMA ?ra)
                (ROOMB ?rb)
                (BALL ?b)
                (GRIPPER ?g)
                (at-robby ?r)
                (at-ball ?b ?r)
                (free ?g)
                (carry ?g ?b))
                
   (:functions  (count)
                (ballsA))
   
   (:action move
       :parameters (?x ?y ?xc ?xy)
       :precondition (and (ROOM ?x)
                          (ROOM ?y)
                          (at-robby ?x)
                     )
       :effect (and (at-robby ?y)
                    (not (at-robby ?x))
                    (when (and (ROOMA ?x) (ROOMB ?y))
                          (and (increase (count) 1)))
                    (when (and (ROOMB ?x) (ROOMA ?y))
                          (and (decrease (count) 1)))
               )
   )
   
   (:action pick-up
       :parameters (?ball ?room ?gripper)
       :precondition (and (BALL ?ball)
                          (ROOM ?room)
                          (GRIPPER ?gripper)
                          (at-ball ?ball ?room)
                          (at-robby ?room)
                          (free ?gripper)
                     )
       :effect (and (carry ?gripper ?ball)
                    (not (at-ball ?ball ?room)) 
                    (not (free ?gripper))
               )
   )
   
   (:action drop
       :parameters (?ball ?room ?gripper)
       :precondition (and (BALL ?ball)
                          (ROOM ?room)
                          (GRIPPER ?gripper)
                          (carry ?gripper ?ball)
                          (at-robby ?room)
                     )
       :effect (and (at-ball ?ball ?room)
                    (free ?gripper)
                    (not (carry ?gripper ?ball))
               )
   )
)