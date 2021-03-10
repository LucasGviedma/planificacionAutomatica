(define (domain d-gripper)

   (:requirements :strips :typing :disjunctive-preconditions :fluents :durative-actions)
   (:types room ball gripper)

   (:functions (dur-ball ?b - ball)
   )

   (:predicates (at-robby ?r - room)
                (at-ball ?b - ball ?r - room)
                (free ?g - gripper)
                (carry ?g - gripper ?b - ball))   

   
   (:durative-action move

       :parameters (?x ?y - room)
       
       :duration (= ?duration 5)

       :condition (at start (and (at-robby ?x)))

       :effect (and (at start (not (at-robby ?x)))
                    (at end (at-robby ?y)))
   )

   (:durative-action pick-up
       
       :parameters (?ball - ball 
                    ?room - room 
                    ?gripper - gripper)
       
       :duration (= ?duration (dur-ball ?ball))

       :condition (at start (and (at-ball ?ball ?room)
                            (at-robby ?room)
                            (free ?gripper)))

       :effect (at start (and (carry ?gripper ?ball)
                         (not (at-ball ?ball ?room)) 
                         (not (free ?gripper))))
   )

   (:durative-action drop
       
       :parameters (?ball - ball 
                    ?room - room 
                    ?gripper - gripper)
       
       :duration (= ?duration (dur-ball ?ball))

       :condition (at start (and (carry ?gripper ?ball)
                            (at-robby ?room)))
       

       :effect (at end (and (at-ball ?ball ?room)
                       (free ?gripper)
                       (not (carry ?gripper ?ball))))
   )

)