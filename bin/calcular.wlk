import pokemon.*

object calculo{
	method calcularEfectividad(tipoMovimiento,tipoDefensor){
		return tipoMovimiento.efectividad(tipoDefensor)
	}
	
	method calcularStab(tipoPokemon, tipoDeMovimiento){
	    if (tipoPokemon==tipoDeMovimiento) return 1.5 else return 1
	}
	
	method precision(precision){
		if (0.randomUpTo(1)<precision) return 1 else return 0
	}
	 
	// Se calcula la capacidad de danio infringido segun el nivel del atacante y su danio base
	method modificadorNivel(atacante) {
		return ((2*atacante.nivel()/5) + 2)*atacante.danioBase()
	} 
	
	// Se calcula cuanto danio produce el movimiento al objetivo sin tener en cuenta los tipos
	method calculoDanioBase(atacante, objetivo, movimiento){
		return self.modificadorNivel(atacante) * movimiento.potencia() / objetivo.defensaBase() / 50
	}
	
	// Se agrega en consideración el tipo del movimiento, del atacante, y del objetivo
	method danio(atacante,objetivo,movimiento) {
		return self.calculoDanioBase(atacante, objetivo, movimiento)  
		//* self.calcularStab( objetivo.tipo() , movimiento.tipo() )  
		//* self.calcularEfectividad( movimiento.tipo() , objetivo.tipo() )
		
	}
	
}
