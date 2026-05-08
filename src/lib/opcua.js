import {
    OPCUAClient,
    AttributeIds
} from "node-opcua";

export async function opcua() {

    const endpointUrl = "opc.tcp://10.100.20.230:4840";

    const client = OPCUAClient.create({
        endpointMustExist: false
    });

    let session;

    try {

        // conectar
        await client.connect(endpointUrl);
        console.log("Conectado");
        // crear sesión
        session = await client.createSession();

        console.log("Sesión creada");

        // leer nodo
        const nodesToRead = [
            {
                nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M",
                attributeId: AttributeIds.Value
            },
            {
                nodeId: "ns=1;s=EM_VR041_DIR_VIENTO_38M",
                attributeId: AttributeIds.Value
            }
        ];

        const results = await session.read(nodesToRead);

        const velocidad = results[0].value.value;
        const direccion = results[1].value.value;

        console.log("Velocidad:", velocidad);
        console.log("Dirección:", direccion);

        return {
            velocidad,
            direccion
        };

    } catch (err) {

        console.error("Error OPCUA:", err);

        throw err;

    } finally {

        try {

            if (session) {
                await session.close();
            }

            await client.disconnect();

            console.log("Desconectado");

        } catch (e) {

            console.error("Error cerrando conexión:", e);

        }
    }
}
