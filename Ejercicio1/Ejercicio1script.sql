drop schema if exists Venta;
create schema Venta;

create table Venta.Cliente(
	idCliente int primary key not null,
    Apellidos varchar(45) not null,
    Nombres varchar(30) not null,
    Dirección varchar(45) not null,
    Ciudad varchar(15) not null,
    País varchar(20) not null,
    Celular varchar(20) not null,
    Fax varchar(50),
    Fecha_ingreso date,
    Ind_vigente varchar(45)
);

create table Venta.Vendedor(
	idVendedor int primary key not null,
    Nombre varchar(45)
);

create table Venta.Articulo(
	idArticulo int primary key not null,
    Descripción varchar(200) not null,
    Precio_unitario float not null,
    Stock int not null

);

create table Venta.Pedido(
	idPedido int primary key not null,
	Cliente_idCliente int,
    Articulo_idArticulo int,
    Vendedor_idVendedor int,
	foreign key (Cliente_idCliente) references Venta.Cliente(idCliente) on delete cascade,
    foreign key (Articulo_idArticulo) references Venta.Articulo(idArticulo) on delete cascade,
	foreign key (Vendedor_idVendedor) references Venta.Vendedor(idVendedor) on delete cascade,
    FechaPedido date,
    Subtotal float,
    Impuesto float,
    Total float,
    Estado varchar(45)
);

create table Venta.DetallePedido(
	Pedido_idPedido int,
    Articulo_idArticulo int,
	foreign key (Pedido_idPedido) references Venta.Pedido(idPedido) on delete cascade,
    foreign key (Articulo_idArticulo) references Venta.Articulo(idArticulo) on delete cascade,
    Cantidad int,
    Precio float,
    Subtotal float
);