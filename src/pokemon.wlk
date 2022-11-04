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
    //var velocidad
    var property imagen = pokeball
    //var item
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

//--------------------------- Clases Movimientos --------------------------//
class Movimiento{
    const property tipo
    var property tipoDeMovimiento
    var property text
    var property textColor
    const property potencia
	const property precision
    

    method seleccionar(){
    	textColor="FF0000"
    }
    method deseleccionar(){
    	textColor="000000"
    }
}

class Ataque inherits Movimiento(tipoDeMovimiento = "ataque"){
	method efecto(objetivo, atacante) {
        const danioRealizado = calculo.danio(atacante,objetivo,self)
        objetivo.recibirDanio(danioRealizado)
        game.sound("Danio.mp3").play()
        return danioRealizado
	}
}

class Curacion inherits Movimiento(tipoDeMovimiento = "curacion"){
    const property hpCurado

    method efecto(atacante, objetivo) {
        const nuevoHp = (objetivo.hp() + hpCurado*objetivo.maxHp()).min(objetivo.maxHp())
        objetivo.hp(nuevoHp)
        game.sound("Curacion.mp3").play()
        return nuevoHp
	}
}

//--------------------- Visualizar movimientos ---------------------//

class VisualizadorTipoMovimiento{
	var property text
	const property textColor = "000000"
}

class VisualizadorPotencia{
	var property text
	const property textColor = "000000"
}

class VisualizadorPrecision{
	var property text
	const property textColor = "000000"
}

