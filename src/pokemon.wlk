import wollok.game.*
import calcular.*
class Pokemon{
    var property hp
    var property nivel
    const maxHp
    const property movimientos = [] 
    const property spriteFrente
    const property spriteBack
    const property heridoFrente
    const property heridoBack
    const property pokeball
    const property nombre
    var property danioBase
    var property tipo
    var property defensaBase
    var velocidad
    var property imagen = pokeball
    var item
    var property position
 
    method image() = imagen
    
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
    method seleccionar(){
    	imagen = spriteFrente
    }
    method deseleccionar(){
    	imagen = pokeball
    }
    method heridoFrente(){
   		imagen = heridoFrente
    }
    method heridoBack(){
   		imagen = heridoBack
    }
    method mostrarBack(){
    	imagen = spriteBack
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
    var property textColor
    
    method seleccionar(){
    	textColor="FF0000"
    }
    method deseleccionar(){
    	textColor="000000"
    }
}

class Ataque inherits Movimiento(tipoDeMovimiento = "ataque"){
    method efecto(objetivo, atacante) {
        pp--
        const danioRealizado = calculo.danio(atacante,objetivo,self)
        objetivo.recibirDanio(danioRealizado)
	}
	
}

const surf = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="SURF",tipo=agua, tipoDeMovimiento="ataque")
const dormir = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="DORMIR",tipo=agua, tipoDeMovimiento="ataque")
const ola = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="OLA",tipo=agua, tipoDeMovimiento="ataque")
const canto = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="CANTO",tipo=agua, tipoDeMovimiento="ataque")

//const fuego = new Tipo()
//const agua = new Tipo()

/*object crearTipos{

	method instanciar(){
	  fuego.agregarAtaque(fuego,0.5)
	  //fuego.agregarAtaque(planta,2)
	  fuego.agregarAtaque(agua,0.5)
	  //fuego.agregarAtaque(tierra,1)
	  //fuego.agregarAtaque(dragon,0.5)
	  //fuego.agregarAtaque(hielo,2)
	  //fuego.agregarAtaque(roca,0.5)

	  agua.agregarAtaque(fuego,2)
	  //agua.agregarAtaque(planta,0.5)
	  agua.agregarAtaque(agua,0.5)
	  //agua.agregarAtaque(tierra,2)
	  //agua.agregarAtaque(dragon,0.5)
	  //agua.agregarAtaque(hielo,1)
	  //agua.agregarAtaque(roca,2)
	}

}*/



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
	method fuego() = 0.5
	method planta() = 2
	method agua() = 0.5
	method tierra() = 1
	method dragon() = 0.5
	method hielo() = 2
	method roca() = 0.5
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

const snorlax = new Pokemon(position = game.at(1,5), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=10,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="pikachu",
							spriteFrente="pikachuFrente.png", 
							spriteBack="pikachuBack.png", 
							heridoFrente="pikachuFrenteDanio.png",
							heridoBack="pikachuBackDanio.png",
							pokeball="pokeball.png", 
							tipo=agua, 
							velocidad = 40)
							
const snorlax2 = new Pokemon(position = game.at(5,5), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=20,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="pikachu",
							spriteFrente="pikachuFrente.png", 
							spriteBack="pikachuBack.png", 
							heridoFrente="pikachuFrenteDanio.png",
							heridoBack="pikachuBackDanio.png",
							pokeball="pokeball.png", 
							tipo=agua, 
							velocidad = 40)
							
const snorlax3 = new Pokemon(position = game.at(9,5), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=10,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="pikachu",
							spriteFrente="pikachuFrente.png", 
							spriteBack="pikachuBack.png", 
							heridoFrente="pikachuFrenteDanio.png",
							heridoBack="pikachuBackDanio.png",
							pokeball="pokeball.png",
							tipo=agua, 
							velocidad = 40)
							
const snorlax4 = new Pokemon(position = game.at(13,5), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=20,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="pikachu",
							spriteFrente="pikachuFrente.png", 
							spriteBack="pikachuBack.png", 
							heridoFrente="pikachuFrenteDanio.png",
							heridoBack="pikachuBackDanio.png",
							pokeball="pokeball.png", 
							tipo=agua, 
							velocidad = 40)

