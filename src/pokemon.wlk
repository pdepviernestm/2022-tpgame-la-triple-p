import wollok.game.*
import calcular.*
class Pokemon{
    var hp
    var nivel
    const maxHp
    const movimientos = [] 
    const sprite
    var property danioBase
    var property tipo
    var property defensaBase
    var velocidad
    var item
    
    method hp(nuevoHP){
        hp = nuevoHP.min(maxHp)
    }
    method image(){
        return sprite
    }
    method hp() = hp
    method hacer(movimiento, objetivo){
    	movimiento.efecto(objetivo, self)
    }
    method recibirDanio(danioRealizado){
    	hp = 0.max(hp - danioRealizado)
    }
    method evolucionar(){
    	nivel+=1
    }
    method danioBase(nuevoDanio){
    	danioBase = nuevoDanio
    }
    method defensaBase(nuevaDef){
    	defensaBase = nuevaDef
    }
    method tipo(nuevoTipo){
    	tipo = nuevoTipo
    }
}

class Item{
    const modificador
    const alcance

    method efecto(pokemon){
        pokemon.alcance(pokemon.alcance()*modificador)
    }
}


class Movimiento{
	var pp
    const ppMax
    const property tipo
    const property potencia
    const precision
    var property tipoDeMovimiento
}

class Ataque inherits Movimiento(tipoDeMovimiento = "ataque"){
    method efecto(objetivo, atacante) {
        pp--
        const efectividad = calculo.calcularEfectividad(self.tipoDeMovimiento(),objetivo.tipo())  
        const stab = calculo.calcularStab(atacante.tipo(), self.tipo())
        const danioRealizado = ((((((( (2*atacante.nivel()) /5) +2)*(atacante.danioBase() ) ) *self.potencia() ) /objetivo.defensaBase() )/50)*stab )*efectividad
        objetivo.recibirDanio(danioRealizado)
	}
}

