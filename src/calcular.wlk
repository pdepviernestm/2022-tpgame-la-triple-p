import pokemon.*




object calculo{
  method calcularEfectividad(tipoAtacante,tipoDefensor){
    if (tipoAtacante == "Fuego"){
      if (tipoDefensor == "Fuego") return 0.5
      if (tipoDefensor == "Planta") return 2
      if (tipoDefensor == "Agua") return 0.5
      if (tipoDefensor == "Tierra") return 1
      if (tipoDefensor == "Dragon") return 0.5
      if (tipoDefensor == "Hielo") return 2
      if (tipoDefensor == "Roca") return 0.5
    }
    if (tipoAtacante == "Planta"){
      if (tipoDefensor == "Agua") return 2
      if (tipoDefensor == "Fuego") return 0.5
      if (tipoDefensor == "Tierra") return 2
      if (tipoDefensor == "Dragon") return 0.5
      if (tipoDefensor == "Hielo") return 1
      if (tipoDefensor == "Roca") return 2
      if (tipoDefensor == "Planta") return 0.5
    }
    if (tipoAtacante == "Agua"){
      if (tipoDefensor == "Agua") return 0.5
      if (tipoDefensor == "Fuego") return 2
      if (tipoDefensor == "Planta") return 0.5
      if (tipoDefensor == "Tierra") return 2
      if (tipoDefensor == "Dragon") return 0.5
      if (tipoDefensor == "Hielo") return 1
      if (tipoDefensor == "Roca") return 2
    }
    if (tipoAtacante == "Tierra"){ 
      if (tipoDefensor == "Agua") return 1
      if (tipoDefensor == "Fuego") return 2
      if (tipoDefensor == "Tierra") return 1
      if (tipoDefensor == "Dragon") return 1
      if (tipoDefensor == "Hielo") return 1
      if (tipoDefensor == "Roca") return 2
      if (tipoDefensor == "Planta") return 0.5
    }
    if (tipoAtacante == "Roca"){
      if (tipoDefensor == "Roca") return 1
      if (tipoDefensor == "Agua") return 1
      if (tipoDefensor == "Fuego") return 2
      if (tipoDefensor == "Planta") return 1
      if (tipoDefensor == "Tierra") return 0.5
      if (tipoDefensor == "Dragon") return 1
      if (tipoDefensor == "Hielo") return 2
    }
    if (tipoAtacante == "Hielo"){
      if (tipoDefensor == "Agua") return 0.5
      if (tipoDefensor == "Fuego") return 0.5
      if (tipoDefensor == "Tierra") return 2
      if (tipoDefensor == "Dragon") return 2
      if (tipoDefensor == "Hielo") return 0.5
      if (tipoDefensor == "Roca") return 1
      if (tipoDefensor == "Planta") return 2
    }
    if (tipoAtacante == "Dragon"){
      if (tipoDefensor == "Agua") return 1
      if (tipoDefensor == "Fuego") return 1
      if (tipoDefensor == "Tierra") return 1
      if (tipoDefensor == "Dragon") return 2
      if (tipoDefensor == "Hielo") return 1
      if (tipoDefensor == "Roca") return 1
      if (tipoDefensor == "Planta") return 1
    }
  }
  
  method calcularStab(tipoPokemon, tipoDeMovimiento){
    if (tipoPokemon==tipoDeMovimiento) return 1.5 else return 1
  }
  
}