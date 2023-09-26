import ClasesAutos.*


class Dependencias {
	var property cantidadEmpleado = 0
	var rodados = []
	
	method agregarAFlota(unRodado){
		rodados.add(unRodado)
	}
	
	method quitarDeFlota(unRodado){
		rodados.remove(unRodado)
	}
	
	method pesoTotalFlota(){
		return rodados.sum({rodado => rodado.peso()})
	}
	
	method todosSuperanXVelocidad(unaVelocidad){
		return rodados.all({r => r.velocidad() >= unaVelocidad})
	}
	
	method estaBienEquipada(){
		return rodados.size() >= 3 && self.todosSuperanXVelocidad(100)
	}
	
	method capacidadTotalEnColor(unColor){
		return self.rodadosDeUnColor(unColor)
	}
	
	method rodadosDeUnColor(unColor) {
		return rodados.filter({r => r.color() == unColor}).sum({r => r.capacidad()})
	}
	
	method colorDelRodadoMasRapido(){
		return rodados.max({r => r.velocidad()})
	}
	
	method rodadoMasRapido(){
		if(rodados.isEmpty())
			self.error("No se puede calcular maximo")
		return rodados.max({r => r.velocidad()})
	}
	
	method capacidadDeLaFlota(){
		return rodados.sum({r => r.capacidad()})
	}
	
	method capacidadFaltante(){
		return 0.max(cantidadEmpleado - self.capacidadDeLaFlota())
	}
	
	method esGrande(){
		return cantidadEmpleado >= 40 && rodados.size() >= 5
	}
	
}
