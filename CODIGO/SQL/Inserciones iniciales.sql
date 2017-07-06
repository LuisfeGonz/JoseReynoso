insert into tipo_cliente (nombre, descripcion) values('particular', 'clientes particulares'),
('empresarial', 'los clientes son empresas que cuentan con una nomina de empleados');

insert into tipo_cuenta(nombreTipoCta, descripcion, tasaInteres) values('Monetaria','Fondos con disponibilidad inmediata sin generar intereses, utiliza cheques y tarjetas de debito', 0),
('Ahorro','No utiliza cheques o tarjetas de debito, generan un interes y pueden hacer transferencias de fondos', 01.10),
('Ahorro a plazo fijo','No se puede hacer transferencias o retiros durante un tiempo definido por el cliente, intereses considerablemente altos',05.01);

insert into estado_cuenta(nombreEstado, descripcion) values ('Activa', 'Cuenta en estado normal'),('Inactiva','No se realizan operaciones');

insert into pago_prestamo(nombrePago) values('quincenal'),('mensual'),('trimestral');

insert into estado_prestamo(nombreEstado) values('Aprobado'),('Pendiente'),('Rechazado');

insert into estado_cheque(nombreEstado) values('nuevo'),('cambiado'),('rechazado');

insert into rol_empleado(nombreRol, descripcion) values('Directivo','Visualizan area administrativa'),
('Gerente general','Visualizan area administrativa'),
('Gerente de agencia', 'Administra una agencia en particular'), 
('Servicio al cliente', 'Realiza operaciones no transaccionales'),
('Cajero','Realizan transacciones');

insert into agencia values(1,'Agencia central', 'zona1');

insert into operacion(nombreOperacion, descripcion) values('deposito en efectivo','en caja'),('transferencia',''),('transferencia a terceros',''),('retiros',''),('solicitud de prestamo',''),
('aprobacion de prestamo',''),('crear cuennta',''),('registrar cliente',''),('cambiar estado de cuenta',''),('cobro de cheque',''),
('rechazo de cheque',''),('deposito con cheque','');

insert into empleado values (2655896221401, 'Jose Reynoso', 'Ciudad', 'jlrt', 'abc', null, 2, null);