Database changed
MariaDB [mesemar_beacons]> show tables;
+-----------------------------------+
| Tables_in_mesemar_beacons         |
+-----------------------------------+
| actmsm_messages                   |
| actmsm_messages_backup            |
| ais216_messages                   |
| ais216_messages_backup            |
| ais216_messages_errors            |
| ais81_messages                    |
| ais81_messages_backup             |
| ais_reports_sent                  |
| alarms_emails_sent                |
| alarms_history_sent               |
| alarms_sms_sent                   |
| any_msgs_to_queue                 |
| beacons                           |
| beacons_an_inp_hyst_logs          |
| beacons_analogic_inputs           |
| beacons_digital_inputs            |
| beacons_digital_outputs           |
| beacons_dyn_params                |
| broadcast_atons                   |
| clients                           |
| com_resources                     |
| cruxmsm_messages                  |
| cruxmsm_messages_backup           |
| login_register                    |
| map_views                         |
| mds_mf12_messages                 |
| mds_mf12_messages_backup          |
| mds_mmb01_messages                |
| mds_mmb01_messages_backup         |
| messages_duplicated               |
| messages_sent                     |
| messages_start_send               |
| mfgsm_messages                    |
| mfgsm_messages_backup             |
| mfsat_messages                    |
| mfsat_messages_backup             |
| mfsat_messages_phill_client_simul |
| mfuhf_messages                    |
| mfuhf_messages_backup             |
| mmb25_messages                    |
| mmb25_messages_backup             |
| msm6_messages                     |
| msm6_messages_backup              |
| mtu100_messages                   |
| mtu100_messages_backup            |
| mtu200_messages                   |
| mtu200_messages_backup            |
| mtu300_messages                   |
| mtu300_messages_backup            |
| mtu310_messages                   |
| mtu310_messages_backup            |
| mtusat_messages                   |
| mtusat_messages_backup            |
| notes                             |
| s7200_messages                    |
| s7200_messages_backup             |
| s7205_messages                    |
| s7205_messages_backup             |
| sat36_messages                    |
| sat36_messages_backup             |
| sbkmsm_messages                   |
| sbkmsm_messages_backup            |
| sms36_messages                    |
| sms36_messages_backup             |
| uhf36_messages                    |
| uhf36_messages_backup             |
| users                             |
| users_flow_register               |
| vaarpmvc_sections                 |
| x_alert__users_beacons            |
| x_aware_alarms__users_msgs        |
| x_beacons_areas                   |
| x_users_areas                     |
+-----------------------------------+
73 rows in set (0.001 sec)

MariaDB [mesemar_beacons]>


MariaDB [mesemar_beacons]> desc uhf36_messages;
+--------------------------------+---------------------+------+-----+---------+----------------+
| Field                          | Type                | Null | Key | Default | Extra          |
+--------------------------------+---------------------+------+-----+---------+----------------+
| id                             | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| id_messages_sent               | int(11) unsigned    | YES  |     | NULL    |                |
| remote_station                 | varchar(255)        | YES  | MUL | NULL    |                |
| message                        | varchar(255)        | NO   |     | NULL    |                |
| type                           | varchar(6)          | YES  |     | UHF36   |                |
| date_time                      | datetime            | YES  |     | NULL    |                |
| lat_deg                        | varchar(2)          | YES  |     | NULL    |                |
| lat_min                        | varchar(255)        | YES  |     | NULL    |                |
| lat_sec                        | varchar(255)        | YES  |     | NULL    |                |
| lat_pos                        | enum('1','3')       | YES  |     | NULL    |                |
| lon_deg                        | varchar(3)          | YES  |     | NULL    |                |
| lon_min                        | varchar(7)          | YES  |     | NULL    |                |
| lon_sec                        | varchar(255)        | YES  |     | NULL    |                |
| lon_pos                        | enum('2','4')       | YES  |     | NULL    |                |
| num_satellites                 | varchar(2)          | YES  |     | NULL    |                |
| gps_signal_quality             | varchar(4)          | YES  |     | NULL    |                |
| meters_from_origin             | varchar(6)          | YES  |     | NULL    |                |
| lighter_battery                | varchar(5)          | YES  |     | NULL    |                |
| led_current                    | varchar(4)          | YES  |     | NULL    |                |
| temperature                    | varchar(4)          | YES  |     | NULL    |                |
| solar_panel_current            | varchar(4)          | YES  |     | NULL    |                |
| solar_panel_curr_acc           | varchar(5)          | YES  |     | NULL    |                |
| lighter_rythm                  | varchar(3)          | YES  |     | NULL    |                |
| rssi                           | varchar(2)          | YES  |     | NULL    |                |
| alarms_b360                    | varchar(7)          | YES  |     | NULL    |                |
| status_b360                    | varchar(4)          | YES  |     | NULL    |                |
| smartbank_battery              | varchar(5)          | YES  |     | NULL    |                |
| smartbank_solar_panel_current  | varchar(4)          | YES  |     | NULL    |                |
| smartbank_solar_panel_curr_acc | varchar(5)          | YES  |     | NULL    |                |
| smartbank_alarms_and_states    | varchar(3)          | YES  |     | NULL    |                |
| smartbank_states               | varchar(3)          | YES  |     | NULL    |                |
| smartbank_alarms               | varchar(3)          | YES  |     | NULL    |                |
| smartbank_comms                | varchar(3)          | YES  |     | NULL    |                |
| remote_id                      | varchar(3)          | YES  |     | NULL    |                |
| sbd_type                       | varchar(1)          | YES  |     | NULL    |                |
| processed_on                   | datetime            | YES  | MUL | NULL    |                |
+--------------------------------+---------------------+------+-----+---------+----------------+

