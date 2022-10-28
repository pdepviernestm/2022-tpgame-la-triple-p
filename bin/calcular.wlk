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
/* 
 class Tipo{
	var efectividades = new Dictionary()
	
	method agregarAtaque(tipo, valor)=efectividades.put(tipo,valor)
  	method efectividadContra(tipo)= efectividades.get(tipo)
  }
 * */
  
  
  