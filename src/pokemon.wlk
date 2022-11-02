import wollok.game.*
import calcular.*

//--------------------------- Clase Pokemones --------------------------//
class Pokemon{
    var property hp
    var property nivel
    const property maxHp
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

//--------------------------- Clase Items --------------------------//

class Item{
    const modificador
    const alcance

    method efecto(pokemon){
        pokemon.alcance(pokemon.alcance()*modificador)
    }
}

//--------------------------- Clases Movimientos --------------------------//
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

class Curacion inherits Movimiento(tipoDeMovimiento = "curacion"){
    const property hpCurado

    method efecto(objetivo, atacante) {
        pp--
        const nuevoHp = (objetivo.hp() + hpCurado).min(objetivo.hpMax())
        objetivo.hp(nuevoHp)
	}
}

//--------------------------- Clase Tipos --------------------------//

class Tipo{
	var property esFuerteContra = []
	var property esDebilContra = []
	
	method efectividad(unTipo){
		if (esFuerteContra.contains(unTipo)) {
			return 2
		} else if (esDebilContra.contains(unTipo)) {
			return 0.5
		}
		else return 1
	}

}


//------------------------- Instancias -----------------------------//

// Tipos
const planta = new Tipo(esFuerteContra = [planta], esDebilContra = [fuego,veneno])
const fuego = new Tipo(esFuerteContra = [planta], esDebilContra = [agua,fuego])
const agua = new Tipo(esFuerteContra = [planta], esDebilContra = [agua,fuego])
const electrico = new Tipo(esFuerteContra = [agua], esDebilContra = [planta])
const veneno = new Tipo(esFuerteContra = [planta], esDebilContra = [veneno])

// Movimientos
const surf = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="SURF",tipo=agua, tipoDeMovimiento="ataque")
const dormir = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="DORMIR",tipo=agua, tipoDeMovimiento="ataque")
const ola = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="OLA",tipo=agua, tipoDeMovimiento="ataque")
const canto = new Ataque(textColor="000000",potencia=15,pp=20,ppMax=25,precision=80,text="CANTO",tipo=agua, tipoDeMovimiento="ataque")

// Pokemones
const pikachu = new Pokemon(position = game.at(1,7), 
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
							tipo=electrico, 
							velocidad = 40)
							
const gengar = new Pokemon(position = game.at(5,7), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=20,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="gengar",
							spriteFrente="GengarFrente.png", 
							spriteBack="GengarBack.png", 
							heridoFrente="GengarFrenteDanio.png",
							heridoBack="GengarBackDanio.png",
							pokeball="pokeball.png", 
							tipo=veneno, 
							velocidad = 40)
							
const charmander = new Pokemon(position = game.at(9,7), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=10,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="charmander",
							spriteFrente="CharmanderFrente.png", 
							spriteBack="CharmanderBack.png", 
							heridoFrente="CharmanderFrenteDanio.png",
							heridoBack="CharmanderBackDanio.png",
							pokeball="pokeball.png",
							tipo=fuego, 
							velocidad = 40)
							
const bulbasaur = new Pokemon(position = game.at(13,7), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=20,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="bulbasaur",
							spriteFrente="BulbasaurFrente.png", 
							spriteBack="BulbasaurBack.png", 
							heridoFrente="BulbasaurFrenteDanio.png",
							heridoBack="BulbasaurBackDanio.png",
							pokeball="pokeball.png", 
							tipo=planta, 
							velocidad = 40)

const vaporeon = new Pokemon(position = game.at(13,2), 
							movimientos = [surf, dormir, ola, canto],
							danioBase=50,
							defensaBase=40,
							hp=20,
							item="",
							maxHp=300, 
							nivel=2, 
							nombre="vaporeon",
							spriteFrente="VaporeonFrente.png", 
							spriteBack="VaporeonBack.png", 
							heridoFrente="VaporeonFrenteDanio.png",
							heridoBack="VaporeonBackDanio.png",
							pokeball="pokeball.png", 
							tipo=agua, 
							velocidad = 40)

