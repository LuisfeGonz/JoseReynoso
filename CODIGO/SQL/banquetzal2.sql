DROP DATABASE banquetzal;
CREATE DATABASE banquetzal; 
USE banquetzal;

create table tipo_cliente(
	idTipoCliente int primary key auto_increment,
	nombre varchar(100) not null,
	descripcion varchar(250)
);

create table cliente(
	CUICliente bigint primary key,
	nombre varchar(100) not null,
	fechaNac date,
	direccion varchar(100) not null,
	puntos int,
	usuario varchar(50) not null,
	clave varchar(50) not null,
	idTipoCliente int not null,
	foreign key (idTipoCliente) references tipo_cliente(idTipoCliente)  on delete cascade on update cascade
);

create table encargado(
	idEncargado int primary key,
	nombre varchar(100),
	CUICliente bigint,
	foreign key (CUICliente) references cliente(CUICliente) on delete cascade on update cascade
	
);

create table estado_cuenta(
	idEstadoCta int primary key auto_increment,
	nombreEstado varchar(50) not null,
	descripcion varchar(250)
);

create table tipo_cuenta(
	idTipoCta int primary key auto_increment,
	nombreTipoCta varchar(50) not null,
	tasaInteres decimal(4,2) not null,
	descripcion varchar(250)
);

create table cuenta(
	noCuenta bigint primary key,
	fechaApertura datetime not null,
	saldo decimal(20,2) not null,
	idEstadoCta int, idTipoCta int, CUICliente bigint,
	foreign key (idEstadoCta) references estado_cuenta(idEstadoCta) on delete cascade on update cascade,
	foreign key (idTipoCta) references tipo_cuenta(idTipoCta) on delete cascade on update cascade,
	foreign key (CUICliente) references cliente(CUICliente) on delete cascade on update cascade	

);

create table movimiento_cuenta(
	idMovimiento int primary key auto_increment,
	debe decimal(20,2),
	haber decimal(20,2),
	saldo decimal(20,2),
	fecha datetime,
	noCuenta bigint,
	foreign key (noCuenta) references cuenta(noCuenta) on delete cascade on update cascade
);

create table estado_cheque(
	idEstadoCheque int primary key auto_increment,
	nombreEstado varchar(50)
);

create table cheque(
	correlativo int auto_increment,
	noTalonario int,
	noCuenta bigint, idEstadoCheque int,
	foreign key (noCuenta) references cuenta(noCuenta) on delete cascade on update cascade,
	foreign key (idEstadoCheque) references estado_cheque(idEstadoCheque) on delete cascade on update cascade,
	primary key (correlativo, noCuenta)
);

create table cuenta_asociada(
	idAsociacion int primary key auto_increment,
	cuentaPrimaria bigint not null, cuentaAsociada bigint not null,
	foreign key (cuentaPrimaria) references cuenta(noCuenta) on delete cascade on update cascade,
	foreign key (cuentaAsociada) references cuenta(noCuenta) on delete cascade on update cascade
);

create table rol_empleado(
	idRol int primary key auto_increment,
	nombreRol varchar(50) not null,
	descripcion varchar(250)
);

create table agencia(
	idAgencia int primary key,
	nombreAgencia varchar(100) not null,
	direccion varchar(100) not null
);

create table operacion(
	idOperacion int primary key auto_increment,
	nombreOperacion varchar(100) not null,
	descripcion varchar(250)
);

create table empleado(
	CUIEmpleado bigint primary key,
	nombreEmpleado varchar(100) not null,
	direccion varchar(100) not null,
	usuario varchar(50) not null,
	clave varchar(50) not null,
	empleadoSup bigint, idRol int, idAgencia int,
	foreign key (empleadoSup) references empleado(CUIEmpleado),
	foreign key (idRol) references rol_empleado(idRol) on delete cascade on update cascade,
	foreign key (idAgencia) references agencia(idAgencia) on delete cascade on update cascade
);

create table reg_operacion(
	idRegistro int primary key auto_increment,
	fecha datetime,
	monto decimal(20,2),
	puntos int,
	emisor varchar(100),
	CUIEmpleado bigint, idAgencia int, idOperacion int, noCuenta bigint, correlativo int,
	foreign key (CUIEmpleado) references empleado(CUIEmpleado) on delete cascade on update cascade,
	foreign key (idAgencia) references agencia(idAgencia) on delete cascade on update cascade,
	foreign key (idOperacion) references operacion(idOperacion) on delete cascade on update cascade,
	foreign key (noCuenta) references cuenta(noCuenta) on delete cascade on update cascade,
	foreign key (correlativo) references cheque(correlativo) on delete cascade on update cascade
);

create table pago_prestamo(
	idPagoPrestamo int primary key auto_increment,
	nombrePago varchar(100),
	tasaInteres decimal(4,2)
);

create table estado_prestamo(
	idEstadoPrestamo int primary key auto_increment,
	nombreEstado varchar(100)
);

create table prestamo(
	idPrestamo int primary key auto_increment,
	monto decimal(20,2) not null,
	idPagoPrestamo int, idEstadoPrestamo int, noCuenta bigint,
	foreign key (idPagoPrestamo) references pago_prestamo(idPagoPrestamo) on delete cascade on update cascade,
	foreign key (idEstadoPrestamo) references estado_prestamo(idEstadoPrestamo) on delete cascade on update cascade,
	foreign key (noCuenta) references cuenta(noCuenta) on delete cascade on update cascade
);

create table patrocinador(
	idPatrocinador int primary key,
	nombre varchar(100)
);

create table producto(
	idProducto int primary key,
	nombre varchar(100),
	valorCanje int,
	idPatrocinador int,
	foreign key (idPatrocinador) references patrocinador(idPatrocinador) on delete cascade on update cascade
);

create table adquisicion_producto(
	idAdquisicion int primary key auto_increment,
	fecha datetime,
	idOperacion int, CUICliente bigint, idProducto int,
	foreign key (CUICliente) references cliente(CUICliente) on delete cascade on update cascade,
	foreign key (idProducto) references producto(idProducto) on delete cascade on update cascade
);