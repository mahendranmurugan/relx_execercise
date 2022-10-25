Exercise 3:-

	GUI Details:- 
		It's a purchase application
	Coverage in the Script:-
		1. Open a Browser & Navigate the URL
		2. Login the Application
		3. Filter the Product from Low to High range and add a lowest one into the cart
		4. Filter the Product from High to Low range and add a second highest one into the cart
		5. Navigate the Cart and ensure the added items are present in sequential Basis
		6. Fill the User Information and move to Checkout for Final Review
		7. Finish the purchase and ensure successfull message apears at final
		8. Logout the application
	Possibilities of Scenario's in future that is not covered right now
		1. Ensure the items are exists in the Cart if we logout and login back
		2. Ensure Mandatory field warnings are appearing properly in Login and User Information Page
		....etc			


Exercise 4:-

	Service Information :- 
		It helps to filter the pets in the pet store application as per status via GET call
		https://petstore.swagger.io/v2/pet/findByStatus?status=VALUE_TO_CHANGE
	Coverage in the Script:-
		- First we should cover the various status like [available,pending,sold] as per swagger to cover happy flow along with 200 HTTP status code
		- Check invalid[INVALID] status for negative check along with 400 HTTP status code
	
	Possibilities of Scenario's in future that is not covered right now
			1. Mandatory fields as per swagger
			2. Data types like Integer, String, Object...
			3. Response Structure formation, it might block API gateway if its improper

About the Framework:-
	It's a Karate Framework I used, it usually help us to prepare a Automation Scenario's without any glue code. 
	Features:- 
		- It doesn't require any proper setup like Step Definitions to prepare a scenario
		- It has some predefined steps that we can utilize for GUI, API Service Automation
		- We can follow XPath approach to handle JSon & XML responses for our validation

	Features used for the Excercises:-
		- Created a Gradle project for a setup
		- API & GUI Automation Scenario's are prepared without Glue code
		- Created a thread based execution using JUnit runner
		- Unfortunatly I couldn't able to make my gradle project to execute via Command prompt due to improper Gradle version I installed my machine

	How to run the Scenario:-
		- We should open a runner file placed under 'src.test.java.relx_GradleProject.TestParallel.java'
		- Run that file as a JUnit runner, it executes both Execercise3&4 into thread based
		- HTML Report should present in the Target->Karate-reports folder(karate-summary.html)

	Libraries Required:-
		'com.intuit.karate:karate-core:1.3.0.RC2'
		'com.intuit.karate:karate-junit4:1.3.0.RC2'
		'com.intuit.karate:karate-apache:0.9.6.RC4'