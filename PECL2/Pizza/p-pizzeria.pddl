(define  (problem p-pizzeria)
    (:domain d-pizzeria)

    (:objects 
        
        pizzeria - restaurante
        repsol - gasolinera
        casa1 casa2  - casa
        lasagna macarrones - plato
        pizza1 - pizza
        vespa - moto
    )

    (:init
        
        (EN vespa pizzeria) (= (velocidad vespa) 35)

        (= (capacidad_pedidos vespa) 3) (= (carga_actual vespa) 0)

        (= (capacidad_gasolina vespa) 180) (= (gasolina_actual vespa) 180) (= (umbral_gasolina vespa) 20) 

        (= (dur_amasado) 3) (= (dur_topping) 1) (= (dur_hornead) 15) (= (dur_entrega) 1) (= (dur_cargado)  1)
        (= (dur_cobrado) 1) (= (dur_cocinad lasagna) 40) (= (dur_cocinad macarrones) 35) (= (dur_gasolin) 10)

        (= (distancia casa1 casa2)  2) (= (distancia casa2 casa1)  2)
        (= (distancia casa1 repsol) 3) (= (distancia repsol casa1) 3)
        (= (distancia casa2 repsol) 2) (= (distancia repsol casa2) 2)

        (= (distancia pizzeria casa1)  2)  (= (distancia casa1  pizzeria) 2)
        (= (distancia pizzeria casa2)  3)  (= (distancia casa2  pizzeria) 3)
        (= (distancia pizzeria repsol) 3)  (= (distancia repsol pizzeria) 3)

        (= (gasolina_necesaria casa1 casa2)  20) (= (gasolina_necesaria casa2 casa1)  20)
        (= (gasolina_necesaria casa1 repsol) 25) (= (gasolina_necesaria repsol casa1) 25)
        (= (gasolina_necesaria casa2 repsol) 20) (= (gasolina_necesaria repsol casa2) 20)
        
        (= (gasolina_necesaria pizzeria casa1)  20)  (= (gasolina_necesaria casa1  pizzeria) 20)
        (= (gasolina_necesaria pizzeria casa2)  25)  (= (gasolina_necesaria casa2  pizzeria) 25)
        (= (gasolina_necesaria pizzeria repsol) 25)  (= (gasolina_necesaria repsol pizzeria) 25)

    )

    (:goal
        (and (ENTREGADO lasagna casa1) (ENTREGADO macarrones casa1) (ENTREGADO pizza1 casa2) (EN vespa pizzeria))
    )

    (:metric minimize (total-time)) 

)