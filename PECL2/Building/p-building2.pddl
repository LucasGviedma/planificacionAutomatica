(define (problem p-building1)
    (:domain d-building)

    (:objects
        n0 n1 n2 n3 n4 n5 n6 n7 n8 - number
        fl1 fl2 - fastlift
        sl1 sl2 - slowlift
        p1 p2 p3 p4 - person
    )

    (:init

         (= (dur_move_fast) 1.5)
         (= (dur_move_slow)   1)
    
         (sucesor_1 n0 n1) 
         (sucesor_1 n1 n2)
         (sucesor_1 n2 n3)
         (sucesor_1 n3 n4)
         (sucesor_1 n4 n5)
         (sucesor_1 n5 n6)
         (sucesor_1 n6 n7)
         (sucesor_1 n7 n8)

         (sucesor_2 n0 n2) 
         (sucesor_2 n1 n3)
         (sucesor_2 n2 n4)
         (sucesor_2 n3 n5)
         (sucesor_2 n4 n6)
         (sucesor_2 n5 n7)
         (sucesor_2 n6 n8)

         (at-floor p1 n0)
         (at-floor p2 n4)
         (at-floor p3 n2)
         (at-floor p4 n7)

         (at-floor sl1 n1)
         (at-floor sl2 n0)

         (at-floor fl1 n1)
         (at-floor fl2 n0)
     
 		 (current_capacity sl1 n0)
 		 (current_capacity sl2 n0)
 		 (current_capacity fl1 n0)
 		 (current_capacity fl2 n0)
     
    )

    (:goal (and
        (at-floor p1 n4)
        (at-floor p2 n3)
        (at-floor p3 n8)
        (at-floor p4 n0))
    )
  
    (:metric minimize (total-time))
)
