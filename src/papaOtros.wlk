object papa {
	var cantidad = 100
	var calidad = calidadBuena
	var impuesto = impuestoSimple
	var retencion = retencionNula
	
	var importeTotal = 330
	
	method cantidad() = cantidad
	
	method cantidad(cantidadNueva) {
		cantidad = cantidadNueva
		self.calcularImporteTotal()
	}
	
	method calidad(calidadNueva){
		calidad = calidadNueva
		self.calcularImporteTotal()
	}
	
	method impuesto(impuestoNuevo){
		impuesto = impuestoNuevo
		self.calcularImporteTotal()
	}
	
	method retencion(retencionNueva){
		importeTotal = importeTotal - retencion.importe(self) + retencionNueva.importe(self)
		retencion = retencionNueva
	}

	method costoProduccion() = calidad.costo(cantidad)
	
	method importeTotal() = importeTotal

	method calcularImporteTotal() {
		importeTotal = self.costoProduccion() + impuesto.monto(self.costoProduccion()) + retencion.importe(self)
	}
	
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
	var costoProduccion = 500 
	
	method costoProduccion() = costoProduccion 
	
	method costoProduccion(costoNuevo){
		costoProduccion = costoNuevo
	}
	
	method importeTotal(impuesto) = costoProduccion + impuesto.monto(self.costoProduccion())
	
}

object impuestoCompuesto{
	method monto(costo) = (impuestoSimple.monto(costo) + impuestoConGarantia.monto(costo)) / 2
}


// ZAPALLO

object zapallo {
	var cantidad = 1

	var valorRetencionDemagogica = 100
	
	method valorRetencionDemagogica(valorNuevo){
		valorRetencionDemagogica = valorNuevo 
	}
		
	method cantidad(cantidadNueva) {
		cantidad = cantidadNueva
	}

	method costoProduccion() = cantidad * pepe.cotizacion()
	
	method importeTotalRetencionNula() = self.costoProduccion() 

	method importeTotalRetencionDemagogica() = self.costoProduccion() + valorRetencionDemagogica

	method importeTotalRetencionEstatista() = self.costoProduccion() + if (self.costoProduccion() > 1000) 200 else 300
	
	method importeTotalRetencionPrivatizadora() = 50 + cantidad / 10 
	
}
