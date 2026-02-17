import 'dotenv/config'

const {
  PORT = 4000,
  DB_HOST = "localhost",
  DB_USER = "usuario",
  DB_PASS = "contrasena",
  DB_NAME = "dbname",
  DB_PORT = 3306,
  EMAIL_SERVICE="ovh",
  EMAIL_HOST="smtp.mail.ovh.net",
  EMAIL_PORT="465",
  EMAIL_SECURITY="TRUE",
  EMAIL_ACCOUNT = "email@adress.es",
  EMAIL_PASS = "your pass",
  NODE_DOCKER_PORT = 5002,
  MYSQL_LOCAL_PORT = 3307,
  MYSQL_DOCKER_PORT = 3306,
  EMAIL_AUTH_NEEDED ="true",
  DB_HOST_NETCOM="localhost",
  DB_USER_NETCOM="root",
  DB_PASS_NETCOM="Pablo-PASSS",
  DB_NAME_NETCOM="mesemar_beacons",
  DB_PORT_NETCOM = 3306,

} = process.env;
  //const DB_MP = process.env.DB_MP || '2a$10$.6weXYERL6XMB7nb0xcMTus/Qbi4aotItCWLs3QyBDk7cup4oCOo.';


const database = {
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASS,
  database: DB_NAME,
};

const database_NETCOM = {
  host: DB_HOST_NETCOM,
  user: DB_USER_NETCOM,
  password: DB_PASS_NETCOM,
  database: DB_NAME_NETCOM,
  PORT: DB_PORT_NETCOM
};
  //masterPass: '2a$10$.6weXYERL6XMB7nb0xcMTus/Qbi4aotItCWLs3QyBDk7cup4oCOo.',


export const config = {
  database,
  database_NETCOM,
  PORT,
  DB_HOST,
  DB_USER,
  DB_PASS,
  DB_NAME,
  DB_PORT,
  EMAIL_SERVICE,
  EMAIL_HOST,
  EMAIL_PORT,
  EMAIL_SECURITY,
  EMAIL_ACCOUNT,
  EMAIL_AUTH_NEEDED,
  EMAIL_PASS,
  NODE_DOCKER_PORT,
  MYSQL_LOCAL_PORT,
  MYSQL_DOCKER_PORT,
  };