(define (problem p-building1)
    (:domain d-building)

    (:objects
        n0 n1 n2 n3 n4 - number
        fl1 fl2 - fastlift
        sl1 sl2 - slowlift
        p1 p2 - person
    )

    (:init
         (= (dif n0 n0)  0)
         (= (dif n0 n1) -1) (= (dif n1 n0) 1)
         (= (dif n0 n2) -2) (= (dif n2 n0) 2)
         (= (dif n0 n3) -3) (= (dif n3 n0) 3)
         (= (dif n0 n4) -4) (= (dif n4 n0) 4)

         (= (dif n1 n1)  0)
         (= (dif n1 n2) -1) (= (dif n2 n1) 1)
         (= (dif n1 n3) -2) (= (dif n3 n1) 2)
         (= (dif n1 n4) -3) (= (dif n4 n1) 3)

         (= (dif n2 n2)  0)
         (= (dif n2 n3) -1) (= (dif n3 n2) 1)
         (= (dif n2 n4) -2) (= (dif n4 n2) 2)

         (= (dif n3 n3)  0)
         (= (dif n3 n4) -1) (= (dif n4 n3) 1)

         (= (dif n4 n4)  0)

         (at-floor p1 n0)
         (at-floor p2 n4)

         (at-floor sl1 n1)
         (at-floor sl2 n1)

         (at-floor fl1 n2)
         (at-floor fl2 n2)
     
 		 (current_capacity sl1 n0)
 		 (current_capacity sl2 n0)
 		 (current_capacity fl1 n0)
 		 (current_capacity fl2 n0)
     
    )

    (:goal (and
        (at-floor p1 n4)
        (at-floor p2 n3))
    )
  
    (:metric minimize (total-time))
)
