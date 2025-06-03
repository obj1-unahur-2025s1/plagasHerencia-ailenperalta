class Hogar {
    var mugre 
    const confort

    method esBueno() = mugre <= confort / 2

    method recibirAtaque(unaPlaga) {
        mugre += unaPlaga.nivelDeDaño()
    } 
}

class Huerta {
    var produccion
    
    method esBueno() = produccion > nivelMinimoProduccion.valor()

    method recibirAtaque(unaPlaga) {
        produccion = 0.max(produccion - (unaPlaga.nivelDeDaño() * 0.1 
        + if (unaPlaga.transmiteEnfermedades()) 10 else 0))
    }
}

object nivelMinimoProduccion {
    var property valor = 100  
}

class Mascota {
    var salud 

    method esBueno() = salud > 250

    method recibirAtaque(unaPlaga) {
        salud = salud - (if (unaPlaga.transmiteEnfermedades()) unaPlaga.nivelDeDaño() else 0).max(0)
    }
}

class Barrio {
    const elementos = []

    method esBueno(unElemento) = unElemento.esBueno() 

    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()

    method cantElementosBuenos() = elementos.count({e => e.esBueno()})

    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}