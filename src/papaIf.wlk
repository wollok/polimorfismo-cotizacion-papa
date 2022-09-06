object papa {
	var cantidad = 100
	var calidad = "calidadBuena"
	var impuesto = "impuestoSimple"
	var retencion = "retencionNula"
	
	var valorRetencionDemagogica = 100
	
	method valorRetencionDemagogica(valorNuevo){
		valorRetencionDemagogica = valorNuevo 
	}
		
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
	
	method importeTotal() = self.costoProduccion() + self.montoImpuesto() + self.importeRetencion()
	
	method costoProduccion() {
		if (calidad == "calidadBuena")
			return cantidad * 3
		if (calidad == "calidadRegular")	
			return cantidad * pepe.cotizacion()
		if (calidad == "calidadPremium")
			return cantidad * 3 * 1.5
		return 0
	}
	
	method montoImpuesto() {
		if (impuesto == "impuestoSimple")
			return 	0.1 * self.costoProduccion()
		if (impuesto == "impuestoConGarantia")	
			return 100.max(0.05*self.costoProduccion())
		if (impuesto == "impuestoInventado")
			return self.costoProduccion() / 2 
		return 0
	}
	
	method importeRetencion() {
		if (retencion == "retencionEstatista")
			return if (self.costoProduccion() > 1000) 200 else 300
		if (retencion == "retencionPrivatizadora")	
			return 50 + cantidad / 10 
		if (retencion == "retencionDemagogica")
			return valorRetencionDemagogica 
		return 0
	}
}


object pepe{
	var cotizacion = 1
	
	method cotizacion(cotizacionNueva) {
		cotizacion = cotizacionNueva
	}
	
	method cotizacion() = cotizacion
}


// BATATA

object batata {
	var impuesto = "impuestoSimple"
	var costoProduccion = 500 
	
	method costoProduccion(costoNuevo){
		costoProduccion = costoNuevo
	}
	
	method impuesto(impuestoNuevo){
		impuesto = impuestoNuevo
	}
	
	method importeTotal() = costoProduccion + self.montoImpuesto()
	
		method montoImpuesto() {
			if (impuesto == "impuestoSimple")
				return 	0.1 * costoProduccion
			if (impuesto == "impuestoConGarantia")	
				return 100.max(0.05 * costoProduccion)
			if (impuesto == "impuestoInventado")
				return costoProduccion / 2 
			if (impuesto == "impuestoCompuesto")
				return (0.1 * costoProduccion + 100.max(0.05 * costoProduccion)) / 2 
			return 0
	}
}


// ZAPALLO

object zapallo {
	var cantidad = 1
	var retencion = "retencionNula"
	
	var valorRetencionDemagogica = 100
	
	method valorRetencionDemagogica(valorNuevo){
		valorRetencionDemagogica = valorNuevo 
	}
	method cantidad(cantidadNueva) {
		cantidad = cantidadNueva
	}

	method retencion(retencionNueva){
		retencion = retencionNueva
	}
	
	method costoProduccion() = cantidad * pepe.cotizacion()
	
	method importeTotal() = self.costoProduccion() + self.importeRetencion()
	
	method importeRetencion() {
		if (retencion == "retencionEstatista")
			return if (self.costoProduccion() > 1000) 100 else 150
		if (retencion == "retencionPrivatizadora")	
			return (50 + cantidad / 10) / 2 
		if (retencion == "retencionDemagogica")
			return valorRetencionDemagogica / 2
		return 0
	}
}