MariaDB [mesemar_beacons]> desc sms36_messages;
+--------------------------------+---------------------+------+-----+---------+----------------+
| Field                          | Type                | Null | Key | Default | Extra          |
+--------------------------------+---------------------+------+-----+---------+----------------+
| id                             | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| id_messages_sent               | int(11) unsigned    | YES  |     | NULL    |                |
| remote_station                 | varchar(255)        | YES  | MUL | NULL    |                |
| message                        | varchar(255)        | NO   |     | NULL    |                |
| type                           | varchar(6)          | YES  |     | SMS36   |                |
| date_time                      | datetime            | YES  |     | NULL    |                |
| lat_deg                        | varchar(2)          | YES  |     | NULL    |                |
| lat_min                        | varchar(255)        | YES  |     | NULL    |                |
| lat_sec                        | varchar(255)        | YES  |     | NULL    |                |
| lat_pos                        | enum('1','3')       | YES  |     | NULL    |                |
| lon_deg                        | varchar(3)          | YES  |     | NULL    |                |
| lon_min                        | varchar(7)          | YES  |     | NULL    |                |
| lon_sec                        | varchar(255)        | YES  |     | NULL    |                |
| lon_pos                        | enum('2','4')       | YES  |     | NULL    |                |
| num_satellites                 | varchar(2)          | YES  |     | NULL    |                |
| gps_signal_quality             | varchar(4)          | YES  |     | NULL    |                |
| meters_from_origin             | varchar(6)          | YES  |     | NULL    |                |
| lighter_battery                | varchar(5)          | YES  |     | NULL    |                |
| led_current                    | varchar(4)          | YES  |     | NULL    |                |
| temperature                    | varchar(4)          | YES  |     | NULL    |                |
| solar_panel_current            | varchar(4)          | YES  |     | NULL    |                |
| solar_panel_curr_acc           | varchar(5)          | YES  |     | NULL    |                |
| lighter_rythm                  | varchar(3)          | YES  |     | NULL    |                |
| rssi                           | varchar(2)          | YES  |     | NULL    |                |
| alarms_b360                    | varchar(7)          | YES  |     | NULL    |                |
| status_b360                    | varchar(4)          | YES  |     | NULL    |                |
| smartbank_battery              | varchar(5)          | YES  |     | NULL    |                |
| smartbank_solar_panel_current  | varchar(4)          | YES  |     | NULL    |                |
| smartbank_solar_panel_curr_acc | varchar(5)          | YES  |     | NULL    |                |
| smartbank_alarms_and_states    | varchar(3)          | YES  |     | NULL    |                |
| smartbank_states               | varchar(3)          | YES  |     | NULL    |                |
| smartbank_alarms               | varchar(3)          | YES  |     | NULL    |                |
| smartbank_comms                | varchar(3)          | YES  |     | NULL    |                |
| remote_id                      | varchar(3)          | YES  |     | NULL    |                |
| sbd_type                       | varchar(1)          | YES  |     | NULL    |                |
| processed_on                   | datetime            | YES  | MUL | NULL    |                |
+--------------------------------+---------------------+------+-----+---------+----------------+

