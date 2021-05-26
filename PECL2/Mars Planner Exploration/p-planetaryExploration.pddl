(define (problem p-planetaryExploration) 

    (:domain d-planetaryExploration)
  
    (:objects 
        P0404 P1408 P0914 P1717 P0905 - coord
        slow fast - rover_speed
     	rover1 - rover
    )

    (:init
        
        (= (dur_pict) 10) (= (pict_battery_use) 20)
        (= (dur_dril) 18) (= (dril_battery_use) 20)
        (= (dur_comm) 11) (= (comm_battery_use) 20)
        (= (dur_anal) 21) (= (anal_battery_use) 20)
        (= (dur_rech) 15) 
     
        (IN P0404 rover1)
     
        (= (max_battery rover1) 100)  (= (current_battery rover1) 100)  (= (low_battery rover1) 20)
        
        (= (speed slow rover1) 5)  (= (speed fast rover1) 10)
     
     	(= (distance P0404 P1408) 10)  (= (distance P0914 P0404) 20)  (= (distance P0905 P0404) 10)
     	(= (distance P0404 P0914) 20)  (= (distance P0914 P1408) 10)  (= (distance P0905 P1408) 40)
     	(= (distance P0404 P1717) 10)  (= (distance P0914 P1717) 30)  (= (distance P0905 P0914) 10)
     	(= (distance P0404 P0905) 30)  (= (distance P0914 P0905) 10)  (= (distance P0905 P1717) 25)
     
     	(= (distance P1408 P0404) 10)  (= (distance P1717 P0404) 10)
     	(= (distance P1408 P0914) 10)  (= (distance P1717 P1408) 10)
     	(= (distance P1408 P1717) 10)  (= (distance P1717 P0914) 10)
     	(= (distance P1408 P0905) 40)  (= (distance P1717 P0905) 25)
     
     	(DANGER P0905)
     	
    )

    (:goal (and 
                (COMMUNICATION P0914 rover1)
                (ANALYSIS P0914 rover1)
                (COMMUNICATION P1408 rover1)
                (DRILL P1408 rover1)
                (ANALYSIS P0404 rover1)
                (DRILL P0404 rover1)
                (COMMUNICATION P1717 rover1)
                (PICTURE P1717 rover1)
            )        
    )
  
    (:constraints (and (preference keepSafe (always (forall (?rover - rover ?cord - coord) (imply (DANGER ?cord) (not (IN ?cord ?rover))))))
                       ;(preference phot56   (sometime (PICTURE P0404 rover1)))
                    ))
)
