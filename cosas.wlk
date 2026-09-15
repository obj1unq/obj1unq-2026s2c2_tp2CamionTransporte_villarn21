object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arena{
	var peso = 0
	method peso(){return peso}
	method nivelPeligrosidad() {return 1}
	method peso(_peso){peso = _peso}
}	
object bumblebee{
	var modoAuto = true
	var modoRobot = false
	method peso(){return 800}
	method nivelPeligrosidad() {
		if(modoAuto){
			return 15
		}else{
			return 30
		}
	}
	method modoAuto(){return modoAuto}
	method modoRobot(){return modoRobot}
	method aModoAuto(){ modoAuto = true modoRobot = false}
	method aModoRobot(){ modoAuto = false modoRobot = true}
}

object ladrillos{
	var ladrillos = 0
	method peso(){return ladrillos*2}
	method nivelPeligrosidad() {return 2}
	method ladrillos(_ladrillos){ladrillos = _ladrillos}
}

object bateria{
	var conMisiles = false
	method peso(){return if (conMisiles){return 300}else{return 200}}
	method nivelPeligrosidad() {return if(conMisiles){return 100}else{return 0}}
	method conMisiles(){return conMisiles}
	method conMisiles(_conMisiles){conMisiles = _conMisiles}
}
object residuos{
	var peso = 0
	method peso(){return peso}
	method nivelPeligrosidad() {return 200}
	method peso(_peso){peso = _peso}
}