MariaDB [mesemar_beacons]> desc ais216_messages;
+--------------------------+-------------------------+------+-----+---------+----------------+
| Field                    | Type                    | Null | Key | Default | Extra          |
+--------------------------+-------------------------+------+-----+---------+----------------+
| id                       | bigint(20) unsigned     | NO   | PRI | NULL    | auto_increment |
| id_messages_sent         | int(11) unsigned        | YES  |     | NULL    |                |
| coordinator              | varchar(255)            | YES  |     | NULL    |                |
| modem                    | varchar(255)            | YES  |     | NULL    |                |
| remote_station           | varchar(255)            | NO   | MUL | 995     |                |
| message                  | varchar(255)            | NO   |     | NULL    |                |
| type                     | varchar(6)              | YES  |     | AIS216  |                |
| date_time                | datetime                | YES  |     | NULL    |                |
| lat_deg                  | varchar(2)              | YES  |     | NULL    |                |
| lat_min                  | varchar(255)            | YES  |     | NULL    |                |
| lat_sec                  | varchar(255)            | YES  |     | NULL    |                |
| lat_pos                  | enum('1','3')           | YES  |     | NULL    |                |
| lon_deg                  | varchar(3)              | YES  |     | NULL    |                |
| lon_min                  | varchar(7)              | YES  |     | NULL    |                |
| lon_sec                  | varchar(255)            | YES  |     | NULL    |                |
| lon_pos                  | enum('2','4')           | YES  |     | NULL    |                |
| num_satellites           | char(1)                 | YES  |     | NULL    |                |
| gps_signal_quality       | varchar(4)              | YES  |     | NULL    |                |
| name                     | varchar(255)            | YES  |     | NULL    |                |
| message_repeat           | char(1)                 | YES  |     | NULL    |                |
| mmsi                     | varchar(15)             | NO   |     | NULL    |                |
| dac                      | tinyint(1) unsigned     | NO   |     | NULL    |                |
| fid                      | tinyint(1) unsigned     | NO   |     | NULL    |                |
| analogic_internal        | varchar(4)              | NO   |     | NULL    |                |
| analogic_input_1         | varchar(4)              | NO   |     | NULL    |                |
| analogic_input_2         | varchar(4)              | NO   |     | NULL    |                |
| analogic_input_3         | varchar(4)              | YES  |     | NULL    |                |
| analogic_input_4         | varchar(4)              | YES  |     | NULL    |                |
| analogic_current         | varchar(4)              | NO   |     | NULL    |                |
| analogic_current_acc     | varchar(5)              | YES  |     | NULL    |                |
| racon_status             | char(1)                 | NO   |     | NULL    |                |
| light_status             | char(1)                 | NO   |     | NULL    |                |
| light_alarm              | char(1)                 | NO   |     | NULL    |                |
| off_position             | char(1)                 | NO   |     | NULL    |                |
| interval_hours_comm_time | varchar(3)              | YES  |     | NULL    |                |
| digitals_1_inputs        | varchar(3)              | NO   |     | NULL    |                |
| sms_sent_confirmation    | char(1)                 | NO   |     | 0       |                |
| remote_destinatary       | char(1)                 | NO   |     | 0       |                |
| remote_action_made       | char(1)                 | NO   |     | 0       |                |
| comm_recv_by             | enum('radio','iridium') | YES  | MUL | radio   |                |
| processed_on             | datetime                | YES  | MUL | NULL    |                |
+--------------------------+-------------------------+------+-----+---------+----------------+

MariaDB [mesemar_beacons]> desc ais81_messages;
+------------------+---------------------+------+-----+---------+----------------+
| Field            | Type                | Null | Key | Default | Extra          |
+------------------+---------------------+------+-----+---------+----------------+
| id               | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| id_messages_sent | int(11)             | YES  |     | NULL    |                |
| message          | varchar(255)        | NO   |     | NULL    |                |
| type             | varchar(6)          | YES  |     | AIS81   |                |
| date_time        | datetime            | YES  |     | NULL    |                |
| lat_deg          | varchar(2)          | YES  |     | NULL    |                |
| lat_min          | varchar(255)        | YES  |     | NULL    |                |
| lat_pos          | enum('1','3')       | YES  |     | NULL    |                |
| lon_deg          | varchar(3)          | YES  |     | NULL    |                |
| lon_min          | varchar(7)          | YES  |     | NULL    |                |
| lon_pos          | enum('2','4')       | YES  |     | NULL    |                |
| mmsi             | varchar(15)         | NO   |     | NULL    |                |
| input_1          | varchar(10)         | NO   |     | NULL    |                |
| input_2          | varchar(10)         | NO   |     | NULL    |                |
| input_3          | varchar(10)         | NO   |     | NULL    |                |
| input_4          | varchar(10)         | NO   |     | NULL    |                |
| input_5          | varchar(10)         | NO   |     | NULL    |                |
| input_6          | varchar(10)         | NO   |     | NULL    |                |
| input_7          | varchar(10)         | NO   |     | NULL    |                |
| input_8          | varchar(10)         | NO   |     | NULL    |                |
| input_9          | varchar(10)         | NO   |     | NULL    |                |
| input_10         | varchar(10)         | NO   |     | NULL    |                |
| input_11         | varchar(10)         | NO   |     | NULL    |                |
| input_12         | varchar(10)         | NO   |     | NULL    |                |
| input_13         | varchar(10)         | NO   |     | NULL    |                |
| input_14         | varchar(10)         | NO   |     | NULL    |                |
+------------------+---------------------+------+-----+---------+----------------+

