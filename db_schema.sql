

-- tibber schema

CREATE TABLE IF NOT EXISTS live_measurements(

	data_timestamp timestamptz not null unique primary key,
	-- Timestamp when usage occured
	power real not null,
		-- Consumption at the moment (Watt)  
	last_meter_consumption real,
	-- Last meter active import register state (kWh)
	accumulated_consumption real not null,
	-- kWh consumed since midnight
	accumulated_production real not null,
	-- net kWh produced since midnight
	accumulated_cost real,
	-- Accumulated cost since midnight; requires active Tibber power deal
	accumulated_reward real,
	-- Accumulated reward since midnight; requires active Tibber power deal
	currency varchar(4),
	-- Currency of displayed cost; requires active Tibber power deal
	min_power real not null,
	-- Min consumption since midnight (Watt)
	average_power real not null,
	-- Average consumption since midnight (Watt)
	max_power real not null,
	-- Peak consumption since midnight (Watt)
	power_production real,
	-- Net production at the moment (Watt)
	min_power_production real,
	-- Min net production since midnight (Watt)
	max_power_production real,
	-- Max net production since midnight (Watt)
	last_meter_production real,
	-- Last meter active export register state (kWh)
	power_factor real,
	-- Power factor (active power / apparent power)
	voltage_phase_1 real,
	-- Voltage on phase 1; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware.
	voltage_phase_2 real,
	-- Voltage on phase 2; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware. Value is always null for single phase meters.
	voltage_phase_3 real,
	-- Voltage on phase 3; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware. Value is always null for single phase meters.
	current_L1 real,
	-- Current on L1; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware.
	current_L2 real,
	-- Current on L2; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware. Value is always null for single phase meters.
	current_L3 real,
	-- Current on L3; on Kaifa and Aidon meters the value is not part of every HAN data frame therefore the value is null at timestamps with second value other than 0, 10, 20, 30, 40, 50. There can be other deviations based on concrete meter firmware. Value is always null for single phase meters.
	signal_strength smallint
	-- Device signal strength (Pulse - dB; Watty - percent)
);


-- netatmo schema
CREATE TABLE IF NOT EXISTS main_indoor_module( 

	data_timestamp timestamptz not null unique primary key,
	-- Timestamp when data was measured
	temprature real not null,
	-- Temprature in °C
	CO2 real not null,
	-- CO2 level (in ppm)
	humidity real not null,
	-- Humidity (in %)
	noise real not null,
	-- Noise level (in dB)
	pressure real not null,
	-- Surface pressure in mbar
	absolute_pressure real not null,
	-- Sea-level pressure in mbar
	min_temp real not null,
	-- Minimum temperature measured
	max_temp real not null,
	-- Maximum temperature measured
	date_min_temp timestamptz not null,
	-- Timestamp min temp
	date_max_temp timestamptz not null,
	-- Timestamp max temp
	temp_trend varchar(9) not null,
	-- Trend for the last 12h (up, down, stable)
	pressure_trend varchar(9) not null
	-- Trend for the last 12h (up, down, stable)

);

CREATE TABLE IF NOT EXISTS outdoor_module( 

	data_timestamp timestamptz not null unique primary key,
	-- Timestamp when data was measured
	temprature real not null,
	-- Temprature in °C
	humidity real not null,
	-- Humidity (in %)
	min_temp real not null,
	-- Minimum temperature measured
	max_temp real not null,
	-- Maximum temperature measured
	date_min_temp timestamptz not null,
	-- Timestamp min temp
	date_max_temp timestamptz not null,
	-- Timestamp max temp
	temp_trend varchar(9) not null
	-- Trend for the last 12h (up, down, stable)
);

CREATE TABLE IF NOT EXISTS rain_gauge_module( 

	data_timestamp timestamptz not null unique primary key,
	-- timestamp when data was measured
	precipitation real not null,
	-- Rain in mm
	sum_rain_24 real not null,
	-- Rain measured for past 24h(mm)
	sum_rain_1 real not null 
	-- rain measured for the last hour (mm)
);

CREATE TABLE IF NOT EXISTS wind_gauge_module( 

	data_timestamp timestamptz not null unique primary key,
	-- timestamp when data was measured
	wind_strength real not null,
	-- Wind strenght (km/h)
	wind_angle real not null,
	-- Wind angle 
	/* N: 
	 * 337.5 > angle <=  22.5
	 * NE:
	 * angle <=  67.5 
	 * E:
	 * angle <= 112.5
	 * SE:
	 * angle <= 157.5
	 * S:
	 * angle <= 202.5
	 * SW:
	 * angle <= 247.5
	 * W:
	 * angle <= 292.5
	 * NW:
	 * angle <= 337.5
	 */
	gust_strength real not null,
	-- Gust strengh (km/h)
	gust_angle real not null,
	-- gust angle
	max_wind_str real not null,
	-- 
	max_wind_angle real not null,
	-- 
	date_max_wind_str timestamptz not null,
	-- 
	
);

CREATE TABLE IF NOT EXISTS additional_indoor_module( 

	data_timestamp timestamptz not null unique primary key,
	-- timestamp when data was measured
	temprature real not null,
	-- Temprature in °C
	CO2 real not null,
	-- CO2 level (in ppm)
	humidity real not null,
	-- Humidity (in %)
	pressure real not null,
	-- Surface pressure in mbar
	absolute_pressure real not null,
	-- Sea-level pressure in mbar
	min_temp real not null,
	-- Minimum temperature measured
	max_temp real not null,
	-- Maximum temperature measured
	date_min_temp timestamptz not null,
	-- Timestamp min temp
	date_max_temp timestamptz not null,
	-- Timestamp max temp
	temp_trend varchar(9) not null
	-- Trend for the last 12h (up, down, stable)

);