#!/usr/bin/perl -w

package Basedatos; #Nombre de la clase
use DBI;#  DBI es un módulo (Objeto) para acceso a bases de datos para perl
#-------------------------------------------------
sub new{#Contruimos la clase Basdatos
#-------------------------------------------------
	my $self = {};
	$self -> {nombredb} = "juegodb";
	$self -> {host} = "localhost";
	$self -> {port} = "5432";
	$self -> {user} = "juego";
	$self -> {password} = "1234";
	
	bless $self, 'Basedatos';#En perl Bendecimos la clase
	return $self;#Retornamos la clase que acabamos de construir
}
#------------CREAMOS LOS METODOS (funciones de la clase)---------------
#-------------------------------------------------
sub nombredb{
#-------------------------------------------------
	my ($self,$nombredb) = @_;
	$self -> {nombredb} = $nombredb if defined($nombredb);
	return $self -> {nombredb};#Retornamos nombredb
}
#-------------------------------------------------
sub host{
#-------------------------------------------------
	my ($self,$host) = @_;
	$self -> {host} = $host if defined($host);
	return $self -> {host};#Retornamos 
}
#-------------------------------------------------
sub port{
#-------------------------------------------------
	my ($self,$port) = @_;
	$self -> {port} = $port if defined($port);
	return $self -> {port};#Retornamos 
}
#-------------------------------------------------
sub user{
#-------------------------------------------------
	my ($self,$user) = @_;
	$self -> {user} = $user if defined($user);
	return $self -> {user};#Retornamos 
}
#-------------------------------------------------
sub password{
#-------------------------------------------------
	my ($self,$password) = @_;
	$self -> {password} = $password if defined($password);
	return $self -> {password};#Retornamos 
}
#-------------------------------------------------
sub conexion {#METODO PARA  CONECTARNOS A LA BASE DE DATOS
#-------------------------------------------------
    my ($basedatos,$host,$port,$user,$password)=@_;
	
    $driver = "dbi:Pg:dbname=$basedatos;host=$host;port=$port";
    
    if ($dbh=DBI->connect($driver,$user,$password, {pg_server_prepare => 0})) {
        $errordb=undef
    } else {
        $errordb="\nError($DBI::err):$DBI::errstr\n";
    }
}
#-------------------------------------------------
sub ejecucion {#METODO PARA EJCUTAR SETENCIAS SQL
#-------------------------------------------------
	my ($operacion)=@_;
	
	$sth= $dbh->prepare($operacion) or $error1="\nError($DBI::err):$DBI::errstr\n";
	$sth->execute or $error1="\nError($DBI::err):$DBI::errstr\n";
}
#-------------------------------------------------
1;








