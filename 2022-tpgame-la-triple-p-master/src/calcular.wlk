import pokemon.*




object calculo{
  method calcularEfectividad(tipoMovimiento,tipoDefensor){
  	return 1
  }

  method calcularStab(tipoPokemon, tipoDeMovimiento){
    if (tipoPokemon==tipoDeMovimiento) return 1.5 else return 1
  }
  
}