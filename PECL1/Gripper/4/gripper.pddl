(define (domain gripper)

   (:requirements :strips :typing :disjunctive-preconditions)
   (:types room ball gripper)

   (:predicates (at-robby ?r)
                (at-ball ?b ?r)
                (free ?g)
                (carry ?g ?b))

   (:action move

       :parameters (?x ?y -room)

       :precondition (and (at-robby ?x))

       :effect (and (at-robby ?y)
                    (not (at-robby ?x)))
   )

   (:action pick-up

       :parameters (?ball -ball 
                    ?room -room 
                    ?gripper -gripper)
                    
       :precondition (and (at-ball ?ball ?room)
                          (at-robby ?room)
                          (free ?gripper))

       :effect (and (carry ?gripper ?ball)
                    (not (at-ball ?ball ?room)) 
                    (not (free ?gripper)))
   )

   (:action drop

       :parameters (?ball -ball 
                    ?room -room 
                    ?gripper -gripper)
                    
       :precondition (and (carry ?gripper ?ball)
                          (at-robby ?room))

       :effect (and (at-ball ?ball ?room)
                    (free ?gripper)
                    (not (carry ?gripper ?ball)))
   )

)