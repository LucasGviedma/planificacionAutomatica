(define (domain d-gripper)

   (:requirements :typing :fluents :durative-actions :preferences :constraints)
   (:types room ball gripper)

   (:functions (dur-ball ?b - ball))

   (:predicates (at-robby ?r - room)
                (at-ball ?b - ball ?r - room)
                (free ?g - gripper)
                (carry ?g - gripper ?b - ball))   

   
   (:durative-action move

       :parameters (?x ?y - room)
       
       :duration (= ?duration 5)

       :condition (at start (at-robby ?x))

       :effect (and (at start (not (at-robby ?x)))
                    (at end (at-robby ?y)))
   )

   (:durative-action pick-up
       
       :parameters (?ball - ball 
                    ?room - room 
                    ?gripper - gripper)
       
       :duration (= ?duration (dur-ball ?ball))

       :condition (and (at start (and (at-ball ?ball ?room)
                                      (free ?gripper)))
                       (over all (at-robby ?room)))

       :effect (and (at start (and (not (at-ball ?ball ?room)) 
                                   (not (free ?gripper))))
                    (at end (carry ?gripper ?ball)))
   )

   (:durative-action drop
       
       :parameters (?ball - ball 
                    ?room - room 
                    ?gripper - gripper)
       
       :duration (= ?duration (dur-ball ?ball))

       :condition (and (at start (carry ?gripper ?ball))
                       (over all (at-robby ?room)))
       

       :effect (and (at end (and (at-ball ?ball ?room)
                                 (free ?gripper)))
                    (at start (not (carry ?gripper ?ball))))
   )

)