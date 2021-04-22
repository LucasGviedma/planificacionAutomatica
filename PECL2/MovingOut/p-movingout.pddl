(define (problem p-movingout)
  (:domain d-movingout)
  (:objects locat1 locat2 - location
            objeto1 objeto2 objeto3 contenedor_const - object
    
  )
  (:init 
    (at contenedor_const locat1) 
    (at objeto1 locat1) (at objeto2 locat2) 
    (in objeto3)

    (= (dur_takeout objeto1) 1) 
    (= (dur_takeout objeto2) 2)
    (= (dur_takeout objeto3) 3)
  )

  (:goal 
    (and (at contenedor_const locat2) (at objeto1 locat2) (at objeto2 locat1) (at objeto3 locat1))
  )
 )