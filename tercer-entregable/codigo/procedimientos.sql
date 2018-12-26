-------------------------------------------------------------------------------
-- FUNCIONES y PROCEDIMIENTOS
-------------------------------------------------------------------------------

-- Registro de mensajes en el sistema de informaci�n
CREATE OR REPLACE PROCEDURE Registrar_Mensaje (w_tipo IN MENSAJES.tipo%TYPE, w_fechaEnvio IN MENSAJES.fechaEnvio%TYPE,
    w_asunto IN MENSAJES.asunto%TYPE, w_contenido IN MENSAJES.contenido%TYPE, w_OID_Coord IN COORDINADORES.OID_Coord%TYPE) IS
BEGIN
    INSERT INTO MENSAJES (tipo, fechaEnvio, asunto, contenido, OID_Coord) VALUES (w_tipo, w_fechaEnvio, w_asunto, w_contenido, w_OID_Coord);
    COMMIT WORK;
END Registrar_Mensaje;
/

-- Registro de los env�os de mensajes en el sistema de informaci�n
CREATE OR REPLACE PROCEDURE Registrar_Envio (w_dni IN PERSONAS.dni%TYPE, w_cif IN INSTITUCIONES.cif%TYPE,
    w_OID_M IN MENSAJES.OID_M%TYPE) IS
BEGIN
    INSERT INTO ENVIOS (OID_M, dni, cif) VALUES (w_OID_M, w_dni, w_cif);
    COMMIT WORK;
END Registrar_Envio;
/

-- Registro de los informes m�dicos asociados a un participante en el sistema de informaci�n
CREATE OR REPLACE PROCEDURE Registrar_InformeMedico (w_descripcion IN INFORMESMEDICOS.descripcion%TYPE,
    w_fecha IN INFORMESMEDICOS.fecha%TYPE, w_OID_Part IN INFORMESMEDICOS.OID_Part%TYPE) IS
BEGIN
    INSERT INTO INFORMESMEDICOS (descripcion, fecha, OID_Part) VALUES (w_descripcion, w_fecha, w_OID_Part);
    COMMIT WORK;
END Registrar_InformeMedico;
/

-- Registro de voluntarios en el sistema de informaci�n
CREATE OR REPLACE PROCEDURE Registrar_Voluntario (w_dni IN PERSONAS.dni%TYPE, w_nombre IN PERSONAS.nombre%TYPE,
    w_apellidos IN PERSONAS.apellidos%TYPE, w_fechaNacimiento IN PERSONAS.fechaNacimiento%TYPE, w_direccion IN
    PERSONAS.direccion%TYPE, w_localidad IN PERSONAS.localidad%TYPE, w_provincia IN PERSONAS.provincia%TYPE,
    w_codigoPostal IN PERSONAS.codigoPostal%TYPE, w_email IN PERSONAS.email%TYPE, w_telefono IN PERSONAS.telefono%TYPE,
    w_prioridadParticipacion IN VOLUNTARIOS.prioridadParticipacion%TYPE) IS
BEGIN
    INSERT INTO PERSONAS (dni, nombre, apellidos, fechaNacimiento, direccion, localidad, provincia, codigoPostal,
        email, telefono) VALUES (w_dni, w_nombre, w_apellidos, w_fechaNacimiento, w_direccion, w_localidad, 
        w_provincia, w_codigoPostal, w_email, w_telefono);
    INSERT INTO VOLUNTARIOS (dni, prioridadParticipacion) VALUES (w_dni, w_prioridadParticipacion);
    COMMIT WORK;
END Registrar_Voluntario;
/