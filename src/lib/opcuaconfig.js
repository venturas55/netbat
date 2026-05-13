import 'dotenv/config'
export const opcuaVariables = [
    {
        key: "racha_viento_VLC",
        nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M"
    },
    {
        key: "direccion_VLC",
        nodeId: "ns=1;s=EM_VR041_DIR_VIENTO_38M"
    },
    {
        key: "velocidad_VLC",
        nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M_MEDIA"
    },
    {
        key: "temperatura_VLC",
        nodeId: "ns=1;s=EM_VR041_TEMP"
    },
    {
        key: "presion_VLC",
        nodeId: "ns=1;s=EM_VR041_PRESION"
    },
        {
        key: "radiacion_VLC",
        nodeId: "ns=1;s=EM_VR041_RAD_SOLAR"
    }
    ,
        {
        key: "lluvia_VLC",
        nodeId: "ns=1;s=EM_VR041_LLUVIA"
    },
     {
        key: "viento_GAN",
        nodeId: "ns=1;s=EM_GR005_VEL_VIENTO"
    }
   ,
     {
        key: "direccion_GAN",
        nodeId: "ns=1;s=EM_GR005_DIR_VIENTO"
    },
     {
        key: "radiacion_presion_GAN",
        nodeId: "ns=1;s=EM_GR005_RAD_PRESION"
    },
     {
        key: "humedad_GAN",
        nodeId: "ns=1;s=EM_GR005_HUMEDAD"
    },
     {
        key: "temperatura_GAN",
        nodeId: "ns=1;s=EM_GR005_TEMP"
    },
     {
        key: "radiacion_GAN",
        nodeId: "ns=1;s=EM_GR0005_RAD_SOLAR"
    }

    ,
     {
        key: "viento_SAG",
        nodeId: "ns=1;s=EM_SR002_VEL_VIENTO"
    }
    ,
     {
        key: "direccion_SAG",
        nodeId: "ns=1;s=EM_SR002_DIR_VIENTO"
    }
    ,
     {
        key: "temperatura_SAG",
        nodeId: "ns=1;s=EM_SR002_TEMP"
    }
    ,
     {
        key: "presion_SAG",
        nodeId: "ns=1;s=EM_SR002_PRESION"
    }
    ,
     {
        key: "humedad_SAG",
        nodeId: "ns=1;s=EM_SR002_HUMEDAD"
    }
    ,
     {
        key: "radiacion_SAG",
        nodeId: "ns=1;s=EM_SR002_RAD_SOLAR"
    }



];

export const OPCUA_IP = process.env.OPCUA_IP;