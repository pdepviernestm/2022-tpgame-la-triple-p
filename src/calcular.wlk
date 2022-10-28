import pokemon.*




object calculo{
  method calcularEfectividad(tipoMovimiento,tipoDefensor){
  	return 1
  }

  method calcularStab(tipoPokemon, tipoDeMovimiento){
    if (tipoPokemon==tipoDeMovimiento) return 1.5 else return 1
  }
  method precision(precision){
  	if (0.randomUpTo(1)<precision) return 1 else return 0
  }
}

  class Tipo{
	var efectividades = new Dictionary()
	
	method agregarAtaque(tipo, valor)=efectividades.put(tipo,valor)
  	method efectividadContra(tipo)= efectividades.get(tipo)
  }
  
  
  fuego = new Tipo()
  fuego.agregarAtaque(fuego,0.5)
  fuego.agregarAtaque(planta,2)
  fuego.agregarAtaque(agua,0.5)
  fuego.agregarAtaque(tierra,1)
  fuego.agregarAtaque(dragon,0.5)
  fuego.agregarAtaque(hielo,2)
  fuego.agregarAtaque(roca,0.5)

  agua = new Tipo()
  agua.agregarAtaque(fuego,2)
  agua.agregarAtaque(planta,0.5)
  agua.agregarAtaque(agua,0.5)
  agua.agregarAtaque(tierra,2)
  agua.agregarAtaque(dragon,0.5)
  agua.agregarAtaque(hielo,1)
  agua.agregarAtaque(roca,2)
