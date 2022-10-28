import wollok.game.*
import calcular.*
class Pokemon{
    var property hp
    var property nivel
    const maxHp
    const property movimientos = [] 
    const property sprite
    var property danioBase
    var property tipo
    var property defensaBase
    var velocidad
    var item
    var property position
    
    method image() = sprite
    
    method hp(nuevoHP){
        hp = nuevoHP.min(maxHp)
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
    var property text
    var property nombre
    
}

class Ataque inherits Movimiento(tipoDeMovimiento = "ataque"){
    method efecto(objetivo, atacante) {
        pp--
        const efectividad = calculo.calcularEfectividad(self.tipo(),objetivo.tipo())  
        const stab = calculo.calcularStab(atacante.tipo(), self.tipo())
        const danioRealizado = ((((((( (2*atacante.nivel()) /5) +2)*(atacante.danioBase() ) ) *self.potencia() ) /objetivo.defensaBase() )/50)*stab )*efectividad
        objetivo.recibirDanio(danioRealizado)
	}
}


object fuego{
	method fuego() = 0.5
	method planta() = 2
	method agua() = 0.5
	method tierra() = 1
	method dragon() = 0.5
	method hielo() = 2
	method roca() = 0.5
}
object planta{
	method fuego() = 0.5
	method planta() = 2
	method agua() = 0.5
	method tierra() = 1
	method dragon() = 0.5
	method hielo() = 2
	method roca() = 0.5
}

object agua{
	method fuego() = 2
	method planta() =0.5 
	method agua() = 0.5
	method tierra() = 2
	method dragon() = 0.5
	method hielo() = 1
	method roca() = 2
}

object tierra{
	method fuego() = 2
	method planta() = 0.5
	method agua() = 1
	method tierra() = 1
	method dragon() = 1
	method hielo() = 1
	method roca() = 2
}

object dragon{
	method fuego() = 1
	method planta() = 1
	method agua() = 1
	method tierra() = 1
	method dragon() = 2
	method hielo() = 1
	method roca() = 1
}

object hielo{
	method fuego() = 0.5
	method planta() = 2
	method agua() = 0.5
	method tierra() = 2
	method dragon() = 2
	method hielo() = 0.5
	method roca() = 1
}

object roca{
	method fuego() = 2
	method planta() = 1
	method agua() = 1
	method tierra() = 0.5
	method dragon() = 1
	method hielo() = 2
	method roca() = 1
}

const surf = new Ataque(potencia=15,pp=20,ppMax=25,precision=80,nombre="SURF",text="SURF",tipo=agua, tipoDeMovimiento="ataque")
const dormir = new Ataque(potencia=15,pp=20,ppMax=25,precision=80,nombre="DORMIR",text="DORMIR",tipo=agua, tipoDeMovimiento="ataque")
const ola = new Ataque(potencia=15,pp=20,ppMax=25,precision=80,nombre="OLA",text="OLA",tipo=agua, tipoDeMovimiento="ataque")
const canto = new Ataque(potencia=15,pp=20,ppMax=25,precision=80,text="CANTO",nombre="CANTO",tipo=agua, tipoDeMovimiento="ataque")

const snorlax = new Pokemon(position = game.at(1,5), movimientos = [surf, dormir, ola, canto] ,danioBase=50,defensaBase=40,hp=300,item="",maxHp=300, nivel=2, sprite="snorlax.png", tipo=agua, velocidad = 40)
const snorlax2 = new Pokemon(position = game.at(15,13), movimientos = [surf, dormir, ola, canto] ,danioBase=50,defensaBase=40,hp=200,item="",maxHp=300, nivel=2, sprite="snorlax.png", tipo=agua, velocidad = 40)
