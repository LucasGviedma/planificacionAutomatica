(define (problem p-planetaryExploration) 

    (:domain d-planetaryExploration)
  
    (:objects 
        cord1 cord2 cord3 cord4 cordD - coord
        slow fast - rover_speed
     	rover1 - rover
    )

    (:init
        
        (= (dur_pict) 10) (= (pict_battery_use) 20)
        (= (dur_dril) 18) (= (dril_battery_use) 20)
        (= (dur_comm) 11) (= (comm_battery_use) 20)
        (= (dur_anal) 21) (= (anal_battery_use) 20)
        (= (dur_rech) 15) 
     
        (IN cord1 rover1)
     
        (= (max_battery rover1) 100)  (= (current_battery rover1) 100)  (= (low_battery rover1) 20)
        
        (= (speed slow rover1) 5)  (= (speed fast rover1) 10)
     
     	(= (distance cord1 cord2) 10)  (= (distance cord3 cord1) 20)  (= (distance cordD cord1) 10)
     	(= (distance cord1 cord3) 20)  (= (distance cord3 cord2) 10)  (= (distance cordD cord2) 40)
     	(= (distance cord1 cord4) 10)  (= (distance cord3 cord4) 30)  (= (distance cordD cord3) 3)
     	(= (distance cord1 cordD) 30)  (= (distance cord3 cordD) 3)   (= (distance cordD cord4) 3)
     
     	(= (distance cord2 cord1) 10)  (= (distance cord4 cord1) 10)
     	(= (distance cord2 cord3) 10)  (= (distance cord4 cord2) 10)
     	(= (distance cord2 cord4) 10)  (= (distance cord4 cord3) 10)
     	(= (distance cord2 cordD) 40)  (= (distance cord4 cordD) 3)
    )

    (:goal (and 
                (COMMUNICATION cord3 rover1)
                (ANALYSIS cord4 rover1)
                (COMMUNICATION cord2 rover1)
                (DRILL cord1 rover1)
            )        
    )
  
    (:constraints (and (preference keepSafe (always (not (IN cordD rover1))))
                       (preference phot56   (sometime (PICTURE cord1 rover1)))))

)
