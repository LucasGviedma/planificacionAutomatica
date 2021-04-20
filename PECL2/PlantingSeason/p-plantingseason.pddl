(define (problem p-plantingseason)
        (:domain d-plantingseason)

    (:objects rastrillo1 - rastrillo
              arado1 - arado
              hoz1 - hoz
              guadana1 - guadana
              manguera1 - manguera
              fruta1 - fruta
              trigo1 - secano
              abono1 - abono
              parcela1 parcela2 - terreno
    )

    (:init (cosechado  parcela1)   (no_abonado     parcela1)   (no_abonado     parcela2)   (no_plantada  fruta1)
           (cosechado  parcela2)   (no_rastrillado parcela1)   (no_rastrillado parcela2)   (no_plantada  trigo1)
                                   (no_arado       parcela1)   (no_arado       parcela2)   (no_creciendo fruta1)
           (= (t_abonar)      1)   (no_ocupado     parcela1)   (no_ocupado     parcela2)   (no_creciendo trigo1)
           (= (t_arar)        1)    
           (= (t_cosechar)    1)   (no_en_uso          hoz1)   
           (= (t_plantar)     1)   (no_en_uso    rastrillo1)   
           (= (t_rastrillar)  1)   (no_en_uso        arado1)  
           (= (t_regado)     10)   (no_en_uso     manguera1)
           (= (t_crecer)    100)   (no_en_uso      guadana1)
           
           (= (capacidad_abono_total)  1000)  (= (capacidad_agua_total)  1000)  (= (tamano parcela1) 100)
           (= (capacidad_abono_actual) 1000)  (= (capacidad_agua_actual) 1000)  (= (tamano parcela2) 120)
           
           (= (agua_necesaria_riego fruta1) 2.5)  (= (capacidad_llenado_abono) 0.20)
           (= (agua_necesaria_riego trigo1)   1)  (= (capacidad_llenado_agua)  0.33)
           
           (= (crecimiento_planta_total) 100)
           (= (crecimiento_planta_actual fruta1)  0) (= (crecimiento_planta_actual trigo1)   0)
           (= (crecimiento_planta_fase   fruta1) 20) (= (crecimiento_planta_fase   trigo1)  10)
           
           (= (incremento_crecimiento_por_agua parcela1) 1) 
           (= (incremento_crecimiento_por_agua parcela2) 1)
    )

    (:goal
      (and (lista trigo1) (lista fruta1))
     
     
     )
  
  	 (:metric minimize (total-time)) 
)