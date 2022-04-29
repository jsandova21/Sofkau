#!/usr/bin/perl -w

use lib '/home/jsandova/JOEL/SofkaU/juego/';#ruta donde se encuenta nuestro programa
use Basedatos;#Indicamos que usaremos la clase Basedatos

#---------------Creamos un nuevo Objeto------------
my $db= new Basedatos();
$nombredb=$db -> nombredb;
$host=$db -> host;
$port=$db -> port;
$user=$db -> user;
$password=$db -> password;

#-------------------------------------------------
print "Intruduzca Nombre del Jugador\n";
$jugador=<STDIN>;#Tomamos el valor intruducido por el usuario
chomp($jugador);#quitamos el \n
$jugador=~s/(\s+$)//g;#quitamos los espacios en blanco

($njugador,$djugador,$nivel,$puntaje)=&buscar_jugador($jugador,$nombredb,$host,$port,$user,$password);

#-------------------------------------------------
if($djugador){
    if($nivel==5){
        print "*************************************************************************\n";
        print "Bienvenido de Nuevo $jugador Ya Ganaste este desafio ;-)\n";
        print "*************************************************************************\n";
        print "Quieres jugar de nuevo S/N? =>";
        $juego_nvo=<STDIN>; 
        chomp($juego_nvo);
        $juego_nvo=uc($juego_nvo);#convertimos en mayuscula
        if($juego_nvo eq "S"){
            $nivel=1;
            $puntaje=0;
        }else{
        print "*************************************************************************\n";
            print "HASTA LUEGO!!!! \n";
        print "*************************************************************************\n";
            exit;
        }
    }else{
        $nivel++;
        print "*************************************************************************\n";
        print "Bienvenido de Nuevo $jugador Continuemos Jugando ;-)\n";
        print "*************************************************************************\n";
    }
}else{
    $nivel=1;
    $puntaje=0;
        print "*************************************************************************\n";
    print "Bienvenido $jugador Empecemos con algo sencillo\n";
        print "*************************************************************************\n";
}

