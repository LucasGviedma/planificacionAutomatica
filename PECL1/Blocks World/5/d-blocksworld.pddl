(define (domain d-blocksworld)

  (:requirements :typing)
  (:types block)

  (:predicates (on ?x ?y - block)
               (ontable ?x - block)
               (clear ?x - block)
               (handempty)
               (holding ?x - block))

  (:action pick-up
       
       :parameters (?x - block)

       :precondition (and (clear ?x) (ontable ?x) (handempty))

       :effect (and (not (ontable ?x))
                    (not (clear ?x))
                    (not (handempty))
                    (holding ?x))
   )
  
  (:action unstack
       
       :parameters (?x ?y - block)

       :precondition (and (on ?x ?y) (clear ?x) (handempty))

       :effect (and (holding ?x)
                    (clear ?y)
                    (not (clear ?x))
                    (not (handempty))
                    (not (on ?x ?y)))
   )  
  
  (:action stack
       
       :parameters (?x ?y - block)

       :precondition (and (holding ?x) (clear ?y))

       :effect (and (not (holding ?x))
                    (not (clear ?y))
                    (clear ?x)
                    (handempty)
                    (on ?x ?y))
   )
  
  (:action put-down
       
       :parameters (?x - block)

       :precondition (holding ?x)
       
       :effect (and (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (not (holding ?x)))
   )  
)