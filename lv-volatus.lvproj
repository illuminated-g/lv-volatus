<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="config" Type="Folder" URL="../config">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="libs" Type="Folder">
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="proto" Type="Folder" URL="../../lv-vecto/Vecto/proto">
				<Property Name="NI.DISK" Type="Bool">true</Property>
			</Item>
			<Item Name="Base64.lvlib" Type="Library" URL="../../lv-web-crypto/lv-base64/Base64.lvlib"/>
			<Item Name="CDM-Config.lvlib" Type="Library" URL="../../lv-cdm/CDM-Config/CDM-Config.lvlib"/>
			<Item Name="Crypto.lvlib" Type="Library" URL="../../lv-web-crypto/lv-crypto/Crypto/Crypto.lvlib"/>
			<Item Name="HTTP Server.lvlib" Type="Library" URL="../../lv-http-server/HTTP Server/HTTP Server.lvlib"/>
			<Item Name="HTTP Utils.lvlib" Type="Library" URL="../../lv-http-util/HTTP Utils/HTTP Utils.lvlib"/>
			<Item Name="JSON.lvlib" Type="Library" URL="../../lv-web-crypto/lv-json/JSON/JSON.lvlib"/>
			<Item Name="LV-Proto.lvlib" Type="Library" URL="../../lv-protoc/LV-Proto/LV-Proto.lvlib"/>
			<Item Name="Promises.lvlib" Type="Library" URL="../../lv-promises/Promises/Promises.lvlib"/>
			<Item Name="Stream-TCP.lvlib" Type="Library" URL="../../lv-stream-tcp/Stream-TCP/Stream-TCP.lvlib"/>
			<Item Name="Stream-Websocket.lvlib" Type="Library" URL="../../lv-stream-websocket/Stream-Websocket/Stream-Websocket.lvlib"/>
			<Item Name="Stream.lvlib" Type="Library" URL="../../lv-stream/stream/Stream.lvlib"/>
			<Item Name="VectoConfig.lvlib" Type="Library" URL="../../lv-vecto/VectoConfig/VectoConfig.lvlib"/>
			<Item Name="Vecto.lvlib" Type="Library" URL="../../lv-vecto/Vecto/Vecto.lvlib"/>
			<Item Name="VectoTools.lvlib" Type="Library" URL="../../lv-vecto/VectoTools/VectoTools.lvlib"/>
			<Item Name="VectoScratch.lvlib" Type="Library" URL="../../lv-vecto/VectoScratch/VectoScratch.lvlib"/>
			<Item Name="IG PID.lvlib" Type="Library" URL="../../lv-control/IG PID/IG PID.lvlib"/>
			<Item Name="Builder Tools.lvlib" Type="Library" URL="../../lv-builder/Builder Tools/Builder Tools.lvlib"/>
			<Item Name="Builder Core.lvlib" Type="Library" URL="../../lv-builder/Builder Core/Builder Core.lvlib"/>
		</Item>
		<Item Name="messages" Type="Folder" URL="../messages">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="proto defs" Type="Folder">
			<Item Name="proto" Type="Folder" URL="../proto">
				<Property Name="NI.DISK" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="_Build" Type="Folder">
			<Item Name="Generic PC Build.vi" Type="VI" URL="../_build/Generic PC Build.vi"/>
		</Item>
		<Item Name="Volatus.lvlib" Type="Library" URL="../Volatus/Volatus.lvlib"/>
		<Item Name="VolatusBuild.lvlib" Type="Library" URL="../VolatusBuild/VolatusBuild.lvlib"/>
		<Item Name="VolatusConfig.lvlib" Type="Library" URL="../VolatusConfig/VolatusConfig.lvlib"/>
		<Item Name="VolatusDAQ.lvlib" Type="Library" URL="../VolatusDAQ/VolatusDAQ.lvlib"/>
		<Item Name="VolatusData.lvlib" Type="Library" URL="../VolatusData/VolatusData.lvlib"/>
		<Item Name="VolatusDAQConfig.lvlib" Type="Library" URL="../VolatusDAQConfig/VolatusDAQConfig.lvlib"/>
		<Item Name="VolatusGUI.lvlib" Type="Library" URL="../VolatusGUI/VolatusGUI.lvlib"/>
		<Item Name="VolatusGUIControls.lvlib" Type="Library" URL="../VolatusGUIControls/VolatusGUIControls.lvlib"/>
		<Item Name="VolatusGUIElements.lvlib" Type="Library" URL="../VolatusGUIElements/VolatusGUIElements.lvlib"/>
		<Item Name="VolatusScratch.lvlib" Type="Library" URL="../VolatusScratch/VolatusScratch.lvlib"/>
		<Item Name="VolatusSeq.lvlib" Type="Library" URL="../VolatusSeq/VolatusSeq.lvlib"/>
		<Item Name="VolatusDAQGenericGUI.lvlib" Type="Library" URL="../VolatusDAQGenericGUI/VolatusDAQGenericGUI.lvlib"/>
		<Item Name="VolatusControl.lvlib" Type="Library" URL="../VolatusControl/VolatusControl.lvlib"/>
		<Item Name="Generic PC App.vi" Type="VI" URL="../_build/Generic PC App.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="AB_Generate_Error_Cluster.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Generate_Error_Cluster.vi"/>
				<Item Name="AB_Relative_Path_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Relative_Path_Type.ctl"/>
				<Item Name="AB_RW_Convert_Path_Tags.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Convert_Path_Tags.vi"/>
				<Item Name="AB_RW_Convert_Path_to_Absolute.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Convert_Path_to_Absolute.vi"/>
				<Item Name="AB_RW_Convert_Path_to_Relative.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Convert_Path_to_Relative.vi"/>
				<Item Name="AB_RW_Project_Build_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Build_Data.ctl"/>
				<Item Name="AB_RW_Project_Build_Info.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Build_Info.vi"/>
				<Item Name="AB_RW_Project_PropBag_Action.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_PropBag_Action.ctl"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Base64 Support.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Base64/Base64 Support.lvlib"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Command Line String To Path.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Command Line String To Path.vi"/>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create NI GUID.vi" Type="VI" URL="/&lt;vilib&gt;/string/Create NI GUID.vi"/>
				<Item Name="DAQmx Clear Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Clear Task.vi"/>
				<Item Name="DAQmx Control Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Control Task.vi"/>
				<Item Name="DAQmx Create Channel (AI-Acceleration-4 Wire DC Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Acceleration-4 Wire DC Voltage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (AI-Acceleration-Charge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Acceleration-Charge).vi"/>
				<Item Name="DAQmx Create Channel (AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (AI-Charge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Charge).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Frequency-Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Frequency-Voltage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (AI-Strain-Rosette Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Strain-Rosette Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Velocity-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Velocity-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AO-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AO-FuncGen).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-FuncGen).vi"/>
				<Item Name="DAQmx Create Channel (AO-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (CI-Count Edges).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Count Edges).vi"/>
				<Item Name="DAQmx Create Channel (CI-Duty Cycle).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Duty Cycle).vi"/>
				<Item Name="DAQmx Create Channel (CI-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CI-GPS Timestamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-GPS Timestamp).vi"/>
				<Item Name="DAQmx Create Channel (CI-Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Angular Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Angular Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Linear Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Linear Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Freq).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Freq).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Time).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Width).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Width).vi"/>
				<Item Name="DAQmx Create Channel (CI-Semi Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Semi Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Two Edge Separation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Two Edge Separation).vi"/>
				<Item Name="DAQmx Create Channel (CI-Velocity-Angular).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Velocity-Angular).vi"/>
				<Item Name="DAQmx Create Channel (CI-Velocity-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Velocity-Linear).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Time).vi"/>
				<Item Name="DAQmx Create Channel (DI-Digital Input).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DI-Digital Input).vi"/>
				<Item Name="DAQmx Create Channel (DO-Digital Output).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DO-Digital Output).vi"/>
				<Item Name="DAQmx Create Channel (Power).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (Power).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create Virtual Channel.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Virtual Channel.vi"/>
				<Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
				<Item Name="DAQmx Start Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Start Task.vi"/>
				<Item Name="DAQmx Stop Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Stop Task.vi"/>
				<Item Name="DAQmx Timing (Burst Export Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Export Clock).vi"/>
				<Item Name="DAQmx Timing (Burst Import Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Burst Import Clock).vi"/>
				<Item Name="DAQmx Timing (Change Detection).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Change Detection).vi"/>
				<Item Name="DAQmx Timing (Handshaking).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Handshaking).vi"/>
				<Item Name="DAQmx Timing (Implicit).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Implicit).vi"/>
				<Item Name="DAQmx Timing (Pipelined Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Pipelined Sample Clock).vi"/>
				<Item Name="DAQmx Timing (Sample Clock).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Sample Clock).vi"/>
				<Item Name="DAQmx Timing (Use Waveform).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing (Use Waveform).vi"/>
				<Item Name="DAQmx Timing.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/timing.llb/DAQmx Timing.vi"/>
				<Item Name="Delimited String to 1D String Array.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Delimited String to 1D String Array.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Equal Comparable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Comparable/Equal Comparable.lvclass"/>
				<Item Name="Equal Functor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Functor/Equal Functor.lvclass"/>
				<Item Name="Equals.vim" Type="VI" URL="/&lt;vilib&gt;/Comparison/Equals.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get GObject Label.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/Get GObject Label.vi"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="GetTargetBuildSpecs (project reference).vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs (project reference).vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="IB_2019_2018_RW_Convert_Path_to_Relative.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/Compatibility/IB_2019_2018_RW_Convert_Path_to_Relative.vi"/>
				<Item Name="IB_Relative_Path_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_Relative_Path_Type.ctl"/>
				<Item Name="IB_RW_Convert_Path_to_Absolute.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_RW_Convert_Path_to_Absolute.vi"/>
				<Item Name="IB_RW_Convert_Path_to_Relative.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_RW_Convert_Path_to_Relative.vi"/>
				<Item Name="IB_RW_Project_Installer.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_RW_Project_Installer.vi"/>
				<Item Name="IB_RW_Project_Installer_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_RW_Project_Installer_Data.ctl"/>
				<Item Name="IB_RW_Project_PropBag_Action.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/IB_RW_Project/IB_RW_Project_PropBag_Action.ctl"/>
				<Item Name="Is Name Multiplatform.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Is Name Multiplatform.vi"/>
				<Item Name="JDP Timestamp.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Timestamp/JDP Timestamp.lvlib"/>
				<Item Name="JDP Utility.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/JDP Utility.lvlib"/>
				<Item Name="JSONtext LVClass Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/JDP Science/JSONtext/LVClass Serializer/JSONtext LVClass Serializer.lvclass"/>
				<Item Name="JSONtext.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JSONtext/JSONtext.lvlib"/>
				<Item Name="LabVIEWHTTPClient.lvlib" Type="Library" URL="/&lt;vilib&gt;/httpClient/LabVIEWHTTPClient.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="LVMapReplaceAction.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVMapReplaceAction.ctl"/>
				<Item Name="LVNumericRepresentation.ctl" Type="VI" URL="/&lt;vilib&gt;/numeric/LVNumericRepresentation.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_App_Builder_API.lvlib" Type="Library" URL="/&lt;vilib&gt;/AppBuilder/AB_API_Simple/NI_App_Builder_API.lvlib"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Path To Command Line String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Path To Command Line String.vi"/>
				<Item Name="PathToUNIXPathString.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/PathToUNIXPathString.vi"/>
				<Item Name="Remove Duplicates From 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Remove Duplicates From 1D Array.vim"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Search Unsorted 1D Array Core.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Helpers/Search Unsorted 1D Array Core.vim"/>
				<Item Name="Search Unsorted 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Search Unsorted 1D Array.vim"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="SQLite.lvlib" Type="Library" URL="/&lt;vilib&gt;/drjdpowell/SQLite Library/SQLite.lvlib"/>
				<Item Name="Stall Data Flow.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/Stall Data Flow.vim"/>
				<Item Name="Synchronize Data Flow.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/Synchronize Data Flow.vim"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="TRef Find Object By Label.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Find Object By Label.vi"/>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi"/>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="UDP Multicast Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Open.vi"/>
				<Item Name="UDP Multicast Read-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Only Open.vi"/>
				<Item Name="UDP Multicast Read-Write Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Read-Write Open.vi"/>
				<Item Name="UDP Multicast Write-Only Open.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/UDP Multicast Write-Only Open.vi"/>
				<Item Name="UNIXPathStringToPath.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/UNIXPathStringToPath.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="DAQmx Read (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog 1D Wfm NChan NSamp Duration).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan NSamp Duration).vi"/>
				<Item Name="DAQmx Read (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D I32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Analog Wfm 1Chan NSamp Duration).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan NSamp Duration).vi"/>
				<Item Name="DAQmx Read (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Freq 1 Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Freq 1 Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Ticks 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Ticks 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D Pulse Time 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D Pulse Time 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Counter DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Freq 1 Chan 1 Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Freq 1 Chan 1 Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Ticks 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter Pulse Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter Pulse Time 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Counter U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Counter U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="DAQmx Read (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital 1D Wfm NChan NSamp Duration).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan NSamp Duration).vi"/>
				<Item Name="DAQmx Read (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="DAQmx Read (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Bool 1Line 1Point).vi"/>
				<Item Name="DAQmx Read (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Digital Wfm 1Chan NSamp Duration).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan NSamp Duration).vi"/>
				<Item Name="DAQmx Read (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Power 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Power 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Power 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Read (Power 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Power 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Power 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Read (Power DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Power Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Read (Power Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Power Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Read (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I8).vi"/>
				<Item Name="DAQmx Read (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I16).vi"/>
				<Item Name="DAQmx Read (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D I32).vi"/>
				<Item Name="DAQmx Read (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U8).vi"/>
				<Item Name="DAQmx Read (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U16).vi"/>
				<Item Name="DAQmx Read (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read (Raw 1D U32).vi"/>
				<Item Name="DAQmx Read.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/read.llb/DAQmx Read.vi"/>
				<Item Name="DAQmx Write (Counter 1D Time 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1DTicks NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1DTicks NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Time NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Time 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Ticks 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Frequency 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Frequency 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="DTbl Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital Size.vi"/>
				<Item Name="DTbl Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Uncompress Digital.vi"/>
				<Item Name="DWDT Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Uncompress Digital.vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U8).vi"/>
				<Item Name="DAQmx Write (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U32).vi"/>
				<Item Name="DAQmx Write (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U16).vi"/>
				<Item Name="DAQmx Write (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I8).vi"/>
				<Item Name="DAQmx Write (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I32).vi"/>
				<Item Name="DAQmx Write (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I16).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Bool 1Line 1Point).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write.vi"/>
				<Item Name="LVPoint32TypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPoint32TypeDef.ctl"/>
				<Item Name="Read PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Create Mask By Alpha.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Create Mask By Alpha.vi"/>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi"/>
				<Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
				<Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
				<Item Name="DAQmx Create Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/task.llb/DAQmx Create Task.vi"/>
				<Item Name="DWDT Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Error Code.vi"/>
				<Item Name="DTbl Digital to Boolean Array.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital to Boolean Array.vi"/>
				<Item Name="DWDT Digital to Boolean Array.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Digital to Boolean Array.vi"/>
				<Item Name="Digital to Boolean Array.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDT.llb/Digital to Boolean Array.vi"/>
				<Item Name="LVSelectionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVSelectionTypeDef.ctl"/>
				<Item Name="Beep.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/Beep.vi"/>
				<Item Name="NI_AB_API_Build.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_API/Build/NI_AB_API_Build.lvclass"/>
				<Item Name="AB_API Get Build Object.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Get Build Object.vi"/>
				<Item Name="AB_API Build Object Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Build Object Type.ctl"/>
				<Item Name="AB_API Resolve References.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Resolve References.vi"/>
				<Item Name="AB_API Generate Error Cluster.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Generate Error Cluster.vi"/>
				<Item Name="AB_Build.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Build/AB_Build.lvclass"/>
				<Item Name="AB_Destination.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/AB_Destination.lvclass"/>
				<Item Name="AB_Destination.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/AB_Destination.ctl"/>
				<Item Name="Librarian Copy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Copy.vi"/>
				<Item Name="Compare Src And Dst.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Src And Dst.vi"/>
				<Item Name="Librarian Path Location.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Path Location.vi"/>
				<Item Name="Is Path and Not Empty.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Is Path and Not Empty.vi"/>
				<Item Name="Are Paths Equal.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Are Paths Equal.vi"/>
				<Item Name="Copy In Or Out Of VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy In Or Out Of VI Library.vi"/>
				<Item Name="Librarian File Info Out.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info Out.ctl"/>
				<Item Name="Librarian OK to Delete.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian OK to Delete.vi"/>
				<Item Name="Librarian Delete Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Delete Dialog.vi"/>
				<Item Name="Prepare VI Library for Copy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Prepare VI Library for Copy.vi"/>
				<Item Name="Temp Backup File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Backup File.vi"/>
				<Item Name="Temp Filename.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Filename.vi"/>
				<Item Name="Generate Temporary File Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Generate Temporary File Path.vi"/>
				<Item Name="Librarian.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian.vi"/>
				<Item Name="Librarian File Info In.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info In.ctl"/>
				<Item Name="Librarian File List.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File List.ctl"/>
				<Item Name="Temp Restore File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Temp Restore File.vi"/>
				<Item Name="Copy From Folder To Folder.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy From Folder To Folder.vi"/>
				<Item Name="Compare Src And Dst Simple.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Src And Dst Simple.vi"/>
				<Item Name="Copy From And To VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Copy From And To VI Library.vi"/>
				<Item Name="Delete From VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Delete From VI Library.vi"/>
				<Item Name="Librarian Rename.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Rename.vi"/>
				<Item Name="Librarian Delete.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian Delete.vi"/>
				<Item Name="Delete Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Delete Directory Recursive.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="AB_Long_Path_Error.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Long_Path_Error.vi"/>
				<Item Name="Create Directory Recursive.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Create Directory Recursive.vi"/>
				<Item Name="AB_Dest_LLB.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/Dest_LLB/AB_Dest_LLB.lvclass"/>
				<Item Name="New VI Library.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/New VI Library.vi"/>
				<Item Name="AB_Dest_App.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/Dest_Application/AB_Dest_App.lvclass"/>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi"/>
				<Item Name="AB_Dest_LegacyApp.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/Dest_LegacyApplication/AB_Dest_LegacyApp.lvclass"/>
				<Item Name="AB_Log_Enable_Logging.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Enable_Logging.vi"/>
				<Item Name="AB_Log_Save_Action.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Save_Action.ctl"/>
				<Item Name="AB_RW_Project_Destinations.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Destinations.vi"/>
				<Item Name="AB_RW_Project_Destination_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Destination_Data.ctl"/>
				<Item Name="AB_820_850_Convert_Path_to_Relative.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/Compatibility/AB_820_850_Convert_Path_to_Relative.vi"/>
				<Item Name="AB_820_850_Relative_Path_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/Compatibility/AB_820_850_Relative_Path_Type.ctl"/>
				<Item Name="AB_900_1000_Convert_Path_Tags.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/Compatibility/AB_900_1000_Convert_Path_Tags.vi"/>
				<Item Name="AB_900_1000_Change_Path_from_Label.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/Compatibility/AB_900_1000_Change_Path_from_Label.vi"/>
				<Item Name="AB_Source.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/AB_Source.lvclass"/>
				<Item Name="AB_Source_Inclusion.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Inclusion.ctl"/>
				<Item Name="AB_Source_Property_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Property_Type.ctl"/>
				<Item Name="AB_Source_Properties.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Properties.ctl"/>
				<Item Name="AB_Source.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/AB_Source.ctl"/>
				<Item Name="ABAPI Dist Boolean to (0,2).vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/ABAPI Dist Boolean to (0,2).vi"/>
				<Item Name="AB_Source_Get_Property.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Get_Property.vi"/>
				<Item Name="AB_Build.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Build/AB_Build.ctl"/>
				<Item Name="AB_Exclusion_Option.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Exclusion_Option.ctl"/>
				<Item Name="PreviewCache.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/PreviewCache/PreviewCache.lvclass"/>
				<Item Name="build preview data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/PreviewCache/build preview data.ctl"/>
				<Item Name="PreviewCache.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/PreviewCache/PreviewCache.ctl"/>
				<Item Name="MD5Checksum string.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum string.vi"/>
				<Item Name="MD5Checksum pad.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum pad.vi"/>
				<Item Name="MD5Checksum core.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum core.vi"/>
				<Item Name="MD5Checksum format message-digest.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum format message-digest.vi"/>
				<Item Name="AB_Parent_Applies.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Parent_Applies.ctl"/>
				<Item Name="AB_Source_Delete_Property.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Delete_Property.vi"/>
				<Item Name="AB_Source_Set_Property.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Set_Property.vi"/>
				<Item Name="AB_Source_Delete_Save_Settings.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Delete_Save_Settings.vi"/>
				<Item Name="AB_Engine_New_File_Info.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_New_File_Info.ctl"/>
				<Item Name="AB_Engine_New_File_Flags.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_New_File_Flags.ctl"/>
				<Item Name="AB_User_Log_Source_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_Source_Item.vi"/>
				<Item Name="AB_Log_File_Action.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_File_Action.ctl"/>
				<Item Name="Get VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library File Info.vi"/>
				<Item Name="AB_User_Log_FileIO.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_FileIO.vi"/>
				<Item Name="AB_User_Log_Start_Time.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_Start_Time.vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="AB_Source_Referenced_Libray_Files.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Referenced_Libray_Files.ctl"/>
				<Item Name="AB_Engine_Create_Preserve_Hierarchy_Destination.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Create_Preserve_Hierarchy_Destination.vi"/>
				<Item Name="AB_SubDirectory.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/Dest_SubDirectory/AB_SubDirectory.ctl"/>
				<Item Name="AB_Dest_SubDir.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Destination/Dest_SubDirectory/AB_Dest_SubDir.lvclass"/>
				<Item Name="AB_RW_Project_Source.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source.vi"/>
				<Item Name="AB_RW_Project_Source_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_Data.ctl"/>
				<Item Name="AB_Source_Property_WindowBehavior.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Property_WindowBehavior.ctl"/>
				<Item Name="AB_Source_Property_WindowRunTimePosition.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Property_WindowRunTimePosition.ctl"/>
				<Item Name="AB_Source_Property_CCodeGen.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Property_CCodeGen.ctl"/>
				<Item Name="AB_Source_Property_CCodeGen_Inline.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Property_CCodeGen_Inline.ctl"/>
				<Item Name="AB_RW_Source_Decpwd.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Source_Decpwd.vi"/>
				<Item Name="AB_RW_Source_Encpwd.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Source_Encpwd.vi"/>
				<Item Name="AB_Engine_Consolidated_Save_Item_Info.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Consolidated_Save_Item_Info.ctl"/>
				<Item Name="AB_Get Current VI Settings.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get Current VI Settings.vi"/>
				<Item Name="AB_Engine_Should_Assume_Refee_Links.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Should_Assume_Refee_Links.vi"/>
				<Item Name="AB_Engine_Is_Instance_VI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Is_Instance_VI.vi"/>
				<Item Name="AB_Engine_Is_Private_Data_Control.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Is_Private_Data_Control.vi"/>
				<Item Name="AB_Source_Container.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/Container/AB_Source_Container.lvclass"/>
				<Item Name="AB_Source_Container.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/Container/AB_Source_Container.ctl"/>
				<Item Name="AB_Source_Get_SaveLevel.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Source_Get_SaveLevel.vi"/>
				<Item Name="AB_RW_Project_Source_Container.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_Container.vi"/>
				<Item Name="AB_RW_Project_Source_Container_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_Container_Data.ctl"/>
				<Item Name="AB_Source_PackedItem.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/PackedItem/AB_Source_PackedItem.lvclass"/>
				<Item Name="AB_Source_PackedItem.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/PackedItem/AB_Source_PackedItem.ctl"/>
				<Item Name="AB_Source_VI.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/VI/AB_Source_VI.ctl"/>
				<Item Name="AB_Source_VI.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/VI/AB_Source_VI.lvclass"/>
				<Item Name="AB_Get_VI_Checksum.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get_VI_Checksum.vi"/>
				<Item Name="AB_Get_Skip_Icon_Token.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get_Skip_Icon_Token.vi"/>
				<Item Name="AB_Get_VI_Scope.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get_VI_Scope.vi"/>
				<Item Name="AB_RW_Project_Source_VI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_VI.vi"/>
				<Item Name="AB_RW_Project_Source_VI_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_VI_Data.ctl"/>
				<Item Name="AB_Source_Library.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/Library/AB_Source_Library.lvclass"/>
				<Item Name="AB_Source_Library.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/Library/AB_Source_Library.ctl"/>
				<Item Name="AB_Engine_Find_Unreferenced_Library_Members.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Find_Unreferenced_Library_Members.vi"/>
				<Item Name="AB_API Attribute Error_Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Attribute Error_Path.vi"/>
				<Item Name="AB_RW_Project_Source_Library.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_Library.vi"/>
				<Item Name="AB_RW_Project_Source_Library_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_Library_Data.ctl"/>
				<Item Name="AB_Engine_Disconnect_Typedefs.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Disconnect_Typedefs.vi"/>
				<Item Name="AB_Source_ExportedVI.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/ExportedVI/AB_Source_ExportedVI.lvclass"/>
				<Item Name="ABAPI Dist VI Proto Info New.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/ABAPI Dist VI Proto Info New.ctl"/>
				<Item Name="AB_ExportedVI_Define_VI_Prototype New.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/ExportedVI/AB_ExportedVI_Define_VI_Prototype New.vi"/>
				<Item Name="AB_RW_Project_Source_ExportedVI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_ExportedVI.vi"/>
				<Item Name="AB_RW_Project_Source_ExportedVI_Data_New.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_ExportedVI_Data_New.ctl"/>
				<Item Name="AB_Source_RESTfulVI.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/AB_Source_RESTfulVI.lvclass"/>
				<Item Name="AB_RESTful_VIType.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/Configure_RESTfulVI/AB_RESTful_VIType.ctl"/>
				<Item Name="AB_RESTful_OutputType.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/Configure_RESTfulVI/AB_RESTful_OutputType.ctl"/>
				<Item Name="AB_RESTful_OutputFormat.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/Configure_RESTfulVI/AB_RESTful_OutputFormat.ctl"/>
				<Item Name="AB_RESTful_Configuration.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/Configure_RESTfulVI/AB_RESTful_Configuration.ctl"/>
				<Item Name="AB_RESTfulVI_Configuration_Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/RESTfulVI/Configure_RESTfulVI/AB_RESTfulVI_Configuration_Dialog.vi"/>
				<Item Name="AB_RW_Project_Source_RESTfulVI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_RESTfulVI.vi"/>
				<Item Name="AB_RW_Project_Source_RESTfulVI_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Source_RESTfulVI_Data.ctl"/>
				<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value.vi"/>
				<Item Name="AB_Source_Processed_Info.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Source/AB_Source_Processed_Info.ctl"/>
				<Item Name="AB_CopyFiles_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_CopyFiles_Data.ctl"/>
				<Item Name="DynPos_Vertically Move Row.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/dynamicPosition.llb/DynPos_Vertically Move Row.vi"/>
				<Item Name="AB_RW_Project_Cache_Info.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Cache_Info.vi"/>
				<Item Name="AB_RW_Project_Cache_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Project_Cache_Data.ctl"/>
				<Item Name="AB_Dependency.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Dependency.ctl"/>
				<Item Name="AB_Log_FileIO.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_FileIO.vi"/>
				<Item Name="AB_Log_Alloc_Memory.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Alloc_Memory.vi"/>
				<Item Name="AB_Engine_Lock_or_Unlock_Instantiations.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Lock_or_Unlock_Instantiations.vi"/>
				<Item Name="AB_User_Log_Open.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_Open.vi"/>
				<Item Name="AB_Engine_Check_For_Stress_Chars.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Check_For_Stress_Chars.vi"/>
				<Item Name="AB_ProgressBar_Fire_New_Job.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_ProgressBar_Fire_New_Job.vi"/>
				<Item Name="AB_ProgressBar_Fire_New_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_ProgressBar_Fire_New_Item.vi"/>
				<Item Name="AB_User_Log_Output_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_Output_Item.vi"/>
				<Item Name="AB_User_Log_Errors.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_User_Log_Errors.vi"/>
				<Item Name="AB_Version_Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Version_Path.vi"/>
				<Item Name="AB_Log_Error_Usage_Data.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Log_Error_Usage_Data.vi"/>
				<Item Name="AB_Log_Error_Usage_Data_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Log_Error_Usage_Data_Type.ctl"/>
				<Item Name="niceiplib.lvlib" Type="Library" URL="/&lt;vilib&gt;/UDC/niceiplib.lvlib"/>
				<Item Name="Get LV Class Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Path.vi"/>
				<Item Name="ABAPI Dist Get All VIs in Memory.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/ABAPI Dist Get All VIs in Memory.vi"/>
				<Item Name="AB_Set_LLB_Caching.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_LLB_Caching.vi"/>
				<Item Name="Set VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Set VI Library File Info.vi"/>
				<Item Name="AB_Log_Copy_Source_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Copy_Source_Item.vi"/>
				<Item Name="AB_Log_Write_Linker.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Write_Linker.vi"/>
				<Item Name="AB_Engine_Call_MathScript.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Call_MathScript.vi"/>
				<Item Name="AB_Log_Copy_File_VI_State.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Copy_File_VI_State.vi"/>
				<Item Name="AB_Engine_Update_CustCtl_Paths.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Update_CustCtl_Paths.vi"/>
				<Item Name="AB_Engine_Write_Linker_Wrapper.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Write_Linker_Wrapper.vi"/>
				<Item Name="AB_Log_Destinations.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Destinations.vi"/>
				<Item Name="AB_Set_Destination_Path_CORE.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Destination_Path_CORE.vi"/>
				<Item Name="AB_Get_Default_LVLang.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get_Default_LVLang.vi"/>
				<Item Name="AB_Log_Build_Preview.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Build_Preview.vi"/>
				<Item Name="AB_Convert_To_Relative_Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Convert_To_Relative_Path.vi"/>
				<Item Name="AB_Engine_Reassign_Destinations_For_Preserve_Hierarchy.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Reassign_Destinations_For_Preserve_Hierarchy.vi"/>
				<Item Name="AB_Engine_PPL_Source_Index.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_PPL_Source_Index.ctl"/>
				<Item Name="AB_Engine_Construct_PPL_Table.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Construct_PPL_Table.vi"/>
				<Item Name="AB_Log_SaveClose_Source_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_SaveClose_Source_Item.vi"/>
				<Item Name="AB_Close_VI_and_Library_Arrays.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Close_VI_and_Library_Arrays.vi"/>
				<Item Name="AB_Get_Skip_Close_Token.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Get_Skip_Close_Token.vi"/>
				<Item Name="AB_CheckApplicationDestinations.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_CheckApplicationDestinations.vi"/>
				<Item Name="AB_Version_Info.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Version_Info.ctl"/>
				<Item Name="AB_Engine_Update_Source_from_Linker.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Update_Source_from_Linker.vi"/>
				<Item Name="AB_Engine_Linker_Inclusion.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Linker_Inclusion.ctl"/>
				<Item Name="AB_Engine_Get_UD_Refnum_Files.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Get_UD_Refnum_Files.vi"/>
				<Item Name="AB_Paths_To_Strings.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Paths_To_Strings.vi"/>
				<Item Name="AB_Log_LinkerInfo.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_LinkerInfo.vi"/>
				<Item Name="AB_Path_To_String.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Path_To_String.vi"/>
				<Item Name="AB_Engine_Check_Excluded_Directories.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Check_Excluded_Directories.vi"/>
				<Item Name="AB_Engine_Check_Excluded_Dep_FileTypes.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Check_Excluded_Dep_FileTypes.vi"/>
				<Item Name="AB_Engine_Compute_Toplevel_Implied_Links.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Compute_Toplevel_Implied_Links.vi"/>
				<Item Name="AB_Engine_Compute_PackedLib_Implied_Links.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Compute_PackedLib_Implied_Links.vi"/>
				<Item Name="AB_Engine_Check_for_nonVI_Link.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Check_for_nonVI_Link.vi"/>
				<Item Name="AB_Engine_HandleLinkerErrorsVerbose.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_HandleLinkerErrorsVerbose.vi"/>
				<Item Name="AB_Engine_PathNode.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_PathNode.ctl"/>
				<Item Name="AB_Engine_CreateVisitedVIsStructures.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_CreateVisitedVIsStructures.vi"/>
				<Item Name="AB_Engine_LinkerErrorVerboseShouldAnalyze.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_LinkerErrorVerboseShouldAnalyze.vi"/>
				<Item Name="AB_Engine_AddVisitedVI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_AddVisitedVI.vi"/>
				<Item Name="AB_Engine_FindVisitedVI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_FindVisitedVI.vi"/>
				<Item Name="AB_Engine_CreateMissingVIsTree.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_CreateMissingVIsTree.vi"/>
				<Item Name="AB_Engine_HandleLinkErrors.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_HandleLinkErrors.vi"/>
				<Item Name="AB_Log_Linker_Item.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Linker_Item.vi"/>
				<Item Name="AB_Log_Linker_Item_No_Class.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Linker_Item_No_Class.vi"/>
				<Item Name="AB_Engine_Check_For_Dep_FileTypes.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Check_For_Dep_FileTypes.vi"/>
				<Item Name="AB_Engine_Detect_Additional_Dependencies.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Detect_Additional_Dependencies.vi"/>
				<Item Name="AB_Detect_Additional_Dependencies.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Detect_Additional_Dependencies.vi"/>
				<Item Name="AB_Load_Class.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/AB_Load_Class.vi"/>
				<Item Name="AB_RW_Non_Persistent_Tags.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Non_Persistent_Tags.vi"/>
				<Item Name="AB_RW_Non_Persistent_Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Non_Persistent_Data.ctl"/>
				<Item Name="AB_RW_Cache_Project_Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/RW_Project/AB_RW_Cache_Project_Path.vi"/>
				<Item Name="PreBuildVIRef.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Build/PreBuildVIRef.ctl"/>
				<Item Name="AB_Engine_Get_User_Build_Data.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Engine/AB_Engine_Get_User_Build_Data.vi"/>
				<Item Name="AB_Log_ClassData.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_ClassData.vi"/>
				<Item Name="PostBuildVIRef.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Classes/Build/PostBuildVIRef.ctl"/>
				<Item Name="AB_API Add Destination.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Add Destination.vi"/>
				<Item Name="AB_API Destination Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Destination Type.ctl"/>
				<Item Name="AB_Destination_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Destination_Type.ctl"/>
				<Item Name="AB_Is_Destination_Present.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Is_Destination_Present.vi"/>
				<Item Name="AB_Add_Destination_CORE.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Add_Destination_CORE.vi"/>
				<Item Name="AB_Set_Destination_Type.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Destination_Type.vi"/>
				<Item Name="AB_Set_Preserve_Hierarchy.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Preserve_Hierarchy.vi"/>
				<Item Name="AB_API Build.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Build.vi"/>
				<Item Name="AB_API Prepare Two Step Build.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Prepare Two Step Build.vi"/>
				<Item Name="AB_Log_Open.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Open.vi"/>
				<Item Name="AB_Log_NewBuild.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_NewBuild.vi"/>
				<Item Name="AB_API Do Two Step Build.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Do Two Step Build.vi"/>
				<Item Name="AB_Log_Close.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/logging/AB_Log_Close.vi"/>
				<Item Name="AB_API Create Library For Destination.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Create Library For Destination.vi"/>
				<Item Name="AB_Set_Library_Name_For_Destination.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Library_Name_For_Destination.vi"/>
				<Item Name="AB_API Build Object Selector.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Build Object Selector.ctl"/>
				<Item Name="AB_API Factory.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Factory.vi"/>
				<Item Name="AB_API Create Build Object.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Create Build Object.vi"/>
				<Item Name="AB_API ProgressBar_BuildError.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API ProgressBar_BuildError.ctl"/>
				<Item Name="AB_API ProgressBar_Events.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API ProgressBar_Events.ctl"/>
				<Item Name="AB_API Create ProgressBar Events.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Create ProgressBar Events.vi"/>
				<Item Name="AB_API Enable VI Checksums.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Enable VI Checksums.vi"/>
				<Item Name="AB_API Get Destinations.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Get Destinations.vi"/>
				<Item Name="AB_API Destination Data.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Destination Data.ctl"/>
				<Item Name="AB_API Get Destination Name.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Get Destination Name.vi"/>
				<Item Name="AB_API Default Destinations.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Default Destinations.ctl"/>
				<Item Name="AB_API Primary Exclusions.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Primary Exclusions.ctl"/>
				<Item Name="AB_API Get Primary Destination Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Get Primary Destination Path.vi"/>
				<Item Name="AB_API Version Number.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Version Number.ctl"/>
				<Item Name="AB_API Rename Source.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Rename Source.vi"/>
				<Item Name="AB_API Apply Setting Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Apply Setting Type.ctl"/>
				<Item Name="AB_API Is Source Item Present.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Is Source Item Present.vi"/>
				<Item Name="AB_API Add Source Item To Array.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Add Source Item To Array.vi"/>
				<Item Name="AB_Rename_Source_CORE.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Rename_Source_CORE.vi"/>
				<Item Name="AB_API Apply Setting.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Apply Setting.vi"/>
				<Item Name="AB_API Set Check For Broken VIs.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Check For Broken VIs.vi"/>
				<Item Name="AB_API Set Destination Path.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Destination Path.vi"/>
				<Item Name="AB Update Dest Dir.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB Update Dest Dir.vi"/>
				<Item Name="AB_API Set Destination Preserve Hierarchy.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Destination Preserve Hierarchy.vi"/>
				<Item Name="AB_API Set Destination.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Destination.vi"/>
				<Item Name="AB_Set_Destination_CORE.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Destination_CORE.vi"/>
				<Item Name="AB_Set_Path_Exclusions.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Path_Exclusions.vi"/>
				<Item Name="AB_API Path Exclusions.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Path Exclusions.ctl"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="Read Class Ancestry Without Loading.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Read Class Ancestry Without Loading.vi"/>
				<Item Name="Is Class Not Interface Without Loading.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Is Class Not Interface Without Loading.vi"/>
				<Item Name="VIAnUtil Has Panel.vi" Type="VI" URL="/&lt;vilib&gt;/addons/analyzer/_analyzerutils.llb/VIAnUtil Has Panel.vi"/>
				<Item Name="VIAnUtil Has Diagram.vi" Type="VI" URL="/&lt;vilib&gt;/addons/analyzer/_analyzerutils.llb/VIAnUtil Has Diagram.vi"/>
				<Item Name="VIAnUtil Clear Specific Error.vi" Type="VI" URL="/&lt;vilib&gt;/addons/analyzer/_analyzerutils.llb/VIAnUtil Clear Specific Error.vi"/>
				<Item Name="LVFixedPointRepBitsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/fxp/LVFixedPointRepBitsTypeDef.ctl"/>
				<Item Name="LVFixedPointRepRangeTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/fxp/LVFixedPointRepRangeTypeDef.ctl"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
				<Item Name="LVPositionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPositionTypeDef.ctl"/>
				<Item Name="NewVIObject_LVRelativePositionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/_script/New VI Object TypeDefs/NewVIObject_LVRelativePositionTypeDef.ctl"/>
				<Item Name="NewVIObject_LVRelativeDirectionTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/_script/New VI Object TypeDefs/NewVIObject_LVRelativeDirectionTypeDef.ctl"/>
				<Item Name="Get Current LV Bitness.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/Get Current LV Bitness.vi"/>
				<Item Name="AB_Set_Exclusions.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Exclusions.vi"/>
				<Item Name="AB_API Set Password.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Password.vi"/>
				<Item Name="AB_Password_Setting.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Password_Setting.ctl"/>
				<Item Name="AB_Set_Password_CORE.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Password_CORE.vi"/>
				<Item Name="AB_API Add Pre or Post Build Action VI.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Add Pre or Post Build Action VI.vi"/>
				<Item Name="AB_API Build Action Type.ctl" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Build Action Type.ctl"/>
				<Item Name="AB_API Set Save Settings.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Save Settings.vi"/>
				<Item Name="AB_Set_Source_Property.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_Set_Source_Property.vi"/>
				<Item Name="AB_API Set Verbose Linker Errors.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/AB_API/common/AB_API Set Verbose Linker Errors.vi"/>
				<Item Name="GetTargetBuildSpecs.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs.vi"/>
				<Item Name="Invoke BuildTarget.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/Invoke BuildTarget.vi"/>
				<Item Name="NI_Bit Manipulation.lvlib" Type="Library" URL="/&lt;vilib&gt;/Bit Manipulation/NI_Bit Manipulation.lvlib"/>
				<Item Name="NI_SHA-512.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-2/SHA-512/NI_SHA-512.lvclass"/>
				<Item Name="NI_SHA-256.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-2/SHA-256/NI_SHA-256.lvclass"/>
				<Item Name="NI_Message Digest API.lvlib" Type="Library" URL="/&lt;vilib&gt;/security/Message Digest/API/NI_Message Digest API.lvlib"/>
				<Item Name="NI_SHA-3.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-3/NI_SHA-3.lvclass"/>
				<Item Name="NI_Keccak.lvlib" Type="Library" URL="/&lt;vilib&gt;/security/Message Digest/Keccak/NI_Keccak.lvlib"/>
				<Item Name="lib_NI_Advanced HTTP Client.lvlib" Type="Library" URL="/&lt;vilib&gt;/NI/Advanced HTTP Client/lib_NI_Advanced HTTP Client.lvlib"/>
				<Item Name="lvwebclient_32.dll" Type="Document" URL="/&lt;vilib&gt;/NI/Advanced HTTP Client/lvwebclient_32.dll"/>
			</Item>
			<Item Name="AB_UI_Change_Path_from_Label.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Change_Path_from_Label.vi"/>
			<Item Name="CDK_GLOBAL_STRINGS.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/Installer/CDK_GLOBAL_STRINGS.vi"/>
			<Item Name="CDK_sTypeDef_Languages.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/Installer/CDK_sTypeDef_Languages.ctl"/>
			<Item Name="CDK_sTypeDef_ProductVersion.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/Installer/CDK_sTypeDef_ProductVersion.ctl"/>
			<Item Name="CDK_Utility_GetSetStringVersion.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/Installer/CDK_Utility_GetSetStringVersion.vi"/>
			<Item Name="Element to Type.vim" Type="VI" URL="../../lv-cdm/CDM-Config/Element to Type.vim"/>
			<Item Name="ItemRef.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/ItemRef.ctl"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="mxLvDebugDisplayCaller.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvDebugDisplayCaller.vi"/>
			<Item Name="mxLvDeleteProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvDeleteProperty.vi"/>
			<Item Name="mxLvErrorHandler.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvErrorHandler.vi"/>
			<Item Name="mxLvGetBooleanProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetBooleanProperty.vi"/>
			<Item Name="mxLvGetIntProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetIntProperty.vi"/>
			<Item Name="mxLvGetItem.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetItem.vi"/>
			<Item Name="mxLvGetNIIM.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetNIIM.vi"/>
			<Item Name="mxLvGetPathProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetPathProperty.vi"/>
			<Item Name="mxLvGetProjectPath.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetProjectPath.vi"/>
			<Item Name="mxLvGetProjectRef.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetProjectRef.vi"/>
			<Item Name="mxLvGetRefProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetRefProperty.vi"/>
			<Item Name="mxLvGetStringProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetStringProperty.vi"/>
			<Item Name="mxLvGetTarget.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetTarget.vi"/>
			<Item Name="mxLvNIIM.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvNIIM.ctl"/>
			<Item Name="mxLvProvider.mxx" Type="Document" URL="/&lt;resource&gt;/Framework/Providers/mxLvProvider.mxx"/>
			<Item Name="mxLvSetBooleanProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetBooleanProperty.vi"/>
			<Item Name="mxLvSetIntProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetIntProperty.vi"/>
			<Item Name="mxLvSetPathProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetPathProperty.vi"/>
			<Item Name="mxLvSetRefProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetRefProperty.vi"/>
			<Item Name="mxLvSetStringProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetStringProperty.vi"/>
			<Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="provcom_CheckForInvalidCharacters.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_CheckForInvalidCharacters.vi"/>
			<Item Name="provcom_GetTargetOS.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_GetTargetOS.vi"/>
			<Item Name="provcom_StringGlobals.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_StringGlobals.vi"/>
			<Item Name="provcom_Utility_IsEmptyOrWhiteSpace.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_Utility_IsEmptyOrWhiteSpace.vi"/>
			<Item Name="Type to Config.vim" Type="VI" URL="../../lv-cdm/CDM-Config/Config-JSON/Type to Config.vim"/>
			<Item Name="RequestTwoDouble.lvlib" Type="Library" URL="../../lv-vecto/VectoScratch/proto/messages/RequestTwoDouble/RequestTwoDouble.lvlib"/>
			<Item Name="ReplyOneDouble.lvlib" Type="Library" URL="../../lv-vecto/VectoScratch/proto/messages/ReplyOneDouble/ReplyOneDouble.lvlib"/>
			<Item Name="AB_UI_Page_Destination_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Destination_References.ctl"/>
			<Item Name="LV Config Read Numeric (I32).vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read Numeric (I32).vi"/>
			<Item Name="LV Config Read Boolean.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read Boolean.vi"/>
			<Item Name="AB_UI_Page_Source_Files_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Files_References.ctl"/>
			<Item Name="provcom_ProgressBar_Events.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_Events.ctl"/>
			<Item Name="mxLvBuildError.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvBuildError.ctl"/>
			<Item Name="GetSymbols.vi" Type="VI" URL="/&lt;resource&gt;/plugins/Utility/IfDef.llb/GetSymbols.vi"/>
			<Item Name="AB_SRdB_Source_ReadALL.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Source/AB_SRdB_Source_ReadALL.vi"/>
			<Item Name="AB_SRdB_Action.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/AB_SRdB_Action.ctl"/>
			<Item Name="AB_SRdB_Source.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Source/AB_SRdB_Source.vi"/>
			<Item Name="AB_SRdB_Error.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/AB_SRdB_Error.vi"/>
			<Item Name="AB_UI_Page_Source_Settings_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Settings_References.ctl"/>
			<Item Name="AB_UI_Page_Source_Settings_supportedFunctions.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Settings_supportedFunctions.ctl"/>
			<Item Name="provcom_ProgressBar_FireErrorEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_FireErrorEvent.vi"/>
			<Item Name="AB_UI_Page_Source_Add_Container.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Add_Container.vi"/>
			<Item Name="AB_SRdB_Source_pgSource_Remove.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Source/AB_SRdB_Source_pgSource_Remove.vi"/>
			<Item Name="AB_UI_Page_Source_Remove_Container.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Remove_Container.vi"/>
			<Item Name="AB_UI_VI_Settings_Customized.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_VI_Settings_Customized.vi"/>
			<Item Name="AB_SRdB_Build_Read.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Build/AB_SRdB_Build_Read.vi"/>
			<Item Name="AB_SRdB_Build.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Build/AB_SRdB_Build.vi"/>
			<Item Name="mxLvGetBinaryProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGetBinaryProperty.vi"/>
			<Item Name="mxLvSetBinaryProperty.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetBinaryProperty.vi"/>
			<Item Name="AB_UI_Page_Exclusions_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Exclusions_References.ctl"/>
			<Item Name="AB_UI_Page_Advanced_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Advanced_References.ctl"/>
			<Item Name="AB_UI_Page_Info_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Info_References.ctl"/>
			<Item Name="AB_SRdB_Destination_Update_with_Label.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Destination/AB_SRdB_Destination_Update_with_Label.vi"/>
			<Item Name="AB_SRdB_Destination_Update_with_BasePath.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/SRdB/Destination/AB_SRdB_Destination_Update_with_BasePath.vi"/>
			<Item Name="AB_UI_Change_Relative_Paths.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Change_Relative_Paths.vi"/>
			<Item Name="AB_UI_Page_Source_Files_supportedFunctions.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Files_supportedFunctions.ctl"/>
			<Item Name="provcom_MassEnableDisableControls.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_MassEnableDisableControls.vi"/>
			<Item Name="provcom_EnableDisableControl.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_EnableDisableControl.vi"/>
			<Item Name="AB_UI_Page_Source_Files_ResizeTrees.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Source_Files_ResizeTrees.vi"/>
			<Item Name="provcom_DrawSourceAndDependencies.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_DrawSourceAndDependencies.vi"/>
			<Item Name="provcom_HideInBuildSpecBehavior.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_HideInBuildSpecBehavior.vi"/>
			<Item Name="provcom_DrawProjectItems.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_DrawProjectItems.vi"/>
			<Item Name="provcom_GetAllChildrenOfItem.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_GetAllChildrenOfItem.vi"/>
			<Item Name="provcom_DrawTreeItem.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_DrawTreeItem.vi"/>
			<Item Name="provcom_CallbackKeyedArray.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_CallbackKeyedArray.ctl"/>
			<Item Name="BUIP_Callback_Files_Filter.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/Common/BUIP_Callback_Files_Filter.vi"/>
			<Item Name="AB_UI_Page_Version_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Version_References.ctl"/>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="AB_UI_Page_Web_Services_References.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_UI_Page_Web_Services_References.ctl"/>
			<Item Name="provcom_GenerateGUID.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_GenerateGUID.vi"/>
			<Item Name="mxLvGenerateGuid.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvGenerateGuid.vi"/>
			<Item Name="AB_Get_Target_OS_CPU.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_Get_Target_OS_CPU.vi"/>
			<Item Name="BuildMonitor_BuildItems_Close.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/BuildMonitor/BuildMonitor_BuildItems_Close.vi"/>
			<Item Name="mxLvBuildNewJob.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvBuildNewJob.ctl"/>
			<Item Name="mxLvBuildNewItem.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvBuildNewItem.ctl"/>
			<Item Name="mxLvBuildCancel.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvBuildCancel.ctl"/>
			<Item Name="provcom_ProgressBar_GetErrorFromErrorWindow.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_GetErrorFromErrorWindow.vi"/>
			<Item Name="provcom_ProgressBar_FireNewJobEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_FireNewJobEvent.vi"/>
			<Item Name="BuildMonitor_BuildItems_Init.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/BuildMonitor/BuildMonitor_BuildItems_Init.vi"/>
			<Item Name="provcom_ProgressBar_Dialog_Text.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_Dialog_Text.ctl"/>
			<Item Name="provcom_ProgressBar_InitializeErrorCloseEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InitializeErrorCloseEvent.vi"/>
			<Item Name="provcom_ProgressBar_InitializeErrorOpenEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InitializeErrorOpenEvent.vi"/>
			<Item Name="provcom_ProgressBar_InitializeErrorEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InitializeErrorEvent.vi"/>
			<Item Name="provcom_ProgressBar_InitializeCancelEvent.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InitializeCancelEvent.vi"/>
			<Item Name="provcom_ProgressBar_InitializeProgressBarEvents.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InitializeProgressBarEvents.vi"/>
			<Item Name="provcom_ProgressBar_InvokeErrorWindow.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InvokeErrorWindow.vi"/>
			<Item Name="provcom_ProgressBar_InvokeProgressBar.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Common/provcom_ProgressBar_InvokeProgressBar.vi"/>
			<Item Name="AB_Create_Build_AppInstance.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_Create_Build_AppInstance.vi"/>
			<Item Name="AB_Update_Target_Syntax.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_Update_Target_Syntax.vi"/>
			<Item Name="AB_Ignore_Unresolved_DLL_Ref.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_Ignore_Unresolved_DLL_Ref.vi"/>
			<Item Name="mxLvDeleteAllProperties.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvDeleteAllProperties.vi"/>
			<Item Name="AB_Is_Linux_ARM_Target.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/Builds/AppBuilder/AB_Is_Linux_ARM_Target.vi"/>
			<Item Name="mxLvSetName.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvSetName.vi"/>
			<Item Name="mxLvUpdateUI.vi" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvUpdateUI.vi"/>
			<Item Name="mxLvUpdateUI.ctl" Type="VI" URL="/&lt;resource&gt;/Framework/Providers/API/mxLvUpdateUI.ctl"/>
			<Item Name="_ChannelScriptingSupport.lvlib" Type="Library" URL="/&lt;resource&gt;/ChannelSupport/_ChannelScriptingSupport/_ChannelScriptingSupport.lvlib"/>
			<Item Name="GetTemplatePathFromLib.vi" Type="VI" URL="/&lt;resource&gt;/ChannelSupport/_ChannelScriptingSupport/GetTemplatePathFromLib.vi"/>
			<Item Name="LV Config Read.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read.vi"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="LV Config Read Pathlist.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read Pathlist.vi"/>
			<Item Name="LV Config Read Color.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read Color.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="DemoApp" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{A6474FA9-AFC1-4E0F-88DA-9FDBF3C5BADF}</Property>
				<Property Name="App_INI_GUID" Type="Str">{AB9976B3-9B13-4C0C-B4D8-65AA6863B324}</Property>
				<Property Name="App_INI_itemID" Type="Ref">/My Computer/config/volatus.ini</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="App_winsec.description" Type="Str">http://www.NI.com</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{44168467-824B-4CD0-9F3F-25F12F99F4E6}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">DemoApp</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/DemoApp</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_postActionVIID" Type="Ref">/My Computer/VolatusBuild.lvlib/PrePost Actions/Volatus Post-Build Action.vi</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/VolatusBuild.lvlib/PrePost Actions/Volatus Pre-Build Action.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{1EE8B398-2758-4770-8AC8-ED4F8E8C0311}</Property>
				<Property Name="Bld_version.build" Type="Int">8</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">demoapp.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/DemoApp/demoapp.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/DemoApp/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{9884A6E1-141A-4A2A-A8E0-3561E99C019C}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VolatusScratch.lvlib/DAQmx Test.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">NI</Property>
				<Property Name="TgtF_fileDescription" Type="Str">DemoApp</Property>
				<Property Name="TgtF_internalName" Type="Str">DemoApp</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI</Property>
				<Property Name="TgtF_productName" Type="Str">DemoApp</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{DD6C92F7-B718-47B0-AAF1-5CCFE4738F41}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">demoapp.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Test" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{5AD1DDC5-5185-4558-A269-F5F08597CB94}</Property>
				<Property Name="App_INI_GUID" Type="Str">{138D78C2-5B07-4C17-99D7-8677C94828C2}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="App_winsec.description" Type="Str">http://www.NI.com</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{E95C56EC-178B-4321-9E81-E837424900AA}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Test</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Test</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{22486F4F-BBBD-4AF2-A8AA-5EB2DA261A90}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">test.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Test/test.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Test/data</Property>
				<Property Name="Destination[2].destName" Type="Str">root</Property>
				<Property Name="Destination[2].path" Type="Path">../builds/NI_AB_PROJECTNAME/Test</Property>
				<Property Name="Destination[2].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="Source[0].itemID" Type="Str">{167C3D7D-4265-4B6D-AA2B-0F399851DDE3}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VolatusScratch.lvlib/Test Main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref"></Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">NI</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Test</Property>
				<Property Name="TgtF_internalName" Type="Str">Test</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 NI</Property>
				<Property Name="TgtF_productName" Type="Str">Test</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{31D31149-2E4B-4286-A38A-5510367E47BA}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">test.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Generic Volatus PC" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{4CC6C983-74C6-4188-B5B6-644252522E12}</Property>
				<Property Name="App_INI_GUID" Type="Str">{5827CBD0-8D33-4603-A580-170018C8EC77}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="App_winsec.description" Type="Str">http://www.NI.com</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{08E8D3DC-2A37-4F54-B637-BA34209C0687}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Generic Volatus PC</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus PC</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{53E88FC8-62FE-49BC-B0E8-31027488BA4F}</Property>
				<Property Name="Bld_version.build" Type="Int">2</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Bld_version.minor" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">volatus.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus PC/volatus.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus PC/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{84072A98-2223-4A36-B9B6-84596A90EC84}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Generic PC App.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">IlluminatedG</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Generic Volatus PC</Property>
				<Property Name="TgtF_internalName" Type="Str">Generic Volatus PC</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2025 IlluminatedG</Property>
				<Property Name="TgtF_productName" Type="Str">Generic Volatus PC</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{11ECEA23-BACC-4337-9C40-5CDAAD7AF22B}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">volatus.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
			<Item Name="Generic Volatus Pkg" Type="{E661DAE2-7517-431F-AC41-30807A3BDA38}">
				<Property Name="NIPKG_addToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToSystemLink" Type="Bool">false</Property>
				<Property Name="NIPKG_certificates" Type="Bool">false</Property>
				<Property Name="NIPKG_createInstaller" Type="Bool">false</Property>
				<Property Name="NIPKG_feedLocation" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus Pkg/Feed</Property>
				<Property Name="NIPKG_feedLocation.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_installerArtifacts" Type="Str"></Property>
				<Property Name="NIPKG_installerBuiltBefore" Type="Bool">false</Property>
				<Property Name="NIPKG_installerDestination" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus Pkg/Package Installer</Property>
				<Property Name="NIPKG_installerDestination.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_lastBuiltPackage" Type="Str">lv-volatus-generic_1.1.0-2_windows_all.nipkg</Property>
				<Property Name="NIPKG_license" Type="Ref"></Property>
				<Property Name="NIPKG_packageVersion" Type="Bool">false</Property>
				<Property Name="NIPKG_releaseNotes" Type="Str"></Property>
				<Property Name="NIPKG_storeProduct" Type="Bool">false</Property>
				<Property Name="NIPKG_VisibleForRuntimeDeployment" Type="Bool">false</Property>
				<Property Name="PKG_actions.Count" Type="Int">0</Property>
				<Property Name="PKG_autoIncrementBuild" Type="Bool">false</Property>
				<Property Name="PKG_autoSelectDeps" Type="Bool">true</Property>
				<Property Name="PKG_buildNumber" Type="Int">2</Property>
				<Property Name="PKG_buildSpecName" Type="Str">Generic Volatus Pkg</Property>
				<Property Name="PKG_dependencies.Count" Type="Int">2</Property>
				<Property Name="PKG_dependencies[0].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[0].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MinVersion" Type="Str">23.0.0.49366-0+f214</Property>
				<Property Name="PKG_dependencies[0].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[0].NIPKG.DisplayName" Type="Str">NI-DAQmx Runtime</Property>
				<Property Name="PKG_dependencies[0].Package.Name" Type="Str">ni-daqmx-runtime-core</Property>
				<Property Name="PKG_dependencies[0].Package.Section" Type="Str">Drivers</Property>
				<Property Name="PKG_dependencies[0].Package.Synopsis" Type="Str">Run-time components required to deploy applications using NI data acquisition devices.</Property>
				<Property Name="PKG_dependencies[0].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[0].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_dependencies[1].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[1].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[1].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[1].MinVersion" Type="Str">20.1.1.49157-0+f5</Property>
				<Property Name="PKG_dependencies[1].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[1].NIPKG.DisplayName" Type="Str">LabVIEW Runtime (32-bit)</Property>
				<Property Name="PKG_dependencies[1].Package.Name" Type="Str">ni-labview-2020-runtime-engine-x86</Property>
				<Property Name="PKG_dependencies[1].Package.Section" Type="Str">Programming Environments</Property>
				<Property Name="PKG_dependencies[1].Package.Synopsis" Type="Str">The LabVIEW Runtime is a software add-on that enables engineers to run executables on a nondevelopment machine.</Property>
				<Property Name="PKG_dependencies[1].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[1].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_description" Type="Str"></Property>
				<Property Name="PKG_destinations.Count" Type="Int">1</Property>
				<Property Name="PKG_destinations[0].ID" Type="Str">{99E085CF-78B9-4D6A-99E9-EBE10AB466B5}</Property>
				<Property Name="PKG_destinations[0].Subdir.Directory" Type="Str">volatus</Property>
				<Property Name="PKG_destinations[0].Subdir.Parent" Type="Str">root_0</Property>
				<Property Name="PKG_destinations[0].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_displayName" Type="Str">Volatus Generic PC</Property>
				<Property Name="PKG_displayVersion" Type="Str"></Property>
				<Property Name="PKG_feedDescription" Type="Str"></Property>
				<Property Name="PKG_feedName" Type="Str"></Property>
				<Property Name="PKG_homepage" Type="Str"></Property>
				<Property Name="PKG_hostname" Type="Str"></Property>
				<Property Name="PKG_maintainer" Type="Str">Derrick Bommarito &lt;&gt;</Property>
				<Property Name="PKG_output" Type="Path">../builds/NI_AB_PROJECTNAME/Generic Volatus Pkg/Package</Property>
				<Property Name="PKG_output.Type" Type="Str">relativeToCommon</Property>
				<Property Name="PKG_packageName" Type="Str">lv-volatus-generic</Property>
				<Property Name="PKG_publishToSystemLink" Type="Bool">false</Property>
				<Property Name="PKG_section" Type="Str">Application Software</Property>
				<Property Name="PKG_shortcuts.Count" Type="Int">1</Property>
				<Property Name="PKG_shortcuts[0].Destination" Type="Str">root_8</Property>
				<Property Name="PKG_shortcuts[0].Name" Type="Str">volatus</Property>
				<Property Name="PKG_shortcuts[0].Path" Type="Path">lv-volatus</Property>
				<Property Name="PKG_shortcuts[0].Target.Child" Type="Str">{11ECEA23-BACC-4337-9C40-5CDAAD7AF22B}</Property>
				<Property Name="PKG_shortcuts[0].Target.Destination" Type="Str">{99E085CF-78B9-4D6A-99E9-EBE10AB466B5}</Property>
				<Property Name="PKG_shortcuts[0].Target.Source" Type="Ref">/My Computer/Build Specifications/Generic Volatus PC</Property>
				<Property Name="PKG_shortcuts[0].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_sources.Count" Type="Int">1</Property>
				<Property Name="PKG_sources[0].Destination" Type="Str">{99E085CF-78B9-4D6A-99E9-EBE10AB466B5}</Property>
				<Property Name="PKG_sources[0].ID" Type="Ref">/My Computer/Build Specifications/Generic Volatus PC</Property>
				<Property Name="PKG_sources[0].Type" Type="Str">EXE Build</Property>
				<Property Name="PKG_synopsis" Type="Str">lv-volatus-general</Property>
				<Property Name="PKG_version" Type="Str">1.1.0</Property>
			</Item>
		</Item>
	</Item>
</Project>
