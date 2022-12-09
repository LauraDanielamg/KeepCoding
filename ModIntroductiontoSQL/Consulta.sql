/*	Práctica de Modelado de datos e introducción a SQL
 * 
 * 	Nota: Este script genera la consulta solicitada en el enunciado de la practica
 * 
 * Hay que generar un listado que contenga todos los coches activos con:
 * 
 * Nombre modelo, marca y grupo de coche
 * Fecha de compra
 * Matricula
 * Nombre del color del coche
 * Total Km
 * Nombre de la empresa que asegura el coche
 * Numero de póliza
 */

select a.idcar, b.modelname, c.brandname, d.groupname, a.acq_date, a.plate, e.colorname, a.total_km, g.companyname, f.insurance_number
from practicasql.car a, practicasql.model b, practicasql.brand c, practicasql.cargroup d, practicasql.color e, practicasql.insurance f, practicasql.company g
where a.idmodel = b.idmodel and b.idbrand = c.idbrand and c.idcargroup = d.idcargroup and a.idcolor = e.idcolor and a.idcar = f.idcar and f.idcompany = g.idcompany
