(define (problem p-movingout)
  (:domain d-movingout)

  (:objects
            c1 o2 - container
            l1 l2 - location
  )

  (:init
      (in c1 o2)
      (at c1 l1)
      (at o2 l1)
      
  )

  (:goal
     
      (at o2 l2)
  )
)