(define (problem p-spaceOperations)
    (:domain d-spaceOperations)
    (:objects satellite1 - satellite
              star0 phenomenon3 - direction
              instrument1 - instrument
              spectrograph2 - mode)

    (:init 
        (pointing satellite1 star0)
        (on_board instrument1 satellite1)
        (supports instrument1 spectrograph2)
    )

    (:goal (and (have_image phenomenon3 spectrograph2))
    )
)