import elementos.*

//SUPERCLASE
class Plaga {
    var poblacion

    method nivelDeDaño() = poblacion

    //method transmiteEnfermedades() = poblacion >= 10

    method transmiteEnfermedades() = (poblacion >= 10) && self.condicionAdicional()

    //method condicionAdicional() --> metodo abstracto

    method condicionAdicional() = true 

    method efectoDeAtacar() {
        poblacion += poblacion * 0.1
    }

    method atacar(unElemento) {
        unElemento.recibirAtaque(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plaga {
    var pesoPromedioBicho 

    override method nivelDeDaño() = super() / 2

    override method condicionAdicional() = pesoPromedioBicho >= 10

    override method efectoDeAtacar() {
        super()
        pesoPromedioBicho += 2
    }
}

class Pulgas inherits Plaga {

    override method nivelDeDaño() = super() * 2

    //override method condicionAdicional() = true 
}

class Garrapatas inherits Pulgas {

    override method efectoDeAtacar() {
        poblacion += poblacion * 0.2
    }
}

class Mosquitos inherits Plaga {

    override method condicionAdicional() = poblacion % 3 == 0
}