(define (problem testproblem)
   (:domain testdomain)
   (:objects rooma roomb
             ball1 ball2 ball3 ball4 ball5 ball6
             left right)
   (:init (ROOM rooma)           (ROOM roomb)
          (ROOMA rooma)          (ROOMB roomb)
          (BALL ball1)           (BALL ball2)
          (BALL ball3)           (BALL ball4)
          (BALL ball5)           (BALL ball6)
          (GRIPPER left)         (GRIPPER right)
          (at-robby roomb)
          (free left)            (free right)
          (at-ball ball1 rooma)  (at-ball ball2 rooma)
          (at-ball ball3 rooma)  (at-ball ball4 rooma)
          (at-ball ball5 rooma)  (at-ball ball6 rooma)
          (= (count) 0)        
   )
   (:goal (or (= 5 (count)) (= 1 (count))))
   
)