MariaDB [mesemar_beacons]> desc mtu100_messages;
+-----------------------+---------------------+------+-----+---------+----------------+
| Field                 | Type                | Null | Key | Default | Extra          |
+-----------------------+---------------------+------+-----+---------+----------------+
| id                    | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| id_messages_sent      | int(11)             | YES  |     | NULL    |                |
| modem                 | varchar(255)        | NO   |     | NULL    |                |
| remote_station        | varchar(255)        | YES  | MUL | NULL    |                |
| message               | varchar(255)        | NO   |     | NULL    |                |
| type                  | varchar(6)          | YES  |     | MTU100  |                |
| date_time             | datetime            | YES  |     | NULL    |                |
| lat_deg               | varchar(2)          | YES  |     | NULL    |                |
| lat_min               | varchar(255)        | YES  |     | NULL    |                |
| lat_pos               | enum('1','3')       | YES  |     | NULL    |                |
| lon_deg               | varchar(3)          | YES  |     | NULL    |                |
| lon_min               | varchar(7)          | YES  |     | NULL    |                |
| lon_pos               | enum('2','4')       | YES  |     | NULL    |                |
| num_satellites        | varchar(1)          | YES  |     | NULL    |                |
| gps_signal_quality    | varchar(4)          | YES  |     | NULL    |                |
| meters_from_origin    | varchar(6)          | YES  |     | NULL    |                |
| state_1               | varchar(3)          | YES  |     | NULL    |                |
| state_2               | varchar(3)          | YES  |     | NULL    |                |
| state_3               | varchar(3)          | YES  |     | NULL    |                |
| battery_tension       | varchar(5)          | YES  |     | NULL    |                |
| electric_current      | varchar(6)          | YES  |     | NULL    |                |
| solar_panel_current   | varchar(6)          | YES  |     | NULL    |                |
| temperature           | varchar(2)          | YES  |     | NULL    |                |
| revolutions           | varchar(4)          | YES  |     | NULL    |                |
| rssi                  | varchar(2)          | YES  |     | NULL    |                |
| sms_sent_confirmation | varchar(1)          | YES  |     | NULL    |                |
| remote_destinatary    | varchar(1)          | YES  |     | NULL    |                |
| remote_action_made    | varchar(1)          | YES  |     | NULL    |                |
| processed_on          | datetime            | YES  | MUL | NULL    |                |
+-----------------------+---------------------+------+-----+---------+----------------+


MariaDB [mesemar_beacons]> desc mtu300_messages;
+-----------------------+---------------------+------+-----+---------+----------------+
| Field                 | Type                | Null | Key | Default | Extra          |
+-----------------------+---------------------+------+-----+---------+----------------+
| id                    | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| id_messages_sent      | int(11)             | YES  |     | NULL    |                |
| coordinator           | varchar(255)        | NO   |     | NULL    |                |
| remote_station        | varchar(255)        | YES  | MUL | NULL    |                |
| message               | varchar(255)        | NO   |     | NULL    |                |
| type                  | varchar(6)          | YES  |     | MTU300  |                |
| date_time             | datetime            | YES  |     | NULL    |                |
| lat_deg               | varchar(2)          | YES  |     | NULL    |                |
| lat_min               | varchar(255)        | YES  |     | NULL    |                |
| lat_pos               | enum('1','3')       | YES  |     | NULL    |                |
| lon_deg               | varchar(3)          | YES  |     | NULL    |                |
| lon_min               | varchar(7)          | YES  |     | NULL    |                |
| lon_pos               | enum('2','4')       | YES  |     | NULL    |                |
| num_satellites        | varchar(1)          | YES  |     | NULL    |                |
| gps_signal_quality    | varchar(4)          | YES  |     | NULL    |                |
| meters_from_origin    | varchar(6)          | YES  |     | NULL    |                |
| state_1               | varchar(3)          | YES  |     | NULL    |                |
| state_2               | varchar(3)          | YES  |     | NULL    |                |
| state_3               | varchar(3)          | YES  |     | NULL    |                |
| battery_tension       | varchar(5)          | YES  |     | NULL    |                |
| electric_current      | varchar(6)          | YES  |     | NULL    |                |
| solar_panel_current   | varchar(6)          | YES  |     | NULL    |                |
| temperature           | varchar(2)          | YES  |     | NULL    |                |
| revolutions           | varchar(4)          | YES  |     | NULL    |                |
| free                  | varchar(2)          | YES  |     | NULL    |                |
| sms_sent_confirmation | varchar(1)          | YES  |     | NULL    |                |
| remote_destinatary    | varchar(1)          | YES  |     | NULL    |                |
| remote_action_made    | varchar(1)          | YES  |     | NULL    |                |
| processed_on          | datetime            | YES  | MUL | NULL    |                |
+-----------------------+---------------------+------+-----+---------+----------------+
29 rows in set (0.001 sec)