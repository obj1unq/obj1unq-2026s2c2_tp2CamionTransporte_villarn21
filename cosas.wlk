object knightRider {
	method sufrirAccidente(){}
	method bulto(){return 1 }
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object arena{
	var peso = 0
	method sufrirAccidente(){peso = peso + 20}
	method bulto(){return 1 }
	method peso(){return peso}
	method nivelPeligrosidad() {return 1}
	method peso(_peso){peso = _peso}
}	
object auto {
  method peligrosidad(){return 15}
}
object robot {
  method peligrosidad(){return 30}
}
object bumblebee{
	var modo = auto
	method sufrirAccidente(){self.cambioDeEstado()}
	method cambioDeEstado(){if(modo == auto){modo = robot}else{modo = auto}}
	method bulto(){return 2}
	method peso(){return 800}
	method nivelPeligrosidad() {return modo.peligrosidad()}
	method modo(){return modo}
	method modo(_modo){modo = _modo	}
}

object ladrillos{
	var ladrillos = 0
	method sufrirAccidente(){ladrillos = 0.max(ladrillos - 12)}
	method bulto(){return self.bultosPorLadrillos()}
	method bultosPorLadrillos(){return if(ladrillos <= 100){1}else if(ladrillos.between(101, 300)){2}else{3}}
	method peso(){return ladrillos*2}
	method nivelPeligrosidad() {return 2}
	method ladrillos() = ladrillos 
	method ladrillos(_ladrillos){ladrillos = _ladrillos}
}

object bateria{
	var conMisiles = false
	method sufrirAccidente(){conMisiles = false}
	method bulto(){return if(conMisiles){2}else{1}}
	method peso(){return if(conMisiles){300}else{200}}
	method nivelPeligrosidad() {return if(conMisiles){100}else{0}}
	method conMisiles(){return conMisiles}
	method conMisiles(_conMisiles){conMisiles = _conMisiles}
}
object residuos{
	var peso = 0
	method sufrirAccidente(){peso = peso + 15}
	method bulto(){return 1 }
	method peso(){return peso}
	method nivelPeligrosidad() {return 200}
	method peso(_peso){peso = _peso}
}
object contenedor {
  const elementos = #{}
  method sufrirAccidente(){elementos.forEach({elemento=> elemento.sufrirAccidente()})}
  method bulto(){return 1 + elementos.sum({elemento=> elemento.bulto()})}
  method nivelPeligrosidad(){	
	return if(elementos.isEmpty()){0}else{elementos.map({elemento => elemento.nivelPeligrosidad()}).max()}}
  method peso(){return 100 + self.pesoDeElementos()}
  method pesoDeElementos(){return elementos.sum({elemento => elemento.peso()})}
  method cargar(elemento){elementos.add(elemento)}
  method elementos(){return elementos}
}

object embalaje {
  var elemento = null
  method sufrirAccidente(){}
  method bulto(){return 2}
  method nivelPeligrosidad(){return elemento.nivelPeligrosidad() / 2}
  method peso(){return elemento.peso()}
  method cargar(_elemento){elemento.add(_elemento)}
}