import pokemon.*

object calculo{
	method calcularEfectividad(tipoMovimiento,tipoDefensor){
		return tipoMovimiento.efectividad(tipoDefensor)
	}
	
	method calcularStab(tipoPokemon, tipoDeMovimiento){
	    if (tipoPokemon==tipoDeMovimiento) return 1.5 else return 1
	}
	
	method precision(precision){
		if (0.randomUpTo(100)<precision) return 1 else return 0
	}
	
	// Se agrega en consideración el tipo del movimiento, del atacante, y del objetivo
	method danio(atacante,objetivo,movimiento) {
		var danio
		var S = self.calcularStab(atacante.tipo(), movimiento.tipo())
		var E =  self.calcularEfectividad(movimiento.tipo() , objetivo.tipo())
		var numerador = (0.2 * atacante.nivel() + 1) * atacante.danioBase() * movimiento.potencia()
		var denominador = 25 * objetivo.defensaBase()
		danio = 0.01 * S * E * 85 *(numerador/denominador + 2) 
		var danioConFallo = danio*self.precision(movimiento.precision())
		return danioConFallo.roundUp()
	}
	
}

