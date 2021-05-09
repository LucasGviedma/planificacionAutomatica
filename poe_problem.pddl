(define (problem prob1)
  (:domain ferry)
  (:objects Marsella Rotterdam Sicilia - place
            Seat1 Seat2 BMW  - auto
            Balearia GNL - ferry
  )
  (:init 
   
        (at Seat1 Marsella)(at Seat2 Marsella)(at BMW Rotterdam)
   
        (= (carga_actual Balearia) 0)(= (carga_actual GNL) 0)
   		(= (capacidad Balearia)    1)(= (capacidad GNL)    1)
   		(= (speed Balearia)      1.5)(= (speed GNL)      1.2)
   
   	    (= (boarding_time) 1)
   
        (= (distance Marsella Rotterdam) 10)(= (distance Rotterdam Marsella) 10)
        (= (distance Marsella Sicilia)   10)(= (distance Sicilia Marsella)   10)
        (= (distance Rotterdam Sicilia)  10)(= (distance Sicilia Rotterdam)  10)
   
        (at-ferry Balearia Marsella)
        (at-ferry GNL Marsella)
  )

  (:goal (and (at Seat1 Rotterdam)(at Seat2 Marsella)(at BMW Sicilia)))


  (:constraints (preference P1 (sometime (at-ferry GNL Sicilia))))
    )