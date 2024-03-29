(define (domain d-gripper)

   (:predicates (ROOM ?r)
                (BALL ?b)
                (GRIPPER ?g)
                (at-robby ?r)
                (at-ball ?b ?r)
                (free ?g)
                (carry ?g ?b))
   
   (:action move
        
       :parameters (?x ?y)

       :precondition (and (ROOM ?x)
                          (ROOM ?y)
                          (at-robby ?x))
       
       :effect (and (at-robby ?y)
                    (not (at-robby ?x)))
   )

   (:action pick-up
        
       :parameters (?ball ?room ?gripper)

       :precondition (and (BALL ?ball)
                          (ROOM ?room)
                          (GRIPPER ?gripper)
                          (at-ball ?ball ?room)
                          (at-robby ?room)
                          (free ?gripper))
       
       :effect (and (carry ?gripper ?ball)
                    (not (at-ball ?ball ?room)) 
                    (not (free ?gripper)))
   )

   (:action drop
        
       :parameters (?ball ?room ?gripper)

       :precondition (and (BALL ?ball)
                          (ROOM ?room)
                          (GRIPPER ?gripper)
                          (carry ?gripper ?ball)
                          (at-robby ?room))
       
       :effect (and (at-ball ?ball ?room)
                    (free ?gripper)
                    (not (carry ?gripper ?ball)))
   )
   
)