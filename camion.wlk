import cosas.*

object camion {
	const property cosas = #{}

	method puedeCircular(peligro){
		return not(self.estaExcedidoEnPeso()) && self.peligrosidadMayorA(peligro).isEmpty()
	}
	method peligrosidadMayorA(peligro){
		return cosas.filter({cosa => self.nivelPeligrosidadDe(cosa) > peligro})
	}
	method masPeligrosoQue(_cosa){
		return cosas.filter({cosa => self.nivelPeligrosidadDe(cosa) > self.nivelPeligrosidadDe(_cosa)})
	}
	method algoEsDePeligro(peligro){
		return cosas.filter({cosa => self.nivelPeligrosidadDe(cosa) == peligro})
	}
	method nivelPeligrosidadDe(cosa){
		return cosa.nivelPeligrosidad()
	}
	method estaExcedidoEnPeso(){
		return self.pesoTotal() > 2500
	}
	method pesoTotal(){
		return cosas.sum({cosa => self.pesoDeCosa(cosa)}) + 1000
	}
	method algoPesa(kg){
		return cosas.any({cosa => self.pesoDeCosa(cosa) == kg})
	}
	method esPesoPar(){
		return cosas.all({cosa => self.pesoDeCosa(cosa).even()})
	}
	method pesoDeCosa(cosa){
		return cosa.peso()
	}
	method cosasCargadas(){
		return cosas
	}
	method cargar(unaCosa) {
		if(not cosas.contains(unaCosa)){
			cosas.add(unaCosa)
		}
	}
	method descargar(unaCosa) {
		if(cosas.contains(unaCosa)){
			cosas.remove(unaCosa)	
		}
	}
}
