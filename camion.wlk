import cosas.*
object almacen {
  var elementos = #{}
  method descargarElementos(transporte){elementos.addAll(transporte.cosas())}
  method cargar(elemento){elementos.add(elemento)}
  method elementos(){return elementos}
}
object ruta9{
  var peligrosidadMaxima = 20
  method puedeTransitar(vehiculo){
	if(vehiculo.puedeCircular(peligrosidadMaxima)){
		self.error("No puede circular")
	}
  }
}
object caminoVecinal{
	var pesoPermitido = 0
	method puedeTransita(vehiculo){
		if(vehiculo.pesoTotal() <= pesoPermitido){
			self.error("Exceso de peso")
		}
	}
	method pesoPermitido(peso){pesoPermitido = peso}
}
object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500
	method transportar(destino, camino){
		camino.validarTranporte()
		destino.descargarElementos()
		cosas.clear()
		}
	method accidente(){cosas.forEach({cosa => cosa.sufrirAccidente()})}
	method bultoTotales(){return cosas.sum({cosa=> cosa.bulto()})}
	method pesosElementos(){return cosas.map({cosa=> cosa.peso()})}
	method elementoMasPesado(){return cosas.max({cosa=> cosa.peso()})}
	method pesoEstaEntre(minimo,maximo){
		return cosas.any({cosa=> cosa.peso().between(minimo, maximo)})
	}
	method puedeCircular(peligro){
    	return not(self.estaExcedidoEnPeso()) && not(self.hayAlgoMasPeligrosoQue(peligro))
}
	method hayAlgoMasPeligrosoQue(peligro){
    	return cosas.any({cosa => self.nivelPeligrosidadDe(cosa) > peligro})
}
	method masPeligrosoQue(_cosa){
		return cosas.filter({cosa => self.nivelPeligrosidadDe(cosa) > self.nivelPeligrosidadDe(_cosa)})
	}
	method algoEsDePeligro(peligro){
		return cosas.filter({cosa => self.nivelPeligrosidadDe(cosa) == peligro})
		}
	method nivelPeligrosidadDe(cosa){return cosa.nivelPeligrosidad()}
	method estaExcedidoEnPeso(){return self.pesoTotal() > pesoMaximo}
	method pesoTotal(){
		return cosas.sum({cosa => self.pesoDeCosa(cosa)}) + tara}
	method algoPesa(kg){
		return cosas.any({cosa => self.pesoDeCosa(cosa) == kg})}
	method esPesoPar(){
		return cosas.all({cosa => self.pesoDeCosa(cosa).even()})}
	method pesoDeCosa(cosa){return cosa.peso()}
	method cosasCargadas(){return cosas}
	method cargar(unaCosa){
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarCarga(unaCosa){
		if(cosas.contains(unaCosa)){
			self.error("Ya se cuenta con " + unaCosa + " en la coleccion")
		}
	}
	method validarDescarga(unaCosa){
		if(not cosas.contains(unaCosa)){
			self.error("No se cuenta con " + unaCosa + " en la coleccion")
		}
	}
}
/*Describir los polimorfismos asociados a las colecciones:

1)¿Qué nombre tiene el tipo de los objetos polimórficos?
2)¿Qué mensajes componen ese tipo?
3)¿Qué objetos son los emisores de los mensajes polimórficos?
*/
/*
1)cosa y modo
2)sufrirAccidente, bulto, peso, nivelPeligrosidad
3)camion 
*/