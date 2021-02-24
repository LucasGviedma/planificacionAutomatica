(define (problem p-spaceOperations)
    (:domain d-spaceOperations)
    (:objects satellite1 - satellite
              DirPhenomenon4 DirStar5 DirPhenomenon6 - direction
              instrument1 - instrument
              Mode_thermograph0 - mode)

    (:init 
        (pointing satellite1 DirStar5)
        (on_board instrument1 satellite1)
        (supports instrument1 Mode_thermograph0)
    )

    (:goal (and (have_image DirPhenomenon4 Mode_thermograph0)
                (have_image DirStar5 Mode_thermograph0)
                (have_image DirPhenomenon6 Mode_thermograph0))
    )
)