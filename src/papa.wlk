object papa {
	var cantidad = 100
	var calidad = calidadBuena
	var impuesto = impuestoSimple
	var retencion = retencionNula
	
	method cantidad() = cantidad
	
	method cantidad(cantidadNueva) {
		cantidad = cantidadNueva
	}
	
	method calidad(calidadNueva){
		calidad = calidadNueva
	}
	
	method impuesto(impuestoNuevo){
		impuesto = impuestoNuevo
	}
	
	method retencion(retencionNueva){
		retencion = retencionNueva
	}
	
	method costoProduccion() = calidad.costo(cantidad)
	
	method importeTotal() = self.costoProduccion() + impuesto.monto(self.costoProduccion()) + retencion.importe(self)
	
}

// CALIDAD
object calidadBuena{
	method costo(cantidad) = 3* cantidad
}

object calidadRegular{
	method costo(cantidad) = cantidad * pepe.cotizacion()
}

object calidadPremium{
	method costo(cantidad) = calidadBuena.costo(cantidad) * 1.5
}

object pepe{
	var cotizacion = 1
	
	method cotizacion(cotizacionNueva) {
		cotizacion = cotizacionNueva
	}
	
	method cotizacion() = cotizacion
}

//IMPUESTOS

object impuestoSimple{
	method monto(costo) = 0.1 * costo
}

object impuestoConGarantia{
	method monto(costo) = 100.max(0.05*costo)
}

object impuestoInventado{
	method monto(costo) =  costo / 2 

}


//RETENCIONES

object retencionEstatista{
	method importe(producto) = if (producto.costoProduccion() > 1000) 200 else 300
}

object retencionPrivatizadora{
	method importe(producto) = 50 + producto.cantidad() / 10 
}

object retencionDemagogica{
	var valor = 100
	
	method importe(producto) = valor
	
	method valor(valorNuevo){
		valor = valorNuevo 
	}
}

object retencionNula{
	method importe(producto) = 0
}

// BATATA

object batata {
	var impuesto = impuestoSimple
	var costoProduccion = 500 
	
	method costoProduccion() = costoProduccion 
	
	method costoProduccion(costoNuevo){
		costoProduccion = costoNuevo
	}
	
	method impuesto(impuestoNuevo){
		impuesto = impuestoNuevo
	}
	
	method importeTotal() = costoProduccion + impuesto.monto(self.costoProduccion())
	
}

object impuestoCompuesto{
	method monto(costo) = (impuestoSimple.monto(costo) + impuestoConGarantia.monto(costo)) / 2
}


// ZAPALLO

object zapallo {
	var cantidad = 1
	var retencion = retencionNula
	
	method cantidad(cantidadNueva) {
		cantidad = cantidadNueva
	}

	method retencion(retencionNueva){
		retencion = retencionNueva
	}
	
	method costoProduccion() = cantidad * pepe.cotizacion()
	
	method importeTotal() = self.costoProduccion() + retencion.importe(self) / 2
	
}
