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
        const dataValue = await session.read({
            nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M",
            attributeId: AttributeIds.Value
        });
        console.log(JSON.stringify(dataValue, null, 2));
        console.dir(dataValue, { depth: null });
        const value = dataValue.value.value;

        console.log("Valor:", value);

        return value;

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
