* OTC Class Demo

This is a two part class for development and automation for Redgate. The setup of the class is in two parts, each running approximately 90 minutes. 

This is current as of Aug 2019

** Setup

This covers the database environment setup for the system. There are a few items needed for this demo to work smoothly. This section outlines the requirements and then the process for ensuring your environment works. Software and the discussion of environments is shown below.

*** Process for Setting up in Advance
- Connect to the production SQL Server instance. 
- Run 00-1-Prod-Setup.sql
- Run 00-2-Load_SimpleTalk_5_Prod.sqlgen with SQL Data Generator and populate the tables with some data. Project included, instance connection needs to change. Be sure to reset the connection string
- Run 00-3-CleanData.sql
- Run 00-4-Prompt_Setup.sql
- Run 00-5-Provision_Setup.sql
- Clone Github repo to your account if needed (https://github.com/way0utwest/ASimpleTalkDB)
- PoSh Run CreateMaskedImage.ps1 - Change SQL Clone server credentials if needed. Set the correct server name, instance, and clone location

*** Process for Setting up that day

- Ensure 01-DeployDatabase.cmd has the correct developer name and Clone Image
- Ensure 01_NewDeveloper.ps1 has the correct SQL Clone install specified

*** Software

This is a list of the software needed for a Windows environment setup.

- SQL Server instance(s)
- SQL Provision
- SQL Toolbelt (including SQL Search)

*** Environments
This class needs 3 environments for use by the class. These can be on the same or separate instances, but they are designed to work as a flow. For the ease of use, these are set up with numbers to show the flow if each one. The environments should be configured as shown:

- SimpleTalk_1_XXXX (XXXX is the developer name)
- SimpleTalk_3_QA
- SimpleTalk_5_Prod

This can be expanded to include 5 environments. If so, the naming would be:

- SimpleTalk_1_XXXX (XXXX is the developer name)
- SimpleTalk_2_Integration
- SimpleTalk_3_QA
- SimpleTalk_4_Staging
- SimpleTalk_5_Prod

If additional developer flows are needed, use the _1_XXX with different names.

** Demo Flow

This is a list of demos in the class and the broad steps to follow. Feel free to improvise where needed.

*** Demo 1 - Onboard New Developer
This is designed to be a quick demo that shows the setup for a new developer. There are two parts to this
- Create the database environment
- Link to Source Control

The first part is accomplished by 