(define (problem p-gripper)
   (:domain d-gripper)
   
   (:objects kitchen livingroom - room
             z1 z2 - ball
             left right - gripper)
             
   (:init (at-robby kitchen)
          (free left)           (free right)
          (at-ball z1 kitchen)  (at-ball z2 kitchen)
          (= (dur-ball z1) 7)   (= (dur-ball z2) 3)
   )

   (:goal (and (at-ball z1 livingroom) (at-ball z2 livingroom))
   )
)