class VisualizadorHpCurado{
	var property text
	const property textColor = "000000"
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
const agua = new Tipo()
const planta= new Tipo()
const fuego= new Tipo()
const electrico= new Tipo()
const veneno= new Tipo()
const normal= new Tipo()
object instanciarTipos{
	method instanciar(){
		agua.esFuerteContra([fuego])
		agua.esDebilContra([agua,planta])
		planta.esFuerteContra([agua])
		planta.esDebilContra([fuego,veneno,planta])
		fuego.esFuerteContra([planta])
		fuego.esDebilContra([fuego,agua])
		electrico.esFuerteContra([agua])
		electrico.esDebilContra([electrico,planta])
		veneno.esFuerteContra([planta])
		veneno.esDebilContra([veneno])
		normal.esFuerteContra()
		normal.esDebilContra()
	}
}

// Movimientos
const surf = new Ataque(textColor="000000",potencia=15,precision=80,text="SURF",tipo=agua, tipoDeMovimiento="ataque")
const aguaCola = new Ataque(textColor="000000",potencia=90,precision=90,text="AGUA COLA",tipo=agua, tipoDeMovimiento="ataque")
const cascada = new Ataque(textColor="000000",potencia=80,precision=100,text="CASCADA",tipo=agua, tipoDeMovimiento="ataque")

const latigoCepa = new Ataque(textColor="000000",potencia=45,precision=100,text="LÁTIGO CEPA",tipo=planta, tipoDeMovimiento="ataque")
const sintesis = new Curacion(textColor="000000",potencia=0,precision=100,hpCurado=0.5,text="SÍNTESIS",tipo=planta, tipoDeMovimiento="curacion")
const gigadrenado = new Ataque(textColor="000000",potencia=75,precision=100,text="GIGADRENADO",tipo=planta, tipoDeMovimiento="ataque")

const ondaIgnea = new Ataque(textColor="000000",potencia=95,precision=90,text="ONDA ÍGNEA",tipo=fuego, tipoDeMovimiento="ataque")
const colmilloIgneo = new Ataque(textColor="000000",potencia=65,precision=100,text="COLMILLO ÍGNEO",tipo=fuego, tipoDeMovimiento="ataque")

const chispa = new Ataque(textColor="000000",potencia=65,precision=100,text="CHISPA",tipo=electrico, tipoDeMovimiento="ataque")
const impactrueno = new Ataque(textColor="000000",potencia=40,precision=100,text="IMPACTRUENO",tipo=electrico, tipoDeMovimiento="ataque")

const ondaToxica = new Ataque(textColor="000000",potencia=95,precision=100,text="ONDA TOXICA",tipo=veneno, tipoDeMovimiento="ataque")
const bombaLodo = new Ataque(textColor="000000",potencia=90,precision=80,text="BOMBA LODO",tipo=veneno, tipoDeMovimiento="ataque")

const descanso = new Curacion(textColor="000000",potencia=0,precision=100,hpCurado=1,text="DESCANSO",tipo=normal, tipoDeMovimiento="curacion")
const ecoVoz = new Ataque(textColor="000000",potencia=40,precision=100,text="ECO VOZ",tipo=normal, tipoDeMovimiento="ataque")
const dobleFilo = new Ataque(textColor="000000",potencia=120,precision=100,text="DOBLE FILO",tipo=normal, tipoDeMovimiento="ataque")
const corte = new Ataque(textColor="000000",potencia=50,precision=95,text="CORTE",tipo=normal, tipoDeMovimiento="ataque")


// Pokemones
const pikachu = new Pokemon(position = game.at(1,7), 
							movimientos = [dobleFilo, impactrueno, chispa, descanso],
							danioBase=91,
							defensaBase=76,
							hp=126,
							maxHp=126, 
							nivel=50, 
							nombre="  Pikachu",
							spriteFrente="pikachuFrente.png", 
							spriteBack="pikachuBack.png", 
							heridoFrente="pikachuFrenteDanio.png",
							heridoBack="pikachuBackDanio.png",
							pokeball="pokeball.png", 
							tipo=electrico 
							)
							
const gengar = new Pokemon(position = game.at(5,7), 
							movimientos = [bombaLodo, ondaToxica, gigadrenado, descanso],
							danioBase=101,
							defensaBase=96,
							hp=151,
							maxHp=151, 
							nivel=50, 
							nombre="  Gengar",
							spriteFrente="GengarFrente.png", 
							spriteBack="GengarBack.png", 
							heridoFrente="GengarFrenteDanio.png",
							heridoBack="GengarBackDanio.png",
							pokeball="pokeball.png", 
							tipo=veneno 
							)
							
const charmander = new Pokemon(position = game.at(9,7), 
							movimientos = [ecoVoz, ondaIgnea, corte, colmilloIgneo],
							danioBase=88,
							defensaBase=79,
							hp=130,
							maxHp=130, 
							nivel=50, 
							nombre="Charmander",
							spriteFrente="CharmanderFrente.png", 
							spriteBack="CharmanderBack.png", 
							heridoFrente="CharmanderFrenteDanio.png",
							heridoBack="CharmanderBackDanio.png",
							pokeball="pokeball.png",
							tipo=fuego) 
							
const bulbasaur = new Pokemon(position = game.at(13,7), 
							movimientos = [corte, bombaLodo, sintesis, latigoCepa],
							danioBase=85,
							defensaBase=85,
							hp=136,
							maxHp=136, 
							nivel=50, 
							nombre="Bulbasaur",
							spriteFrente="BulbasaurFrente.png", 
							spriteBack="BulbasaurBack.png", 
							heridoFrente="BulbasaurFrenteDanio.png",
							heridoBack="BulbasaurBackDanio.png",
							pokeball="pokeball.png", 
							tipo=planta) 

const vaporeon = new Pokemon(position = game.at(13,2), 
							movimientos = [cascada, ecoVoz, dobleFilo, aguaCola],
							danioBase=101,
							defensaBase=96,
							hp=221,
							maxHp=221, 
							nivel=50, 
							nombre="  Vaporeon",
							spriteFrente="VaporeonFrente.png", 
							spriteBack="VaporeonBack.png", 
							heridoFrente="VaporeonFrenteDanio.png",
							heridoBack="VaporeonBackDanio.png",pokeball="pokeball.png", 
							tipo=agua)