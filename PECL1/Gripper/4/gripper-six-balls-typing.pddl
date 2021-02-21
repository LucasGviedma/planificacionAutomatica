(define (problem gripper-six-balls-typing)
   (:domain gripper)
   
   (:objects rooma roomb - room
             ball1 ball2 ball3 ball4 ball5 ball6 - ball
             left right - gripper)
             
   (:init (at-robby rooma)
          (free left)            (free right)
          (at-ball ball1 rooma)  (at-ball ball2 rooma)
          (at-ball ball3 rooma)  (at-ball ball4 rooma)
          (at-ball ball5 rooma)  (at-ball ball6 rooma)
   )

   (:goal (or (and (at-ball ball1 roomb) (at-ball ball2 roomb) (at-ball ball3 roomb) (at-ball ball4 roomb) (at-ball ball5 roomb) (at-ball ball6 rooma))
              (and (at-ball ball1 roomb) (at-ball ball2 roomb) (at-ball ball3 roomb) (at-ball ball4 roomb) (at-ball ball5 rooma) (at-ball ball6 roomb))
              (and (at-ball ball1 roomb) (at-ball ball2 roomb) (at-ball ball3 roomb) (at-ball ball4 rooma) (at-ball ball5 roomb) (at-ball ball6 roomb))
              (and (at-ball ball1 roomb) (at-ball ball2 roomb) (at-ball ball3 rooma) (at-ball ball4 roomb) (at-ball ball5 roomb) (at-ball ball6 roomb)) 
              (and (at-ball ball1 roomb) (at-ball ball2 rooma) (at-ball ball3 roomb) (at-ball ball4 roomb) (at-ball ball5 roomb) (at-ball ball6 roomb)) 
              (and (at-ball ball1 rooma) (at-ball ball2 roomb) (at-ball ball3 roomb) (at-ball ball4 roomb) (at-ball ball5 roomb) (at-ball ball6 roomb))
              
              (and (at-ball ball1 roomb) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 rooma) (at-ball ball5 rooma) (at-ball ball6 rooma))
              (and (at-ball ball1 rooma) (at-ball ball2 roomb) (at-ball ball3 rooma) (at-ball ball4 rooma) (at-ball ball5 rooma) (at-ball ball6 rooma))
              (and (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 roomb) (at-ball ball4 rooma) (at-ball ball5 rooma) (at-ball ball6 rooma))
              (and (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 roomb) (at-ball ball5 rooma) (at-ball ball6 rooma)) 
              (and (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 rooma) (at-ball ball5 roomb) (at-ball ball6 rooma)) 
              (and (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 rooma) (at-ball ball5 rooma) (at-ball ball6 roomb)))
   )
)

