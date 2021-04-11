(define (problem p-building1)
    (:domain d-building)

    (:objects
        n0 n1 n2 n3 n4 n5 n6 n7 n8 - number
        fl1 fl2 - fastlift
        sl1 sl2 - slowlift
        p1 p2 p3 p4 - person
    )

    (:init
         (= (dif n0 n0)  0)
         (= (dif n0 n1) -1) (= (dif n1 n0) 1)
         (= (dif n0 n2) -2) (= (dif n2 n0) 2)
         (= (dif n0 n3) -3) (= (dif n3 n0) 3)
         (= (dif n0 n4) -4) (= (dif n4 n0) 4)
         (= (dif n0 n5) -5) (= (dif n5 n0) 5)
         (= (dif n0 n6) -6) (= (dif n6 n0) 6)
         (= (dif n0 n7) -7) (= (dif n7 n0) 7)
         (= (dif n0 n8) -8) (= (dif n8 n0) 8)

         (= (dif n1 n1)  0)
         (= (dif n1 n2) -1) (= (dif n2 n1) 1)
         (= (dif n1 n3) -2) (= (dif n3 n1) 2)
         (= (dif n1 n4) -3) (= (dif n4 n1) 3)
         (= (dif n1 n5) -4) (= (dif n5 n1) 4)
         (= (dif n1 n6) -5) (= (dif n6 n1) 5)
         (= (dif n1 n7) -6) (= (dif n7 n1) 6)
         (= (dif n1 n8) -7) (= (dif n8 n1) 7)

         (= (dif n2 n2)  0)
         (= (dif n2 n3) -1) (= (dif n3 n2) 1)
         (= (dif n2 n4) -2) (= (dif n4 n2) 2)
         (= (dif n2 n5) -3) (= (dif n5 n2) 3)
         (= (dif n2 n6) -4) (= (dif n6 n2) 4)
         (= (dif n2 n7) -5) (= (dif n7 n2) 5)
         (= (dif n2 n8) -6) (= (dif n8 n2) 6)

         (= (dif n3 n3)  0)
         (= (dif n3 n4) -1) (= (dif n4 n3) 1)
         (= (dif n3 n5) -2) (= (dif n5 n3) 2)
         (= (dif n3 n6) -3) (= (dif n6 n3) 3)
         (= (dif n3 n7) -4) (= (dif n7 n3) 4)
         (= (dif n3 n8) -5) (= (dif n8 n3) 5)

         (= (dif n4 n4)  0)
         (= (dif n4 n5) -1) (= (dif n5 n4) 1)
         (= (dif n4 n6) -2) (= (dif n6 n4) 2)
         (= (dif n4 n7) -3) (= (dif n7 n4) 3)
         (= (dif n4 n8) -4) (= (dif n8 n4) 4)
         
         (= (dif n5 n5)  0)
         (= (dif n5 n6) -1) (= (dif n6 n5) 1)
         (= (dif n5 n7) -2) (= (dif n7 n5) 2)
         (= (dif n5 n8) -3) (= (dif n8 n5) 3)
         
         (= (dif n6 n6)  0)
         (= (dif n6 n7) -1) (= (dif n7 n6) 1)
         (= (dif n4 n8) -2) (= (dif n8 n6) 2)
         
         (= (dif n7 n7)  0)
         (= (dif n7 n8) -1) (= (dif n8 n7) 1)

         (= (dif n8 n8)  0)

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