while($nivel<6){
   ($npregunta,$dpregunta,$nivel,$ncategoria,$categoria)=&buscar_pregunta($nivel,$host,$port,$user,$password);
    $categoria=~s/(\s+$)//g;
    print "Categoria: $categoria (Nivel $nivel)\n";
        print "*************************************************************************\n";
    print "Pregunta:$dpregunta\n";
    $npregunta=&buscar_respuestas($npregunta,$host,$port,$user,$password);
        print "*************************************************************************\n";
    print "Seleccione su respuesta (opcion 1,2,3 o 4)=>";
    $respuesta=<STDIN>;
    chomp($respuesta);
    
    if($respuesta<5){
        $correcta=&validar_respuestas($respuesta,$npregunta,$host,$port,$user,$password);
    }else{
        $correcta=0;
    }
    if($correcta eq "1" and $nivel == 5){
        $puntaje=(1000*$nivel);
        print "*************************************************************************\n";
        print "CORRECTO!!! :-) Ganaste \$ $puntaje Ganaste el Juego Felicidades!!!\n";
        print "*************************************************************************\n";
        &guardar_jugador($jugador,$nivel,$puntaje,$nombredb,$host,$port,$user,$password);
        exit;
    }elsif($correcta eq "1" and $nivel < 5){
        $puntaje=(1000*$nivel);
        print "*************************************************************************\n";
        print "CORRECTO!!! :-) Ganaste \$ $puntaje Quieres continuar S/N =>";
        $continuar=<STDIN>;
        chomp($continuar);
        $continuar=uc($continuar);
        if($continuar eq "S"){
            $nivel++;
        }else{
        print "*************************************************************************\n";
            print "HASTA LUEGO $jugador!!!! \n";
        print "*************************************************************************\n";
            &guardar_jugador($jugador,$nivel,$puntaje,$nombredb,$host,$port,$user,$password);
            exit;
        }
    }else{
        $drespuesta=&buscar_respuesta_correcta($npregunta,$host,$port,$user,$password);
        print "*************************************************************************\n";
        print "INCORRECTO :-( La respuesta Correcta es => \"$drespuesta\" \n";
        print "*************************************************************************\n";
        &guardar_jugador($jugador,$nivel,$puntaje,$nombredb,$host,$port,$user,$password);
        exit;
    }
}
#-------------------------------------------------
sub buscar_pregunta{
#-------------------------------------------------
	my ($nivel,$host,$port,$user,$password) = @_;
	
    Basedatos::conexion($nombredb,$host,$port,$user,$password);
    $operacion="select npregunta,dpregunta,nivel,ncategoria,categoria from tpregunta where nivel=$nivel and ncategoria=(SELECT ROUND(RANDOM() * 4)+1)";
    Basedatos::ejecucion($operacion);
    ($npregunta,$dpregunta,$nivel,$ncategoria,$categoria)=$Basedatos::sth->fetchrow_array;
    return ($npregunta,$dpregunta,$nivel,$ncategoria,$categoria);
}
#-------------------------------------------------
sub buscar_respuestas{
#-------------------------------------------------
	my ($npregunta,$host,$port,$user,$password) = @_;
	
    Basedatos::conexion($nombredb,$host,$port,$user,$password);
    $operacion="select drespuesta from trespuestas where npregunta=$npregunta order by drespuesta";
    Basedatos::ejecucion($operacion);
    my $linea=1;
    while ($drespuesta=$Basedatos::sth -> fetchrow_array){
        print "$linea=>$drespuesta\n";
        $linea++;
    }
    return $npregunta;
}
#-------------------------------------------------
sub buscar_respuesta_correcta{
#-------------------------------------------------
	my ($npregunta,$host,$port,$user,$password) = @_;
	
    Basedatos::conexion($nombredb,$host,$port,$user,$password);
    $operacion="select drespuesta from trespuestas where npregunta=$npregunta and correcta='1'";
    Basedatos::ejecucion($operacion);
    $drespuesta=$Basedatos::sth -> fetchrow_array;
    return $drespuesta;
}
#-------------------------------------------------
sub validar_respuestas{
#-------------------------------------------------
	my ($respuesta,$npregunta,$host,$port,$user,$password) = @_;
	
    Basedatos::conexion($nombredb,$host,$port,$user,$password);
    $operacion="select drespuesta,correcta from trespuestas where npregunta=$npregunta order by drespuesta";
    Basedatos::ejecucion($operacion);
    my $linea=1;
    while (($drespuesta,$correcta)=$Basedatos::sth -> fetchrow_array){
        if($linea == $respuesta){
            return $correcta;
        }
    $linea++;
    }
}
#-------------------------------------------------
sub guardar_jugador{
#-------------------------------------------------
	my ($jugador,$nivel,$puntaje,$nombredb,$host,$port,$user,$password) = @_;
	
	$jugador=~s/(\s+$)//g;
	
    ($njugador,$djugador,$nivel1,$puntaje1)=&buscar_jugador($jugador,$nombredb,$host,$port,$user,$password);
    $nivel1=$nivel1;
    $puntaje1=$puntaje1;
    
    if($njugador){
        Basedatos::conexion($nombredb,$host,$port,$user,$password);
        $operacion="update tjugador set nivel=$nivel,puntaje=$puntaje where djugador='$jugador'";
        Basedatos::ejecucion($operacion);
    }else{
        Basedatos::conexion($nombredb,$host,$port,$user,$password);
        $operacion="insert into tjugador (djugador,nivel,puntaje) values ('$jugador',$nivel,$puntaje)";
        Basedatos::ejecucion($operacion);
    }
}
#-------------------------------------------------
sub buscar_jugador{
#-------------------------------------------------
	my ($jugador,$nombredb,$host,$port,$user,$password) = @_;
	
    Basedatos::conexion($nombredb,$host,$port,$user,$password);
    $operacion="select njugador,djugador,nivel,puntaje from tjugador where djugador='$jugador'";
    Basedatos::ejecucion($operacion);
    ($njugador,$djugador,$nivel,$puntaje)=$Basedatos::sth -> fetchrow_array;
    return ($njugador,$djugador,$nivel,$puntaje);
}
#-------------------------------------------------
