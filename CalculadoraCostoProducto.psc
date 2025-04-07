Algoritmo CalculadoraCostoProducto
    // Constantes
    IVA = 0.12  // 12% de impuesto
    DESCUENTO_POR_CANTIDAD = 0.05  // 5% de descuento por comprar más de 1 artículo
    COSTO_ENVIO_BASE = 10  // $10 costo fijo de envío
    COSTO_POR_KG = 2  // $2 por cada kg adicional
    
    // Variables de entrada
    Definir precioOriginal, porcentajeDescuento, pesoPaquete, costoEnvio, costoFinal Como Real
    Definir cantidad, destino Como Entero
    Definir tieneCupon Como Logico
    
    // Variables de cálculo
    Definir precioConDescuento, precioConImpuestos, precioConDescuentoCantidad Como Real
    Definir totalAntesEnvio Como Real
    
    // Arreglo para destinos (ejemplo: 1-Nueva York, 2-Los Ángeles, 3-Chicago)
    Dimension destinos[3]
    destinos[1] = "Nueva York"
    destinos[2] = "Los Ángeles"
    destinos[3] = "Chicago"
    
    // 1. Leer datos de entrada
    Escribir "Ingrese el precio original del producto: "
    Leer precioOriginal
    
    Escribir "¿Tiene un cupón de descuento? (1-Sí, 0-No): "
    Leer tieneCupon
    
    Si tieneCupon Entonces
        Escribir "Ingrese el porcentaje de descuento (ej. 10 para 10%): "
        Leer porcentajeDescuento
    Sino
        porcentajeDescuento = 0
    FinSi
    
    Escribir "Ingrese la cantidad de productos: "
    Leer cantidad
    
    Escribir "Ingrese el peso del paquete en kg: "
    Leer pesoPaquete
    
    Escribir "Seleccione el destino (1-Nueva York, 2-Los Ángeles, 3-Chicago): "
    Leer destino
    
    // 2. Aplicar descuento si existe cupón
    precioConDescuento = precioOriginal * (1 - porcentajeDescuento/100)
    
    // 3. Aplicar impuestos (IVA)
    precioConImpuestos = precioConDescuento * (1 + IVA)
    
    // 4. Aplicar descuento por cantidad si se compra más de 1 artículo
    Si cantidad > 1 Entonces
        precioConDescuentoCantidad = precioConImpuestos * (1 - DESCUENTO_POR_CANTIDAD)
    Sino
        precioConDescuentoCantidad = precioConImpuestos
    FinSi
    
    // 5. Calcular costo de envío
    costoEnvio = COSTO_ENVIO_BASE + (pesoPaquete * COSTO_POR_KG)
    
    // 6. Calcular costo final
    totalAntesEnvio = precioConDescuentoCantidad * cantidad
    costoFinal = totalAntesEnvio + costoEnvio
    
    // 7. Mostrar resultados en detalle
    Escribir "============ Detalle de la Compra ============"
    Escribir "Valor Unitario:........................ $", precioOriginal
    Si tieneCupon Entonces
        Escribir "Descuento aplicado, por Unidad (", porcentajeDescuento, "%):... $", precioOriginal * porcentajeDescuento/100
    FinSi
    Escribir "Valor Unitario con descuento:.......... $", precioConDescuento
    Escribir "Impuestos (", IVA*100, "%):........................ $", precioConDescuento * IVA
    Escribir "Valor Unitario con impuestos:.......... $", precioConImpuestos
    Si cantidad > 1 Entonces
        Escribir "Descuento por cantidad (", DESCUENTO_POR_CANTIDAD*100, "%):............ $", precioConImpuestos * DESCUENTO_POR_CANTIDAD
    FinSi
    Escribir "Valor por unidad después de descuentos: $", precioConDescuentoCantidad
    Escribir "Cantidad:................................... ", cantidad
    Escribir "Subtotal (antes de envío):............. $", totalAntesEnvio
	Escribir "______________________________________________"
    Escribir "Costo de envío a ", destinos[destino], " (", pesoPaquete, "kg):...... $", costoEnvio
	Escribir "______________________________________________"
    Escribir "TOTAL A PAGAR:......................... $", costoFinal, " "
	Escribir "______________________________________________"
	Escribir "=========== Gracias Por su Compra ==========="
FinAlgoritmo
